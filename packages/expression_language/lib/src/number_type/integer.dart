import 'dart:math';

import 'package:expression_language/src/number_type/decimal.dart';
import 'package:expression_language/src/number_type/number.dart';

class Integer extends Number {
  int value;

  Integer(this.value);

  factory Integer.parse(String value) => Integer(int.parse(value));

  @override
  int get hashCode => Decimal.fromInt(value).hashCode;

  @override
  bool operator ==(Object other) {
    if (other is Decimal) {
      return (other.isInteger && identical(other.toInteger().value, value));
    }
    return other is Integer && value == other.value;
  }

  @override
  String toString() => value.toString();

  @override
  int compareTo(Number other) => Decimal.fromInt(value).compareTo(other);

  @override
  Number operator %(Number other) => (other is Decimal)
      ? Decimal.fromInt(value) % other
      : Integer(value % (other as Integer).value);

  @override
  Number operator *(Number other) => (other is Decimal)
      ? Decimal.fromInt(value) * other
      : Integer(value * (other as Integer).value);

  @override
  Number operator +(Number other) => (other is Decimal)
      ? Decimal.fromInt(value) + other
      : Integer(value + (other as Integer).value);

  @override
  Number operator -() => Integer(-value);

  @override
  Integer operator ~/(Number other) => (other is Decimal)
      ? Decimal.fromInt(value) ~/ other
      : Integer(value ~/ (other as Integer).value);

  @override
  Number operator -(Number other) => (other is Decimal)
      ? Decimal.fromInt(value) - other
      : Integer(value - (other as Integer).value);

  @override
  Decimal operator /(Number other) => Decimal.fromInt(value) / other;

  @override
  bool operator <(Number other) => Decimal.fromInt(value) < other;

  @override
  bool operator <=(Number other) => Decimal.fromInt(value) <= other;

  @override
  bool operator >(Number other) => Decimal.fromInt(value) > other;

  @override
  bool operator >=(Number other) => Decimal.fromInt(value) >= other;

  @override
  Number abs() => Integer(value.abs());

  @override
  Integer ceil() => Integer(value.ceil());

  @override
  Integer floor() => Integer(value.floor());

  @override
  bool get isInfinite => value.isInfinite;

  @override
  bool get isNaN => value.isNaN;

  @override
  bool get isNegative => value.isNegative;

  @override
  Number remainder(Number other) => (other is Decimal)
      ? Decimal.fromInt(value).remainder(other)
      : Integer(value.remainder((other as Integer).value));

  @override
  Integer round() => Integer(value.round());

  @override
  Integer get sign => Integer(value.sign);

  @override
  Integer toInteger() => Integer(value);

  @override
  int toInt() => value;

  @override
  String toStringAsExponential([int? fractionDigits]) =>
      Decimal.fromInt(value).toStringAsExponential(fractionDigits);

  @override
  String toStringAsFixed(int fractionDigits) =>
      Decimal.fromInt(value).toStringAsFixed(fractionDigits);

  @override
  String toStringAsPrecision(int precision) =>
      Decimal.fromInt(value).toStringAsPrecision(precision);

  @override
  Integer truncate() => Integer(value.truncate());

  @override
  Number roundWithPrecision(int precision,
      [RoundingMode mode = RoundingMode.nearestEven]) {
    if (precision >= 0) {
      return Integer(value);
    } else {
      var multiplier = pow(10, -precision) as int;
      final adder = 5 * (multiplier ~/ 10) * ((value < 0) ? -1 : 1);
      return Integer(((value + adder) ~/ multiplier) * multiplier);
    }
  }
}
