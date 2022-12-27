import 'package:chain_wallet/chain_wallet.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ChainWalletManager', () {
    test('can be instantiated', () {
      expect(ChainWalletManager.instance, isNotNull);
    });
  });
}
