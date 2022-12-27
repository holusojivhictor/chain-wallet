import 'dart:typed_data';

import 'package:dio/dio.dart';

/// {@template storage_service}
/// NFT.storage base api services
/// {@endtemplate}
class NFTStorageService {
  /// {@macro storage_service}
  NFTStorageService() {
    dio.interceptors.add(LogInterceptor());
  }

  /// Dio instance, an http client for Dart, which supports Interceptors,
  /// Global configuration, FormData etc.
  Dio dio = Dio();

  /// Store a file with NFT.storage. You can upload either a single file,
  /// or multiple files in a directory.
  Future<dynamic> storeFile({
    required String url,
    required FormData formData,
    required String nftStorageApiKey,
  }) async {
    try {
      final response = await dio.post<dynamic>(
        url,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $nftStorageApiKey',
            'content-disposition': 'form-data; name="file"; filename=""',
            'content-type': 'multipart/form-data'
          },
        ),
      );

      return response.data;
    } on DioError catch (_) {
      rethrow;
    }
  }

  /// Store a file with NFT.storage. This sends data as bytes.
  Future<dynamic> store({
    required String url,
    required Uint8List data,
    required String nftStorageApiKey,
  }) async {
    try {
      final response = await dio.post<dynamic>(
        url,
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $nftStorageApiKey'
          },
        ),
      );

      return response.data;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
