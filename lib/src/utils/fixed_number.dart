/// Returns a string "1" followed by decimal "0"s
String getMultiplier(BigInt decimals) {
  if (decimals >= BigInt.zero && decimals <= BigInt.from(256)
      && (decimals % BigInt.one == BigInt.zero)) {
    final padding = List.generate(decimals.toInt(), (index) => '0').join();
    return '1$padding';
  }

  throw ArgumentError('invalid decimal size', 'dec ${decimals.toString()}');
}

/// Format unit digits and return the string representation.
String formatFixed(BigInt value, {BigInt? decimals}) {
  decimals ??= BigInt.zero;
  final multiplier = getMultiplier(decimals);

  BigInt v;
  final negative = value.isNegative;
  if (negative) {
    v = value * BigInt.from(-1);
  } else {
    v = value;
  }

  var fraction = (v % BigInt.parse(multiplier)).toString();
  while (fraction.length < multiplier.length - 1) {
    fraction = '0$fraction';
  }

  final regExp = RegExp('^([0-9]*[1-9]|0)(0*)');
  final matches = regExp.allMatches(fraction);

  for (final m in matches) {
    fraction = m[1]!;
  }

  String res;
  final whole = (v / BigInt.parse(multiplier)).round().toString();
  if (multiplier.length == 1) {
    res = whole;
  } else {
    res = '$whole.$fraction';
  }

  if (negative) {
    res = '-$res';
  }

  return res;
}

/// Parse a string representing ether, such as 1.1 into a BigInt in wei.
BigInt parseFixed(String value, {BigInt? decimals}) {
  decimals ??= BigInt.zero;
  final multiplier = getMultiplier(decimals);

  final regExp = RegExp(r'^-?[0-9.]+$');
  if (!regExp.hasMatch(value)) {
    throw ArgumentError('invalid decimal value', 'value $value');
  }

  String v;
  final negative = value.substring(0, 1) == '-';
  if (negative) {
    v = value.substring(1);
  } else {
    v = value;
  }

  if (v == '.') {
    throw ArgumentError('missing value', 'value $value');
  }

  // Split into a whole and fractional part
  final comps = v.split('.');
  if (comps.length > 2) {
    throw ArgumentError('too many decimal points', 'value $value');
  }

  final whole = comps.isEmpty ? '0' : comps[0];
  var fraction = comps.length > 1 ? comps[1] : '0';

  // Trim trailing zeros
  while(fraction.length > 1 && fraction[fraction.length - 1] == '0') {
    fraction = fraction.substring(0, fraction.length - 1);
  }

  // Check the fraction doesn't exceed our decimals size
  if (fraction.length > multiplier.length - 1) {
    throw ArgumentError('fractional component exceeds decimals', 'underflow');
  }

  // If decimals is 0, we have an empty string for fraction
  if (fraction.isEmpty) {
    fraction = '0';
  }

  final buf = StringBuffer(fraction);
  // Fully pad the string with zeros to get to wei
  while (buf.length < multiplier.length - 1) {
    buf.write('0');
  }

  final wholeValue = BigInt.parse(whole);
  final fractionValue = BigInt.parse(buf.toString());

  var wei = (wholeValue * BigInt.parse(multiplier)) + fractionValue;

  if (negative) {
    wei = wei * BigInt.from(-1);
  }

  return wei;
}
