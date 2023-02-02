// ignore_for_file: prefer_constructors_over_static_methods

import 'dart:typed_data';

import 'package:bip39/bip39.dart';
import 'package:chain_wallet/chain_wallet.dart';
import 'package:dart_bip32_bip44/dart_bip32_bip44.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// {@template wallet_keys}
/// Access the keys and mnemonics of a created wallet.
/// {@endtemplate}
class WalletKeys {
  /// {@macro wallet_keys}
  WalletKeys({
    required this.privateKey,
    required this.publicKey,
    this.mnemonic,
  });

  /// Private key
  final String privateKey;

  /// Wallet address or public key
  final String publicKey;

  /// Mnemonic
  String? mnemonic;
}

/// {@template chain_wallet_manager}
/// The chain wallet manager class, responsible for creating wallets, and
/// sub-wallets. Also sending ethers and tokens privately.
/// {@endtemplate}
class ChainWalletManager {
  /// {@macro chain_wallet_manager}
  ChainWalletManager._internal();

  static ChainWalletManager? _instance;

  /// Get manager instance
  static ChainWalletManager get instance {
    return _instance ??= ChainWalletManager._internal();
  }

  static const String _pathForPublicKey = "m/44'/60'/0'/0";
  static const String _pathForPrivateKey = "m/44'/60'/0'/0/0";

  /// Storage provider
  SecureStorageProvider get storageProvider => SecureStorageProvider();

  final Map<String, WalletEventHandler> _eventHandlerMap = {};

  late ChainWalletClient _walletClient;

  /// Chain wallet client
  ChainWalletClient get walletClient => _walletClient;

  /// Signer credentials
  late EthPrivateKey credentials;

  /// Adds the wallet manager event handler. After calling this method,
  /// you can handle for manager events when they arrive.
  ///
  /// * [identifier] The custom handler identifier, is used to find the
  /// corresponding handler.
  ///
  /// * [handler] The handler for chat event. See [WalletEventHandler].
  void addEventHandler(
    String identifier,
    WalletEventHandler handler,
  ) {
    _eventHandlerMap[identifier] = handler;
  }

  /// Remove the wallet manager event handler.
  ///
  /// * [identifier] The custom handler identifier.
  void removeEventHandler(String identifier) {
    _eventHandlerMap.remove(identifier);
  }

  /// Initializes the Client.
  ///
  /// * [config] The configurations: [ChainWalletClientConfig].
  /// Ensure that you set this parameter.
  Future<void> init(ChainWalletClientConfig config) async {
    final wsUri = Uri.parse(config.wsUrl);
    final client = Web3Client(
      config.rpcUrl,
      Client(),
      socketConnector: () => WebSocketChannel.connect(wsUri).cast<String>(),
    );

    final networkService = DefaultIpfsNetwork(
      DefaultIpfsNetworkConfig(nftStorageApiKey: config.nftStorageApiKey),
    );

    _walletClient = ChainWalletClient(config, client, networkService);
  }

  /// Connect to wallet client and set listeners.
  Future<void> connect() async {
    await walletClient.connect();
    await fetchCredentials();

    await walletClient.setOnTransactionEmittedListener(_onTransactionEmitted);
    walletClient.setOnAgentDeployedListener(_onAgentDeployed);
  }

  /// Create master wallet.
  /// Returns wallet address (also known as public key)
  /// and private key. Private key is used to restore web3 wallet on all
  /// platforms.
  Future<WalletKeys> createMasterWallet() async {
    final mnemonic = await generateAndSaveMnemonic();

    final privateKey = await getPrivateKeyFromMnemonic();
    final ethPrivateKey = EthPrivateKey.fromHex(privateKey);
    final walletAddress = ethPrivateKey.address.hexEip55;
    await storeKeys(privateKey, walletAddress);

    return WalletKeys(
      privateKey: privateKey,
      publicKey: walletAddress,
      mnemonic: mnemonic,
    );
  }

  /// Import master wallet.
  /// Returns wallet address (also known as public key)
  /// It can be used to generate wallet address from any web3 private key
  Future<WalletKeys> importMasterWallet({required String privateKey}) async {
    final trimmedKey = getPrettyPrivateKey(privateKey);

    final priKey = EthPrivateKey.fromHex(trimmedKey);
    final walletAddress = priKey.address.hexEip55;
    await storeKeys(privateKey, walletAddress);

    return WalletKeys(
      privateKey: privateKey,
      publicKey: walletAddress,
    );
  }

  /// Import master wallet from mnemonic.
  /// Returns wallet address (also known as public key)
  /// It can be used to generate wallet address from any web3 private key
  Future<WalletKeys> importMasterWalletFromMnemonic({
    required String mnemonic,
  }) async {
    await storageProvider.saveMnemonic(mnemonic);

    final privateKey = await getPrivateKeyFromMnemonic();
    final ethPrivateKey = EthPrivateKey.fromHex(privateKey);
    final walletAddress = ethPrivateKey.address.hexEip55;
    await storeKeys(privateKey, walletAddress);

    return WalletKeys(
      privateKey: privateKey,
      publicKey: walletAddress,
      mnemonic: mnemonic,
    );
  }

  /// Create wallet with provided credentials and return agent address.
  Future<EthereumAddress> createWallet() async {
    final agent = await walletClient.createWallet(credentials: credentials);

    return agent;
  }

  /// Create a sub-wallet with provided credentials and return agent address.
  Future<EthereumAddress> createSubWallet() async {
    final agent = await walletClient.createSubWallet(credentials: credentials);

    return agent;
  }

  /// Get agent sub wallets
  Future<List<EthereumAddress>> getSubWallets() async {
    final agents = await walletClient.getSubWallets(
      sender: credentials.address,
    );

    return agents;
  }

  /// Get symbol and decimals from contract address
  Future<ERC20Token> addERC20Token({
    required EthereumAddress tokenAddress,
  }) async {
    final contract = Erc20(address: tokenAddress, client: walletClient.client);

    return ERC20Token(
      name: await contract.name(),
      symbol: await contract.symbol(),
      decimals: await contract.decimals(),
      contractAddress: contract.self.address.hexEip55,
    );
  }

  /// Send ethers privately
  Future<Uint8List> sendEthersPrivately({
    required EthereumAddress currentSubWallet,
    required EthereumAddress recipient,
    required BigInt amount,
  }) async {
    final hash = await walletClient.sendEthersPrivately(
      credentials: credentials,
      subWalletAddress: currentSubWallet,
      to: recipient,
      value: amount,
      gasLimit: BigInt.from(150000),
    );

    return hash;
  }

  /// Send ERC20 tokens privately
  Future<String> sendERC20TokenPrivately({
    required EthereumAddress contractAddress,
    required EthereumAddress currentSubWallet,
    required EthereumAddress recipient,
    required String amountStr,
    BigInt? decimals,
  }) async {
    final amount = parseTokenAmount(amountStr, decimals);

    final response = await walletClient.sendERC20TokenPrivately(
      credentials: credentials,
      contractAddress: contractAddress,
      subWalletAddress: currentSubWallet,
      to: recipient,
      value: amount,
    );

    return response.hash;
  }

  /// Generate and save Mnemonic
  Future<String> generateAndSaveMnemonic() async {
    final mnemonic = generateMnemonic();
    await storageProvider.saveMnemonic(mnemonic);

    return mnemonic;
  }

  /// Get private key from mnemonic
  Future<String> getPrivateKeyFromMnemonic() async {
    final mnemonic = await storageProvider.getMnemonic();
    final chain = _getChainByMnemonic(mnemonic);
    final extendedKey = chain.forPath(_pathForPrivateKey);
    return extendedKey.privateKeyHex();
  }

  /// Returns BIP32 Extended Public Key
  Future<String> getPublicKeyFromMnemonic() async {
    final mnemonic = await storageProvider.getMnemonic();
    final chain = _getChainByMnemonic(mnemonic);
    final extendedKey = chain.forPath(_pathForPublicKey);
    return extendedKey.publicKey().toString();
  }

  /// Fetch signer credentials
  Future<void> fetchCredentials() async {
    final privateKey = await storageProvider.getPrivateKey();

    if (privateKey.isEmpty) {
      throw Exception('Credentials not found');
    }
    credentials = EthPrivateKey.fromHex(privateKey);
  }

  /// Store private key and wallet address
  Future<void> storeKeys(String privateKey, String walletAddress) async {
    await storageProvider.saveAddress(walletAddress);
    await storageProvider.savePrivateKey(privateKey);
  }

  /// Returns BIP32 Root Key
  Chain _getChainByMnemonic(String mnemonic) {
    final seed = mnemonicToSeedHex(mnemonic); // Returns BIP39 Seed
    return Chain.seed(seed);
  }

  /// Parse token amount per decimal count
  BigInt parseTokenAmount(String amount, BigInt? decimals) {
    return parseFixed(amount, decimals: decimals);
  }

  Future<void> _onTransactionEmitted(
    Uint8List hash,
    TransactionReceipt? receipt,
  ) async {
    for (final item in _eventHandlerMap.values) {
      item.onTransactionEmitted?.call(hash, receipt);
    }
  }

  Future<void> _onAgentDeployed(EthereumAddress agent) async {
    for (final item in _eventHandlerMap.values) {
      item.onAgentDeployed?.call(agent);
    }
  }
}

/// The wallet event handler.
class WalletEventHandler {
  /// The wallet event handler.
  ///
  /// * [onTransactionEmitted] Transaction completed callback.
  /// * [onAgentDeployed] Agent deployed callback.
  WalletEventHandler({
    this.onTransactionEmitted,
    this.onAgentDeployed,
  });

  /// Occurs when a transaction event is received.
  /// This callback is triggered to notify the user when a transaction has
  /// been completed.
  final void Function(
    Uint8List hash,
    TransactionReceipt? receipt,
  )? onTransactionEmitted;

  /// Occurs when an agent is deployed by the contract.
  /// Triggered when an agentDeployed event is emitted by the contract.
  final void Function(EthereumAddress agent)? onAgentDeployed;
}

/// ERC20 Token class
class ERC20Token {
  /// ERC20 Token class
  ERC20Token({
    required this.name,
    required this.symbol,
    required this.decimals,
    required this.contractAddress,
  });

  /// Token name
  final String name;

  /// Token symbol
  final String symbol;

  /// Token decimal count
  final BigInt decimals;

  /// Token contract address
  final String contractAddress;
}
