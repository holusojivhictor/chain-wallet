/// {@template storage_response}
/// NFTStorage write data call response
/// {@endtemplate}
class StorageResponse {
  /// {@macro storage_response}
  StorageResponse({required this.cid, required this.size});

  /// Parse data from json
  factory StorageResponse.fromJson(Map<String, dynamic> json) {
    final result = json['value'] as Map<String, dynamic>;
    return StorageResponse(
      cid: result['cid'] as String,
      size: result['size'] as int,
    );
  }

  /// Content identifier
  final String cid;

  /// Response size
  final int size;

  /// Return a map literal with all the non-null key-value pairs
  Map<String, dynamic> toJson() => {
    'cid': cid,
    'size': size,
  };
}
