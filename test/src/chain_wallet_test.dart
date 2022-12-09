// ignore_for_file: prefer_const_constructors
import 'package:chain_wallet/chain_wallet.dart';
import 'package:test/test.dart';

void main() {
  group('ChainWallet', () {
    test('can be instantiated', () {
      expect(ChainWallet(), isNotNull);
    });
  });
}
