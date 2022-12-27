import 'package:web3dart/web3dart.dart';

/// {@template client_config}
/// Client base configuration
/// {@endtemplate}
class ChainWalletClientConfig {
  /// {@macro client_config}
  ChainWalletClientConfig({
    required this.rpcUrl,
    required this.wsUrl,
    required this.contractAddress,
    required this.nftStorageApiKey,
  });

  /// Constant config
  factory ChainWalletClientConfig.constants() {
    return ChainWalletClientConfig(
      rpcUrl: '',
      wsUrl: '',
      contractAddress: EthereumAddress.fromHex(''),
      nftStorageApiKey: '',
    );
  }

  /// Remote procedure call URL
  final String rpcUrl;

  /// Web socket URL
  final String wsUrl;

  /// The Ethereum address at which this contract is reachable.
  final EthereumAddress contractAddress;

  /// Network service api key
  final String nftStorageApiKey;
}
