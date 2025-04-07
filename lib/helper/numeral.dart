class Numeral {
  const Numeral(this.numeral);
  final num numeral;
  String format({int fractionDigits = 2}) {
    final NumeralParsedValue parsed = numeralParser(numeral);

    return _removeEndsZero(parsed.value.toStringAsFixed(fractionDigits)) +
        parsed.suffix;
  }

  String _removeEndsZero(String value) {
    if (value.contains('.')) {
      return value;
    }

    if (value.endsWith('.')) {
      return value.substring(0, value.length - 1);
    } else if (value.endsWith('0')) {
      return _removeEndsZero(value.substring(0, value.length - 1));
    }

    return value;
  }

  @override
  String toString() => format();
}

class NumeralParsedValue {
  final String suffix;
  final num value;

  NumeralParsedValue._(this.value, this.suffix);

  factory NumeralParsedValue({
    required String suffix,
    required num value,
  }) {
    return NumeralParsedValue._(value, suffix);
  }
}

NumeralParsedValue numeralParser(num value) {
  final num abs = value.abs();

  // If number > 1 trillion.
  if (abs >= 1000000000000) {
    return NumeralParsedValue(value: value / 1000000000000, suffix: 'T');

    // If number > 1 billion.
  } else if (abs >= 1000000000) {
    return NumeralParsedValue(value: value / 1000000000, suffix: 'B');

    // If number > 1 million.
  } else if (abs >= 1000000) {
    return NumeralParsedValue(value: value / 1000000, suffix: 'M');

    // If number > 1 thousand.
  } else if (abs >= 1000) {
    return NumeralParsedValue(value: value / 1000, suffix: 'K');
  }

  return NumeralParsedValue(value: value, suffix: '');
}