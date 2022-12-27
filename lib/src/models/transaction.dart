import 'package:web3dart/contracts.dart';
import 'package:web3dart/crypto.dart';

/// Map of transaction type to selector hex
Map<TransactionType, String> transactionTypes = {
  TransactionType.sendEthers:
  bytesToHex(keccakUtf8('sendEthersTransaction')),
  TransactionType.contractInteraction:
  bytesToHex(keccakUtf8('contractInteractionTransaction')),
};

/// Transaction types
enum TransactionType {
  /// Send ethers transaction
  sendEthers,
  /// Contract interaction transaction
  contractInteraction,
}

/// {@template transaction}
/// Transaction to send ethers or interact with the master contract.
/// {@endtemplate}
class Transaction {
  /// {@macro transaction}
  Transaction({
    required this.data,
    this.gasLimit,
    this.gasPrice,
    this.value,
    this.nonce,
    this.fromAddress,
    this.toAddress,
    this.signature,
  });

  /// Constructs a transaction that can be used to call a contract function.
  Transaction.callContract({
    required DeployedContract contract,
    required ContractFunction function,
    required List<dynamic> parameters,
    this.fromAddress,
    this.gasLimit,
    this.gasPrice,
    this.value,
    this.nonce,
    this.signature,
  })  : toAddress = contract.address.hexEip55,
        data = bytesToHex(function.encodeCall(parameters), include0x: true);

  /// The address of the sender of this transaction.
  ///
  /// This can be set to null, in which case the client will use the address
  /// belonging to the credentials used to this transaction.
  final String? fromAddress;

  /// The recipient of this transaction, or null for transactions that create a
  /// contract.
  final String? toAddress;

  /// The maximum amount of gas to spend.
  ///
  /// Gas that is not used but included in [gasLimit] will be returned.
  final String? gasLimit;

  /// How much ether to spend on a single unit of gas. Can be null, in which
  /// case the rpc server will choose this value.
  final String? gasPrice;

  /// How much ether to send to [toAddress].
  final String? value;

  /// For transactions that call a contract function or create a contract,
  /// contains the hashed function name and the encoded parameters or the
  /// compiled contract code, respectively.
  final String data;

  /// The bytes representation of the [eth_sign RPC method].
  final String? signature;

  /// The nonce of this transaction. A nonce is incremented per sender and
  /// transaction to make sure the same transaction can't be sent more than
  /// once.
  final String? nonce;

  /// Return a map literal with all the non-null key-value pairs
  Map<String, dynamic> toJson() => {
    'agentAddress': fromAddress,
    'toAddress': toAddress,
    'value': value,
    'nonce': nonce,
    'gasLimit': gasLimit,
    'gasPrice': gasPrice,
    'data': data,
    'signature': signature
  };

  /// copyWith impl
  Transaction copyWith({
    String? fromAddress,
    String? toAddress,
    String? gasLimit,
    String? gasPrice,
    String? value,
    String? data,
    String? signature,
    String? nonce,
  }) {
    return Transaction(
      fromAddress: fromAddress ?? this.fromAddress,
      toAddress: toAddress ?? this.toAddress,
      gasLimit: gasLimit ?? this.gasLimit,
      gasPrice: gasPrice ?? this.gasPrice,
      value: value ?? this.value,
      data: data ?? this.data,
      signature: signature ?? this.signature,
      nonce: nonce ?? this.nonce,
    );
  }
}
