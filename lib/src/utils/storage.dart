import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure Storage provider
class SecureStorageProvider {
  /// Use Flutter Secure Storage to safely store keys.
  ///
  /// See documentation https://pub.dev/packages/flutter_secure_storage
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static const String _seedPhraseKey = 'seed_phrase_key';
  static const String _walletAddressKey = 'wallet_address_key';
  static const String _privateKey = 'private_key';

  /// Get mnemonic from storage
  Future<String> getMnemonic() async {
    return await _storage.read(key: _seedPhraseKey) ?? '';
  }

  /// Save mnemonic to storage
  Future<void> saveMnemonic(String mnemonic) async {
    await _storage.write(key: _seedPhraseKey, value: mnemonic);
  }

  /// Get wallet address from storage
  Future<String> getAddress() async {
    return await _storage.read(key: _walletAddressKey) ?? '';
  }

  /// Save wallet address to storage
  Future<void> saveAddress(String address) async {
    await _storage.write(key: _walletAddressKey, value: address);
  }

  /// Get private key from storage
  Future<String> getPrivateKey() async {
    return await _storage.read(key: _privateKey) ?? '';
  }

  /// Save private key to storage
  Future<void> savePrivateKey(String privateKey) async {
    await _storage.write(key: _privateKey, value: privateKey);
  }
}
