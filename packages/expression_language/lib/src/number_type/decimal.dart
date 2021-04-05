import 'dart:math';

import 'package:expression_language/src/number_type/integer.dart';
import 'package:expression_language/src/number_type/number.dart';
import 'package:rational/rational.dart';

class Decimal extends Number {
  Rational _rational;

  Decimal(String value) : _rational = Rational.parse(value);

  factory Decimal.parse(String value) =>
      Decimal._fromRational(Rational.parse(value));

  factory Decimal.fromInt(int value) =>
      Decimal._fromRational(Rational(BigInt.from(value)));

  factory Decimal.fromDouble(double value) =>
      Decimal._fromRational(Rational.parse(value.toString()));

  Decimal._fromRational(this._rational);

  static Decimal? tryParse(String value) {
    try {
      return Decimal.parse(value);
    } on FormatException {
      return null;
    }
  }

  Decimal _convertToDecimal(Number number) {
    Decimal _other;

    if (number is Integer) {
      _other = Decimal.fromInt(number.value);
    } else {
      _other = number as Decimal;
    }

    return _other;
  }

  bool get isInteger => _rational.isInteger;

  @override
  int get hashCode => _rational.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is Integer) {
      return (identical(toInteger().value, other.value) && isInteger);
    }
    return (other is Decimal) && (_rational == other._rational);
  }

  @override
  String toString() => _rational.toDecimalString();

  @override
  int compareTo(Number other) {
    return _rational.compareTo(_convertToDecimal(other)._rational);
  }

  @override
  Number operator %(Number other) =>
      Decimal._fromRational(_rational % _convertToDecimal(other)._rational);

  @override
  Number operator *(Number other) =>
      Decimal._fromRational(_rational * _convertToDecimal(other)._rational);

  @override
  Number operator +(Number other) =>
      Decimal._fromRational(_rational + _convertToDecimal(other)._rational);

  @override
  Number operator -() => Decimal._fromRational(-_rational);

  @override
  Number operator -(Number other) =>
      Decimal._fromRational(_rational - _convertToDecimal(other)._rational);

  @override
  Decimal operator /(Number other) =>
      Decimal._fromRational(_rational / _convertToDecimal(other)._rational);

  @override
  Integer operator ~/(Number other) =>
      Decimal._fromRational(_rational ~/ _convertToDecimal(other)._rational)
          .toInteger();

  @override
  bool operator <(Number other) =>
      _rational < _convertToDecimal(other)._rational;

  @override
  bool operator <=(Number other) =>
      _rational <= _convertToDecimal(other)._rational;

  @override
  bool operator >(Number other) =>
      _rational > _convertToDecimal(other)._rational;

  @override
  bool operator >=(Number other) =>
      _rational >= _convertToDecimal(other)._rational;

  @override
  bool get isNaN => _rational.isNaN;

  @override
  bool get isInfinite => _rational.isInfinite;

  @override
  bool get isNegative => _rational.isNegative;

  @override
  Number abs() => Decimal._fromRational(_rational.abs());

  @override
  Integer get sign => Integer(_rational.signum);

  @override
  Integer ceil() => Decimal._fromRational(_rational.ceil()).toInteger();

  @override
  Integer floor() => Decimal._fromRational(_rational.floor()).toInteger();

  @override
  Number remainder(Number other) => Decimal._fromRational(
      _rational.remainder(Rational.parse(other.toString())));

  @override
  Integer round() => Decimal._fromRational(_rational.round()).toInteger();

  @override
  Integer toInteger() => Integer(_rational.toInt());

  @override
  int toInt() => toInteger().value;

  /// Return this [Decimal] as a [double].
  ///
  /// If the number is not representable as a [double], an approximation is
  /// returned. For numerically large integers, the approximation may be
  /// infinite.
  double toDouble() => _rational.toDouble();

  @override
  String toStringAsExponential([int? fractionDigits]) =>
      _rational.toStringAsExponential(fractionDigits);

  @override
  String toStringAsFixed(int fractionDigits) =>
      _rational.toStringAsFixed(fractionDigits);

  @override
  String toStringAsPrecision(int precision) =>
      _rational.toStringAsPrecision(precision);

  @override
  Integer truncate() => Decimal._fromRational(_rational.truncate()).toInteger();

  @override
  Number roundWithPrecision(int precision,
      [RoundingMode mode = RoundingMode.nearestEven]) {
    if (precision >= 0) {
      switch (mode) {
        case RoundingMode.nearestEven:
          return _roundNearestEven(precision);
        case RoundingMode.nearestOdd:
          return _roundNearestOdd(precision);
        case RoundingMode.nearestFromZero:
          return _roundNearestFromZero(precision);
        case RoundingMode.nearestToZero:
          return _roundNearestToZero(precision);
        case RoundingMode.nearestDownward:
          return _roundNearestDownward(precision);
        case RoundingMode.nearestUpward:
          return _roundNearestUpward(precision);
        case RoundingMode.towardsZero:
          return _roundTowardsZero(precision);
        case RoundingMode.fromZero:
          return _roundFromZero(precision);
        case RoundingMode.up:
          return _roundUp(precision);
        case RoundingMode.down:
          return _roundDown(precision);
      }
    } else {
      return toInteger().roundWithPrecision(precision);
    }
  }

  Number _roundTowardsZero(int precision) {
    final multiplier = Integer(pow(10, precision) as int);
    var tempNumber = this * multiplier;
    tempNumber =
        (tempNumber >= Integer(0)) ? tempNumber.floor() : tempNumber.ceil();
    return tempNumber / multiplier;
  }

  Number _roundFromZero(int precision) {
    final multiplier = Integer(pow(10, precision) as int);
    var tempNumber = this * multiplier;
    tempNumber =
        (tempNumber >= Integer(0)) ? tempNumber.ceil() : tempNumber.floor();
    return tempNumber / multiplier;
  }

  Number _roundUp(int precision) {
    final multiplier = Integer(pow(10, precision) as int);
    return (this * multiplier).ceil() / multiplier;
  }

  Number _roundDown(int precision) {
    final multiplier = Integer(pow(10, precision) as int);
    return (this * multiplier).floor() / multiplier;
  }

  Number _roundNearestEven(int precision) {
    final multiplier = Integer(pow(10, precision) as int);
    final tempNumber = this * multiplier;
    final integerPart = tempNumber.toInt().toString();
    var parts = tempNumber.toString().split('.');
    final decimalPart = (parts.length == 2) ? parts[1] : '';

    if (decimalPart.isNotEmpty && decimalPart[0] == '5') {
      var lastDigit = int.parse(integerPart[integerPart.length - 1]);
      return (lastDigit % 2 == 0)
          ? _roundTowardsZero(precision)
          : _roundFromZero(precision);
    } else {
      return _roundNearestFromZero(precision);
    }
  }

  Number _roundNearestOdd(int precision) {
    final multiplier = Integer(pow(10, precision) as int);
    final tempNumber = this * multiplier;
    final integerPart = tempNumber.toInt().toString();
    var parts = tempNumber.toString().split('.');
    final decimalPart = (parts.length == 2) ? parts[1] : '';

    if (decimalPart.isNotEmpty && decimalPart[0] == '5') {
      var lastDigit = int.parse(integerPart[integerPart.length - 1]);
      return (lastDigit % 2 == 1)
          ? _roundTowardsZero(precision)
          : _roundFromZero(precision);
    } else {
      return _roundNearestFromZero(precision);
    }
  }

  Number _roundNearestFromZero(int precision) {
    final multiplier = Integer(pow(10, precision) as int);
    return (this * multiplier).round() / multiplier;
  }

  Number _roundNearestDownward(int precision) {
    final multiplier = Integer(pow(10, precision) as int);
    final tempNumber = this * multiplier;
    var parts = tempNumber.toString().split('.');
    final decimalPart = (parts.length == 2) ? parts[1] : '';

    return (decimalPart.isNotEmpty && decimalPart[0] == '5')
        ? tempNumber.floor() / multiplier
        : _roundNearestFromZero(precision);
  }

  Number _roundNearestUpward(int precision) {
    final multiplier = Integer(pow(10, precision) as int);
    final tempNumber = this * multiplier;
    var parts = tempNumber.toString().split('.');
    final decimalPart = (parts.length == 2) ? parts[1] : '';

    return (decimalPart.isNotEmpty && decimalPart[0] == '5')
        ? tempNumber.ceil() / multiplier
        : _roundNearestFromZero(precision);
  }

  Number _roundNearestToZero(int precision) => (this >= Integer(0))
      ? _roundNearestDownward(precision)
      : _roundNearestUpward(precision);
}
