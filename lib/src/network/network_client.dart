import 'package:chain_wallet/chain_wallet.dart';

/// A very simple implementation of a network based on IPFS that stores
/// transaction data publicly on the IPFS network. Actual transaction data
/// is encrypted on the network, but key information is stored in a manner
/// that can be deterministically located by proxies.
abstract class NetworkClientService {
  /// Broadcasts a transaction on the network and returns a 32-bytes locator
  /// that can be used by agents in the network to locate the transaction
  ///
  /// * [tx] The transaction to broadcast
  /// * [txType] The type of the transaction
  Future<String> sendTransaction(Transaction tx, TransactionType txType);

  /// Dummy
  String toHex();
}
