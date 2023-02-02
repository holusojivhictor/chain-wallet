import 'package:chain_wallet/chain_wallet.dart';
import 'package:flutter/foundation.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart' hide Transaction;

/// {@template chain_wallet_client}
/// Chain wallet client library
/// {@endtemplate}
class ChainWalletClient {
  /// {@macro chain_wallet_client}
  ChainWalletClient(this.config, this.client, this.networkService);

  /// Client configurations.
  final ChainWalletClientConfig config;

  /// A client that connects to a JSON rpc API.
  final Web3Client client;

  /// Network client service
  final NetworkClientService? networkService;

  /// Chain Wallet Master contract
  late ChainWalletMaster contract;

  /// Occurs when a transaction event is received.
  late void Function(Uint8List hash)? onTransactionEmittedListener;

  /// Occurs when a transaction event is received.
  late void Function(EthereumAddress agent)? onAgentDeployedListener;

  /// Checks if contract exists and fires up an instance.
  Future<void> connect() async {
    if (client.socketConnector == null) {
      throw Exception('Signer must be connected to an address');
    }

    contract = ChainWalletMaster(
      address: config.contractAddress,
      client: client,
    );

    // call to ensure that contract exists and is connected
    await contract.instanceId();
  }

  /// Create wallet with provided credentials and return agent address.
  Future<EthereumAddress> createWallet({
    required EthPrivateKey credentials,
  }) async {
    _assertListener(onAgentDeployedListener);

    EthereumAddress? agentAddress;

    await contract.createWallet(credentials: credentials);
    contract.agentDeployedEvents().take(1).listen((event) {
      agentAddress = event.agent;
      onAgentDeployedListener!(event.agent);
    });

    await Future<void>.delayed(const Duration(seconds: 30));

    if (agentAddress == null) {
      throw Exception('Wallet creation failed');
    }

    return agentAddress!;
  }

  /// Create a sub-wallet with provided credentials and return agent address.
  Future<EthereumAddress> createSubWallet({
    required EthPrivateKey credentials,
  }) async {
    _assertListener(onAgentDeployedListener);
    EthereumAddress? agentAddress;

    await contract.createAgent(credentials: credentials);

    contract.agentDeployedEvents().take(1).listen((event) {
      agentAddress = event.agent;
      onAgentDeployedListener!(event.agent);
    });

    await Future<void>.delayed(const Duration(seconds: 30));

    if (agentAddress == null) {
      throw Exception('Wallet creation failed');
    }

    return agentAddress!;
  }

  /// Get agent sub wallets
  Future<List<EthereumAddress>> getSubWallets({
    required EthereumAddress sender,
  }) async {
    final response = await client.call(
      contract: contract.self,
      function: contract.self.abi.functions[16],
      params: [],
      sender: sender,
    );

    final agents = response[0] as List<dynamic>;

    return agents.cast<EthereumAddress>();
  }

  /// Disconnect wallet
  Future<void> disconnectWallet({
    required EthPrivateKey credentials,
  }) async {
    await contract.deleteWallet(credentials: credentials);
  }

  /// Cancel wallet disconnection
  Future<void> cancelDisconnection({
    required EthPrivateKey credentials,
  }) async {
    await contract.cancelDelete(credentials: credentials);
  }

  /// Cancel wallet disconnection
  Future<void> confirmDisconnection({
    required EthPrivateKey credentials,
  }) async {
    await contract.confirmDelete(credentials: credentials);
  }

  /// Send ethers privately
  Future<Uint8List> sendEthersPrivately({
    required EthPrivateKey credentials,
    required EthereumAddress subWalletAddress,
    required EthereumAddress to,
    required BigInt value,
    BigInt? gasPrice,
    BigInt? gasLimit,
    BigInt? nonce,
  }) async {
    final agentNonce = await getAgentNonce(
      subWalletAddress,
      sender: credentials.address,
    );
    final price = await contract.client.getGasPrice();

    final tx = Transaction(
      fromAddress: subWalletAddress.hexEip55,
      toAddress: to.hexEip55,
      value: value.toString(),
      nonce: nonce != null ? nonce.toString() : agentNonce.toString(),
      gasLimit: gasLimit != null
          ? gasLimit.toString()
          : BigInt.from(21000).toString(),
      gasPrice:
          gasPrice != null ? gasPrice.toString() : price.getInWei.toString(),
      data: '0x',
      signature: '0x',
    );

    final input = [
      subWalletAddress,
      to,
      value,
      toBigInt(tx.nonce!),
      toBigInt(tx.gasLimit!),
      toBigInt(tx.gasPrice!),
      Uint8List.fromList([]),
      Uint8List.fromList([]),
    ];

    final hash = await contract.computeSendEthersHash(input);
    final sig = credentials.signPersonalMessageToUint8List(hash);

    final signedTx = tx.copyWith(signature: bytesToHex(sig, include0x: true));

    final locator = await networkService!.sendTransaction(
      signedTx,
      TransactionType.sendEthers,
    );

    await contract.initiateProxyTransaction(
      formatLocator(locator),
      credentials: credentials,
    );

    watchHash(hash);

    return hash;
  }

  /// Send ERC20 tokens privately
  Future<InteractionTransactionResponse> sendERC20TokenPrivately({
    required EthPrivateKey credentials,
    required EthereumAddress contractAddress,
    required EthereumAddress subWalletAddress,
    required EthereumAddress to,
    required BigInt value,
    EtherAmount? gasPrice,
    int? gasLimit,
    int? nonce,
  }) async {
    final erc20Contract = Erc20(
      address: contractAddress,
      client: contract.client,
    );

    final unsignedTx = Transaction.callContract(
      contract: erc20Contract.self,
      function: erc20Contract.self.abi.functions[7],
      parameters: [to, value],
    );

    final agentNonce = await getAgentNonce(
      subWalletAddress,
      sender: credentials.address,
    );
    final price = await contract.client.getGasPrice();

    final tx = Transaction(
      fromAddress: subWalletAddress.hexEip55,
      toAddress: contractAddress.hexEip55,
      value: '0',
      nonce: nonce != null ? nonce.toString() : agentNonce.toString(),
      gasLimit: gasLimit != null
          ? gasLimit.toString()
          : BigInt.from(300000).toString(),
      gasPrice:
          gasPrice != null ? gasPrice.toString() : price.getInWei.toString(),
      data: unsignedTx.data,
      signature: '0x',
    );

    final input = [
      subWalletAddress,
      contractAddress,
      toBigInt(tx.value!),
      toBigInt(tx.nonce!),
      toBigInt(tx.gasLimit!),
      toBigInt(tx.gasPrice!),
      hexToBytes(unsignedTx.data),
      Uint8List.fromList([]),
    ];

    final hash = await contract.computeInteractHash(input);
    final sig = credentials.signPersonalMessageToUint8List(hash);

    final signedTx = tx.copyWith(signature: bytesToHex(sig, include0x: true));

    final locator = await networkService!.sendTransaction(
      signedTx,
      TransactionType.contractInteraction,
    );

    await contract.initiateProxyTransaction(
      formatLocator(locator),
      credentials: credentials,
    );

    watchHash(hash);

    return InteractionTransactionResponse(
      data: unsignedTx.data,
      hash: bytesToHex(hash, include0x: true),
    );
  }

  /// Call to get Agent Nonce
  Future<BigInt> getAgentNonce(
    EthereumAddress subWalletAddress, {
    required EthereumAddress sender,
  }) async {
    final response = await client.call(
      contract: contract.self,
      function: contract.self.abi.functions[15],
      params: [subWalletAddress],
      sender: sender,
    );

    return response[0] as BigInt;
  }

  /// Set onTransactionEmittedListener
  Future<void> setOnTransactionEmittedListener(
    void Function(Uint8List hash, TransactionReceipt? receipt) fn,
  ) async {
    onTransactionEmittedListener = (hash) async {
      final event = await filterEvent(hash);
      await client
          .getTransactionReceipt(event.transactionHash ?? '0x')
          .then((receipt) => fn(hash, receipt));
    };
  }

  /// Set onAgentDeployedListener
  void setOnAgentDeployedListener(
    void Function(EthereumAddress agent) fn,
  ) {
    onAgentDeployedListener = (agent) {
      fn(agent);
    };
  }

  /// Listen on transaction events
  void watchHash(Uint8List hash) {
    final listener = onTransactionEmittedListener;

    if (listener == null) {
      throw Exception('Listener must be configured before watching');
    }

    contract.transactionCompletedEvents().listen((event) {
      if (listEquals(event.transactionHash, hash)) {
        listener(hash);
      }
    });
  }

  /// Get last transaction filter event
  Future<FilterEvent> filterEvent(Uint8List txHash) {
    final event = contract.self.event('TransactionCompleted');
    final filter = FilterOptions.events(
      contract: contract.self,
      event: event,
    );
    return client.events(filter).firstWhere((el) {
      final decoded = event.decodeResults(
        el.topics!,
        el.data!,
      );
      final hash = decoded[0] as Uint8List;

      return listEquals(txHash, hash);
    });
  }

  /// Parses [source] as a, possibly signed, integer literal and returns its
  /// value.
  static BigInt toBigInt(String source) {
    return BigInt.parse(source);
  }

  /// Convert locator to byte sequence
  static Uint8List formatLocator(String locator) {
    return utf8Encode(locator);
  }

  void _assertListener(Function? listener) {
    assert(listener != null, 'Listener must be configured');
  }

  /// Closes resources managed by this client.
  Future<void> close() async {
    await client.dispose();
  }
}
