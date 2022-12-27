// ignore_for_file: parameter_assignments

import 'dart:convert' show utf8;
import 'dart:math';
import 'dart:typed_data';

import 'package:chain_wallet/src/utils/formatting.dart';
import 'package:convert/convert.dart' show hex;

final Random _random = Random.secure();
final BigInt _byteMask = BigInt.from(0xff);

/// Generate random bytes
Uint8List randomBytes([int length = 32]) {
  final values = List<int>.generate(length, (i) => _random.nextInt(256));

  return Uint8List.fromList(values);
}

/// Pad string with zeroes
Uint8List padUint8ListTo32(Uint8List data) {
  assert(data.length <= 32, 'Invalid data length');
  if (data.length == 32) return data;

  return Uint8List(32)..setRange(32 - data.length, 32, data);
}

/// Convert unsigned int to bytes
Uint8List unsignedIntToBytes(BigInt number) {
  assert(!number.isNegative, 'Number cannot be negative');
  return encodeBigIntAsUnsigned(number);
}

/// Encode as Big Endian unsigned byte array.
Uint8List encodeBigIntAsUnsigned(BigInt number) {
  if (number == BigInt.zero) {
    return Uint8List.fromList([0]);
  }
  final size = number.bitLength + (number.isNegative ? 8 : 7) >> 3;
  final result = Uint8List(size);
  for (var i = 0; i < size; i++) {
    result[size - i - 1] = (number & _byteMask).toInt();
    number = number >> 8;
  }
  return result;
}

/// Interprets a [Uint8List] as a signed integer and returns a [BigInt].
/// Assumes 256-bit numbers.
BigInt fromSigned(Uint8List signedInt) {
  return decodeBigInt(signedInt).toSigned(256);
}

/// Encodes list of integer bytes and returns a [BigInt].
BigInt decodeBigInt(List<int> bytes) {
  var result = BigInt.from(0);
  for (var i = 0; i < bytes.length; i++) {
    result += BigInt.from(bytes[bytes.length - i - 1]) << (8 * i);
  }
  return result;
}

/// Converts an [int] to a [Uint8List]
Uint8List intToBuffer(int i) {
  return Uint8List.fromList(hex.decode(padToEven(intToHex(i).substring(2))));
}

/// Turns a string into a [Uint8List].
Uint8List toHexBuffer(String v) {
  final bytes = hex.decode(stripHexPrefix(v));

  return uint8ListFromList(bytes);
}

/// Utf8 encode locator
Uint8List utf8Encode(String v) {
  final bytes = utf8.encode(v);

  return uint8ListFromList(bytes);
}

/// Uint8List from list
Uint8List uint8ListFromList(List<int> data) {
  if (data is Uint8List) return data;

  return Uint8List.fromList(data);
}
