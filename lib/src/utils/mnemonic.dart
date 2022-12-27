import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure Mnemonic provider
class SecureMnemonicProvider {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();
  static const String _seedPhraseKey = 'seed_phrase';

  /// Get mnemonic from storage
  Future<String> getMnemonic() async {
    return await _storage.read(key: _seedPhraseKey) ?? '';
  }

  /// Save mnemonic to storage
  Future<void> saveMnemonic(String mnemonic) async {
    await _storage.write(key: _seedPhraseKey, value: mnemonic);
  }
}
