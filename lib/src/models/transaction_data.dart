import 'dart:typed_data';

import 'package:chain_wallet/chain_wallet.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

/// Transaction data
class TransactionData {
  /// Parse a map literal
  TransactionData.fromMap(Map<String, dynamic> map)
      : type = map['type'] as TransactionType,
        subWallet = map['subWallet'] as EthereumAddress,
        hash = map['hash'] as String,
        data = map['data'] != null
            ? hexToBytes(map['data'] as String) : null,
        to = map['to'] != null
            ? map['to'] as EthereumAddress : null,
        amount = EtherAmount.inWei(map['amount'] as BigInt),
        completed = map['completed'] as bool,
        receipt = map['receipt'] != null
            ? TransactionReceipt.fromMap(map['receipt'] as Map<String, dynamic>)
            : null;

  /// The transaction type.
  final TransactionType type;

  /// The sender of this transaction.
  final EthereumAddress subWallet;

  /// Address of the receiver. `null` when its a contract creation transaction
  final EthereumAddress? to;

  /// The amount of Ether sent with this transaction.
  final EtherAmount amount;

  /// The data sent with this transaction.
  final Uint8List? data;

  /// A hash of this transaction, in hexadecimal representation.
  final String hash;

  /// Whether this transaction has been completed.
  final bool completed;

  /// Transaction receipt data.
  final TransactionReceipt? receipt;
}
