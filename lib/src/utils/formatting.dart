import 'dart:typed_data';

import 'package:chain_wallet/src/utils/bytes.dart';

/// Is hex string prefixed.
bool isHexPrefixed(String str) {
  return str.startsWith('0x');
}

/// Is the string a hex string.
bool isHexString(String value, {int length = 0}) {
  if (!RegExp(r'^0x[0-9A-Fa-f]*$').hasMatch(value)) {
    return false;
  }

  if (length > 0 && value.length != 2 + 2 * length) {
    return false;
  }

  return true;
}

/// Adds "0x" to a given [String] if it does not already start with "0x".
String addHexPrefix(String str) {
  return isHexPrefixed(str) ? str : '0x$str';
}

/// Strip hex prefix if string starts with 0x.
String stripHexPrefix(String str) {
  return isHexPrefixed(str) ? str.substring(2) : str;
}

/// Trim private key string.
/// This is used because web3dart package sometimes creates unwanted 00
/// in front of generated private key string.
String getPrettyPrivateKey(String privateKey) {
  if (privateKey.length > 64) {
    privateKey.substring(privateKey.length - 64, privateKey.length);
  }
  return privateKey;
}

/// Concatenate sigs to get raw signature.
Uint8List concatSig(BigInt r, BigInt s, int v) {
  final rStr = padUint8ListTo32(unsignedIntToBytes(r));
  final sStr = padUint8ListTo32(unsignedIntToBytes(s));
  final vStr = unsignedIntToBytes(BigInt.from(v));

  return uint8ListFromList(rStr + sStr + vStr);
}

/// Converts a [int] into a hex [String]
String intToHex(int i) {
  return '0x${i.toRadixString(16)}';
}

/// Pads a [String] to have an even length.
String padToEven(String value) {
  var a = value;

  if (a.length.isOdd) {
    a = '0$a';
  }

  return a;
}
