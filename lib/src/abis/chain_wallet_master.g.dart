// Generated code, do not modify. Run `build_runner build` to re-generate!
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:web3dart/web3dart.dart' as _i1;
import 'dart:typed_data' as _i2;

final _contractAbi = _i1.ContractAbi.fromJson(
  '[{"inputs":[],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"previousAdmin","type":"address"},{"indexed":false,"internalType":"address","name":"newAdmin","type":"address"}],"name":"AdminChanged","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"walletId","type":"bytes32"},{"indexed":false,"internalType":"address","name":"agent","type":"address"}],"name":"AgentDeployed","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"beacon","type":"address"}],"name":"BeaconUpgraded","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"newAmount","type":"uint256"}],"name":"MaxStakeAmountChanged","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"newAmount","type":"uint256"}],"name":"MinStakeAmountChanged","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"account","type":"address"}],"name":"Paused","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"role","type":"bytes32"},{"indexed":true,"internalType":"bytes32","name":"previousAdminRole","type":"bytes32"},{"indexed":true,"internalType":"bytes32","name":"newAdminRole","type":"bytes32"}],"name":"RoleAdminChanged","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"role","type":"bytes32"},{"indexed":true,"internalType":"address","name":"account","type":"address"},{"indexed":true,"internalType":"address","name":"sender","type":"address"}],"name":"RoleGranted","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"role","type":"bytes32"},{"indexed":true,"internalType":"address","name":"account","type":"address"},{"indexed":true,"internalType":"address","name":"sender","type":"address"}],"name":"RoleRevoked","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"staker","type":"address"},{"indexed":false,"internalType":"uint256","name":"totalStakes","type":"uint256"}],"name":"StakesAdded","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"staker","type":"address"}],"name":"StakesWithdrawn","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"transactionHash","type":"bytes32"}],"name":"TransactionCompleted","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"bytes","name":"locator","type":"bytes"}],"name":"TransactionCreated","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"addr","type":"address"}],"name":"TreasuryAddressChanged","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"account","type":"address"}],"name":"Unpaused","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"implementation","type":"address"}],"name":"Upgraded","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"owner","type":"address"},{"indexed":false,"internalType":"bytes32","name":"walletId","type":"bytes32"}],"name":"WalletCreated","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"owner","type":"address"}],"name":"WalletDeleted","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"sharer","type":"address"},{"indexed":true,"internalType":"address","name":"recipient","type":"address"},{"indexed":false,"internalType":"bytes32","name":"walletId","type":"bytes32"}],"name":"WalletShared","type":"event"},{"inputs":[],"name":"DEFAULT_ADMIN_ROLE","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"PAUSER_ROLE","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"STAKING_MANAGER_ROLE","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"SUPPORTED_AGENT_VERSION","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"TREASURY_MANAGER_ROLE","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"UPGRADER_ROLE","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"","type":"address"}],"name":"blockList","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"cancelDelete","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"components":[{"internalType":"address","name":"agentAddress","type":"address"},{"internalType":"address","name":"toAddress","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"},{"internalType":"uint256","name":"nonce","type":"uint256"},{"internalType":"uint256","name":"gasLimit","type":"uint256"},{"internalType":"uint256","name":"gasPrice","type":"uint256"},{"internalType":"bytes","name":"data","type":"bytes"},{"internalType":"bytes","name":"signature","type":"bytes"}],"internalType":"struct ProxiableWalletManagerUpgradeable.ProxyTransactionInput","name":"input","type":"tuple"}],"name":"computeInteractHash","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[{"components":[{"internalType":"address","name":"agentAddress","type":"address"},{"internalType":"address","name":"toAddress","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"},{"internalType":"uint256","name":"nonce","type":"uint256"},{"internalType":"uint256","name":"gasLimit","type":"uint256"},{"internalType":"uint256","name":"gasPrice","type":"uint256"},{"internalType":"bytes","name":"data","type":"bytes"},{"internalType":"bytes","name":"signature","type":"bytes"}],"internalType":"struct ProxiableWalletManagerUpgradeable.ProxyTransactionInput","name":"input","type":"tuple"}],"name":"computeSendEthersHash","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"confirmDelete","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"createAgent","outputs":[],"stateMutability":"payable","type":"function"},{"inputs":[],"name":"createWallet","outputs":[],"stateMutability":"payable","type":"function"},{"inputs":[],"name":"deleteWallet","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"agentAddress","type":"address"}],"name":"getAgentNonce","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getAgents","outputs":[{"internalType":"address[]","name":"","type":"address[]"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"}],"name":"getRoleAdmin","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"grantRole","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"hasRole","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes4","name":"_instanceId","type":"bytes4"},{"internalType":"address","name":"treasuryAddress","type":"address"},{"internalType":"uint256","name":"minStakes","type":"uint256"},{"internalType":"uint256","name":"maxStakes","type":"uint256"},{"internalType":"uint16","name":"minPoolShare","type":"uint16"}],"name":"initialize","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes","name":"locator","type":"bytes"}],"name":"initiateProxyTransaction","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"instanceId","outputs":[{"internalType":"bytes4","name":"","type":"bytes4"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"agentAddress","type":"address"},{"internalType":"address","name":"contractAddress","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"},{"internalType":"bytes","name":"data","type":"bytes"}],"name":"interact","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"components":[{"internalType":"address","name":"agentAddress","type":"address"},{"internalType":"address","name":"toAddress","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"},{"internalType":"uint256","name":"nonce","type":"uint256"},{"internalType":"uint256","name":"gasLimit","type":"uint256"},{"internalType":"uint256","name":"gasPrice","type":"uint256"},{"internalType":"bytes","name":"data","type":"bytes"},{"internalType":"bytes","name":"signature","type":"bytes"}],"internalType":"struct ProxiableWalletManagerUpgradeable.ProxyTransactionInput","name":"input","type":"tuple"}],"name":"interactAsProxy","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"isDeleting","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"maxStakeAmount","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"minPoolSharePercentage","outputs":[{"internalType":"uint16","name":"","type":"uint16"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"minStakeAmount","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"pause","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"paused","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"proxiableUUID","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"renounceRole","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"revokeRole","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"agentAddress","type":"address"},{"internalType":"address","name":"recipientAddress","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"}],"name":"sendEther","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"components":[{"internalType":"address","name":"agentAddress","type":"address"},{"internalType":"address","name":"toAddress","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"},{"internalType":"uint256","name":"nonce","type":"uint256"},{"internalType":"uint256","name":"gasLimit","type":"uint256"},{"internalType":"uint256","name":"gasPrice","type":"uint256"},{"internalType":"bytes","name":"data","type":"bytes"},{"internalType":"bytes","name":"signature","type":"bytes"}],"internalType":"struct ProxiableWalletManagerUpgradeable.ProxyTransactionInput","name":"input","type":"tuple"}],"name":"sendEtherAsProxy","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"setMaxStakeAmount","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"setMinStakeAmount","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"addr","type":"address"}],"name":"setTreasuryAddress","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"recipient","type":"address"}],"name":"shareWallet","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"stakeEthers","outputs":[],"stateMutability":"payable","type":"function"},{"inputs":[{"internalType":"address","name":"","type":"address"}],"name":"stakes","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes4","name":"interfaceId","type":"bytes4"}],"name":"supportsInterface","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"totalStakes","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"treasury","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"unpause","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"newImplementation","type":"address"}],"name":"upgradeTo","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"newImplementation","type":"address"},{"internalType":"bytes","name":"data","type":"bytes"}],"name":"upgradeToAndCall","outputs":[],"stateMutability":"payable","type":"function"},{"inputs":[],"name":"withdrawStakes","outputs":[],"stateMutability":"payable","type":"function"}]',
  'ChainWalletMaster',
);

class ChainWalletMaster extends _i1.GeneratedContract {
  ChainWalletMaster({
    required _i1.EthereumAddress address,
    required _i1.Web3Client client,
    int? chainId,
  }) : super(
          _i1.DeployedContract(
            _contractAbi,
            address,
          ),
          client,
          chainId,
        );

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i2.Uint8List> DEFAULT_ADMIN_ROLE({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[1];
    assert(checkSignature(function, 'a217fddf'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i2.Uint8List);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i2.Uint8List> PAUSER_ROLE({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[2];
    assert(checkSignature(function, 'e63ab1e9'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i2.Uint8List);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i2.Uint8List> STAKING_MANAGER_ROLE({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[3];
    assert(checkSignature(function, '3937c0b3'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i2.Uint8List);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i2.Uint8List> SUPPORTED_AGENT_VERSION({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[4];
    assert(checkSignature(function, 'b3ccfeb2'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i2.Uint8List);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i2.Uint8List> TREASURY_MANAGER_ROLE({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[5];
    assert(checkSignature(function, 'ebdf690f'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i2.Uint8List);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i2.Uint8List> UPGRADER_ROLE({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[6];
    assert(checkSignature(function, 'f72c0d8b'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i2.Uint8List);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<bool> blockList(
    _i1.EthereumAddress $param0, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[7];
    assert(checkSignature(function, 'b5399283'));
    final params = [$param0];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as bool);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> cancelDelete({
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[8];
    assert(checkSignature(function, 'eb2850ca'));
    final params = [];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i2.Uint8List> computeInteractHash(
    dynamic input, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[9];
    assert(checkSignature(function, '39d442a3'));
    final params = [input];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i2.Uint8List);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i2.Uint8List> computeSendEthersHash(
    dynamic input, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[10];
    assert(checkSignature(function, '051e32c4'));
    final params = [input];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i2.Uint8List);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> confirmDelete({
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[11];
    assert(checkSignature(function, '2b93185b'));
    final params = [];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> createAgent({
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[12];
    assert(checkSignature(function, '457e8e1e'));
    final params = [];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> createWallet({
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[13];
    assert(checkSignature(function, '11ebbf24'));
    final params = [];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> deleteWallet({
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[14];
    assert(checkSignature(function, 'ccf1679d'));
    final params = [];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> getAgentNonce(
    _i1.EthereumAddress agentAddress, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[15];
    assert(checkSignature(function, '223330d5'));
    final params = [agentAddress];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<_i1.EthereumAddress>> getAgents({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[16];
    assert(checkSignature(function, 'eac3fda4'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as List<dynamic>).cast<_i1.EthereumAddress>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i2.Uint8List> getRoleAdmin(
    _i2.Uint8List role, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[17];
    assert(checkSignature(function, '248a9ca3'));
    final params = [role];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i2.Uint8List);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> grantRole(
    _i2.Uint8List role,
    _i1.EthereumAddress account, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[18];
    assert(checkSignature(function, '2f2ff15d'));
    final params = [
      role,
      account,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<bool> hasRole(
    _i2.Uint8List role,
    _i1.EthereumAddress account, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[19];
    assert(checkSignature(function, '91d14854'));
    final params = [
      role,
      account,
    ];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as bool);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> initialize(
    _i2.Uint8List _instanceId,
    _i1.EthereumAddress treasuryAddress,
    BigInt minStakes,
    BigInt maxStakes,
    BigInt minPoolShare, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[20];
    assert(checkSignature(function, '01848795'));
    final params = [
      _instanceId,
      treasuryAddress,
      minStakes,
      maxStakes,
      minPoolShare,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> initiateProxyTransaction(
    _i2.Uint8List locator, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[21];
    assert(checkSignature(function, '9f4f99b7'));
    final params = [locator];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i2.Uint8List> instanceId({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[22];
    assert(checkSignature(function, '04fad28d'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i2.Uint8List);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> interact(
    _i1.EthereumAddress agentAddress,
    _i1.EthereumAddress contractAddress,
    BigInt value,
    _i2.Uint8List data, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[23];
    assert(checkSignature(function, '53de525a'));
    final params = [
      agentAddress,
      contractAddress,
      value,
      data,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> interactAsProxy(
    dynamic input, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[24];
    assert(checkSignature(function, 'f3a09d8e'));
    final params = [input];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<bool> isDeleting({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[25];
    assert(checkSignature(function, '33fab0df'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as bool);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> maxStakeAmount({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[26];
    assert(checkSignature(function, '5d80ca32'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> minPoolSharePercentage({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[27];
    assert(checkSignature(function, 'b6b1a303'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> minStakeAmount({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[28];
    assert(checkSignature(function, 'f1887684'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> pause({
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[29];
    assert(checkSignature(function, '8456cb59'));
    final params = [];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<bool> paused({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[30];
    assert(checkSignature(function, '5c975abb'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as bool);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i2.Uint8List> proxiableUUID({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[31];
    assert(checkSignature(function, '52d1902d'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i2.Uint8List);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> renounceRole(
    _i2.Uint8List role,
    _i1.EthereumAddress account, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[32];
    assert(checkSignature(function, '36568abe'));
    final params = [
      role,
      account,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> revokeRole(
    _i2.Uint8List role,
    _i1.EthereumAddress account, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[33];
    assert(checkSignature(function, 'd547741f'));
    final params = [
      role,
      account,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> sendEther(
    _i1.EthereumAddress agentAddress,
    _i1.EthereumAddress recipientAddress,
    BigInt value, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[34];
    assert(checkSignature(function, '3885fd3d'));
    final params = [
      agentAddress,
      recipientAddress,
      value,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> sendEtherAsProxy(
    dynamic input, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[35];
    assert(checkSignature(function, '58ca4569'));
    final params = [input];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> setMaxStakeAmount(
    BigInt amount, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[36];
    assert(checkSignature(function, 'dcc2a55e'));
    final params = [amount];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> setMinStakeAmount(
    BigInt amount, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[37];
    assert(checkSignature(function, 'eb4af045'));
    final params = [amount];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> setTreasuryAddress(
    _i1.EthereumAddress addr, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[38];
    assert(checkSignature(function, '6605bfda'));
    final params = [addr];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> shareWallet(
    _i1.EthereumAddress recipient, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[39];
    assert(checkSignature(function, '043c6c80'));
    final params = [recipient];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> stakeEthers({
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[40];
    assert(checkSignature(function, 'eef7d211'));
    final params = [];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> stakes(
    _i1.EthereumAddress $param32, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[41];
    assert(checkSignature(function, '16934fc4'));
    final params = [$param32];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<bool> supportsInterface(
    _i2.Uint8List interfaceId, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[42];
    assert(checkSignature(function, '01ffc9a7'));
    final params = [interfaceId];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as bool);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> totalStakes({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[43];
    assert(checkSignature(function, 'bf9befb1'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i1.EthereumAddress> treasury({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[44];
    assert(checkSignature(function, '61d027b3'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i1.EthereumAddress);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> unpause({
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[45];
    assert(checkSignature(function, '3f4ba83a'));
    final params = [];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> upgradeTo(
    _i1.EthereumAddress newImplementation, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[46];
    assert(checkSignature(function, '3659cfe6'));
    final params = [newImplementation];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> upgradeToAndCall(
    _i1.EthereumAddress newImplementation,
    _i2.Uint8List data, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[47];
    assert(checkSignature(function, '4f1ef286'));
    final params = [
      newImplementation,
      data,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> withdrawStakes({
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[48];
    assert(checkSignature(function, '289ed738'));
    final params = [];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// Returns a live stream of all AdminChanged events emitted by this contract.
  Stream<AdminChanged> adminChangedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('AdminChanged');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return AdminChanged(decoded);
    });
  }

  /// Returns a live stream of all AgentDeployed events emitted by this contract.
  Stream<AgentDeployed> agentDeployedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('AgentDeployed');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return AgentDeployed(decoded);
    });
  }

  /// Returns a live stream of all BeaconUpgraded events emitted by this contract.
  Stream<BeaconUpgraded> beaconUpgradedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('BeaconUpgraded');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return BeaconUpgraded(decoded);
    });
  }

  /// Returns a live stream of all MaxStakeAmountChanged events emitted by this contract.
  Stream<MaxStakeAmountChanged> maxStakeAmountChangedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('MaxStakeAmountChanged');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return MaxStakeAmountChanged(decoded);
    });
  }

  /// Returns a live stream of all MinStakeAmountChanged events emitted by this contract.
  Stream<MinStakeAmountChanged> minStakeAmountChangedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('MinStakeAmountChanged');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return MinStakeAmountChanged(decoded);
    });
  }

  /// Returns a live stream of all Paused events emitted by this contract.
  Stream<Paused> pausedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('Paused');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return Paused(decoded);
    });
  }

  /// Returns a live stream of all RoleAdminChanged events emitted by this contract.
  Stream<RoleAdminChanged> roleAdminChangedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('RoleAdminChanged');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return RoleAdminChanged(decoded);
    });
  }

  /// Returns a live stream of all RoleGranted events emitted by this contract.
  Stream<RoleGranted> roleGrantedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('RoleGranted');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return RoleGranted(decoded);
    });
  }

  /// Returns a live stream of all RoleRevoked events emitted by this contract.
  Stream<RoleRevoked> roleRevokedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('RoleRevoked');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return RoleRevoked(decoded);
    });
  }

  /// Returns a live stream of all StakesAdded events emitted by this contract.
  Stream<StakesAdded> stakesAddedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('StakesAdded');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return StakesAdded(decoded);
    });
  }

  /// Returns a live stream of all StakesWithdrawn events emitted by this contract.
  Stream<StakesWithdrawn> stakesWithdrawnEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('StakesWithdrawn');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return StakesWithdrawn(decoded);
    });
  }

  /// Returns a live stream of all TransactionCompleted events emitted by this contract.
  Stream<TransactionCompleted> transactionCompletedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('TransactionCompleted');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return TransactionCompleted(decoded);
    });
  }

  /// Returns a live stream of all TransactionCreated events emitted by this contract.
  Stream<TransactionCreated> transactionCreatedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('TransactionCreated');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return TransactionCreated(decoded);
    });
  }

  /// Returns a live stream of all TreasuryAddressChanged events emitted by this contract.
  Stream<TreasuryAddressChanged> treasuryAddressChangedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('TreasuryAddressChanged');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return TreasuryAddressChanged(decoded);
    });
  }

  /// Returns a live stream of all Unpaused events emitted by this contract.
  Stream<Unpaused> unpausedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('Unpaused');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return Unpaused(decoded);
    });
  }

  /// Returns a live stream of all Upgraded events emitted by this contract.
  Stream<Upgraded> upgradedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('Upgraded');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return Upgraded(decoded);
    });
  }

  /// Returns a live stream of all WalletCreated events emitted by this contract.
  Stream<WalletCreated> walletCreatedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('WalletCreated');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return WalletCreated(decoded);
    });
  }

  /// Returns a live stream of all WalletDeleted events emitted by this contract.
  Stream<WalletDeleted> walletDeletedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('WalletDeleted');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return WalletDeleted(decoded);
    });
  }

  /// Returns a live stream of all WalletShared events emitted by this contract.
  Stream<WalletShared> walletSharedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('WalletShared');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return WalletShared(decoded);
    });
  }
}

class AdminChanged {
  AdminChanged(List<dynamic> response)
      : previousAdmin = (response[0] as _i1.EthereumAddress),
        newAdmin = (response[1] as _i1.EthereumAddress);

  final _i1.EthereumAddress previousAdmin;

  final _i1.EthereumAddress newAdmin;
}

class AgentDeployed {
  AgentDeployed(List<dynamic> response)
      : walletId = (response[0] as _i2.Uint8List),
        agent = (response[1] as _i1.EthereumAddress);

  final _i2.Uint8List walletId;

  final _i1.EthereumAddress agent;
}

class BeaconUpgraded {
  BeaconUpgraded(List<dynamic> response)
      : beacon = (response[0] as _i1.EthereumAddress);

  final _i1.EthereumAddress beacon;
}

class MaxStakeAmountChanged {
  MaxStakeAmountChanged(List<dynamic> response)
      : newAmount = (response[0] as BigInt);

  final BigInt newAmount;
}

class MinStakeAmountChanged {
  MinStakeAmountChanged(List<dynamic> response)
      : newAmount = (response[0] as BigInt);

  final BigInt newAmount;
}

class Paused {
  Paused(List<dynamic> response)
      : account = (response[0] as _i1.EthereumAddress);

  final _i1.EthereumAddress account;
}

class RoleAdminChanged {
  RoleAdminChanged(List<dynamic> response)
      : role = (response[0] as _i2.Uint8List),
        previousAdminRole = (response[1] as _i2.Uint8List),
        newAdminRole = (response[2] as _i2.Uint8List);

  final _i2.Uint8List role;

  final _i2.Uint8List previousAdminRole;

  final _i2.Uint8List newAdminRole;
}

class RoleGranted {
  RoleGranted(List<dynamic> response)
      : role = (response[0] as _i2.Uint8List),
        account = (response[1] as _i1.EthereumAddress),
        sender = (response[2] as _i1.EthereumAddress);

  final _i2.Uint8List role;

  final _i1.EthereumAddress account;

  final _i1.EthereumAddress sender;
}

class RoleRevoked {
  RoleRevoked(List<dynamic> response)
      : role = (response[0] as _i2.Uint8List),
        account = (response[1] as _i1.EthereumAddress),
        sender = (response[2] as _i1.EthereumAddress);

  final _i2.Uint8List role;

  final _i1.EthereumAddress account;

  final _i1.EthereumAddress sender;
}

class StakesAdded {
  StakesAdded(List<dynamic> response)
      : staker = (response[0] as _i1.EthereumAddress),
        totalStakes = (response[1] as BigInt);

  final _i1.EthereumAddress staker;

  final BigInt totalStakes;
}

class StakesWithdrawn {
  StakesWithdrawn(List<dynamic> response)
      : staker = (response[0] as _i1.EthereumAddress);

  final _i1.EthereumAddress staker;
}

class TransactionCompleted {
  TransactionCompleted(List<dynamic> response)
      : transactionHash = (response[0] as _i2.Uint8List);

  final _i2.Uint8List transactionHash;
}

class TransactionCreated {
  TransactionCreated(List<dynamic> response)
      : locator = (response[0] as _i2.Uint8List);

  final _i2.Uint8List locator;
}

class TreasuryAddressChanged {
  TreasuryAddressChanged(List<dynamic> response)
      : addr = (response[0] as _i1.EthereumAddress);

  final _i1.EthereumAddress addr;
}

class Unpaused {
  Unpaused(List<dynamic> response)
      : account = (response[0] as _i1.EthereumAddress);

  final _i1.EthereumAddress account;
}

class Upgraded {
  Upgraded(List<dynamic> response)
      : implementation = (response[0] as _i1.EthereumAddress);

  final _i1.EthereumAddress implementation;
}

class WalletCreated {
  WalletCreated(List<dynamic> response)
      : owner = (response[0] as _i1.EthereumAddress),
        walletId = (response[1] as _i2.Uint8List);

  final _i1.EthereumAddress owner;

  final _i2.Uint8List walletId;
}

class WalletDeleted {
  WalletDeleted(List<dynamic> response)
      : owner = (response[0] as _i1.EthereumAddress);

  final _i1.EthereumAddress owner;
}

class WalletShared {
  WalletShared(List<dynamic> response)
      : sharer = (response[0] as _i1.EthereumAddress),
        recipient = (response[1] as _i1.EthereumAddress),
        walletId = (response[2] as _i2.Uint8List);

  final _i1.EthereumAddress sharer;

  final _i1.EthereumAddress recipient;

  final _i2.Uint8List walletId;
}
