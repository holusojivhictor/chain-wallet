import 'dart:typed_data';

import 'package:chain_wallet/chain_wallet.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

/// {@template storage_client}
/// NFTStorage client
/// {@endtemplate}
class NFTStorageClient {
  /// {@macro storage_client}
  NFTStorageClient({
    required this.nftStorageApiKey,
    this.url = 'https://api.nft.storage',
  });

  /// NFT.storage api url
  final String url;

  /// NFT.storage api token
  final String nftStorageApiKey;

  final NFTStorageService _storageService = NFTStorageService();

  /// Upload file to storage as multi-part form data.
  Future<StorageResponse> upload({
    required String filePath,
    String fileName = '',
  }) async {
    try {
      final response = await _storageService.storeFile(
        url: '$url/upload',
        formData: await _getFormData(filePath, fileName),
        nftStorageApiKey: nftStorageApiKey,
      );

      final json = response as Map<String, dynamic>;
      final res = StorageResponse.fromJson(json);

      return res;
    } on DioException catch (_) {
      rethrow;
    }
  }

  /// Write byte data to storage.
  Future<StorageResponse> write({
    required Uint8List data,
  }) async {
    try {
      final response = await _storageService.store(
        url: '$url/upload',
        data: data,
        nftStorageApiKey: nftStorageApiKey,
      );

      final json = response as Map<String, dynamic>;
      final res = StorageResponse.fromJson(json);

      return res;
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<FormData> _getFormData(String filePath, String fileName) async {
    return FormData.fromMap({
      'file': await MultipartFile.fromFile(
        filePath,
        filename: fileName,
        contentType: MediaType('image', 'png'),
      ),
    });
  }
}
