/// {@template transaction_response}
/// Contract Interaction Transaction Response
/// {@endtemplate}
class InteractionTransactionResponse {
  /// {@macro transaction_response}
  InteractionTransactionResponse({required this.data, required this.hash});

  /// Parse data from json
  factory InteractionTransactionResponse.fromJson(Map<String, dynamic> json) {
    final result = json['result'] as Map<String, dynamic>;
    return InteractionTransactionResponse(
      data: result['input'] as String,
      hash: json['hash'] as String,
    );
  }

  /// Response data
  final String data;

  /// Response hash
  final String hash;

  /// Return a map literal with all the non-null key-value pairs
  Map<String, dynamic> toJson() => {
    'data': data,
    'hash': hash,
  };
}
