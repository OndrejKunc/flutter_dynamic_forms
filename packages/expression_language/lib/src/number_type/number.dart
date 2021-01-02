import 'package:expression_language/src/number_type/decimal.dart';
import 'package:expression_language/src/number_type/integer.dart';

enum RoundingMode {
  nearestEven,
  nearestOdd,
  nearestFromZero,
  nearestToZero,
  nearestDownward,
  nearestUpward,
  towardsZero,
  fromZero,
  up,
  down
}

abstract class Number implements Comparable<Number> {
  /// Test whether this value is numerically equal to `other`.
  ///
  /// If both operands are decimals, they are equal if they have the same
  /// representation, except that:
  ///
  ///  * zero and minus zero (0.0 and -0.0) are considered equal. They
  ///    both have the numerical value zero.
  ///  * NaN is not equal to anything, including NaN. If either operand is
  ///    NaN, the result is always false.
  ///
  /// If one operand is a decimal and the other is an int, they are equal if
  /// the decimal has an integer value (finite with no fractional part) and
  /// `identical(decimalValue.toInt(), intValue)` is true.
  ///
  /// If both operands are integers, they are equal if they have the same value.
  ///
  /// Returns false if `other` is not a [num].
  @override
  bool operator ==(Object other);

  ///
  ///Returns a hash code for a numerical value.
  ///
  @override
  int get hashCode;

  /// Compares this to `other`.
  ///
  /// Returns a negative number if `this` is less than `other`, zero if they are
  /// equal, and a positive number if `this` is greater than `other`.
  @override
  int compareTo(Number other);

  /// Addition operator.
  Number operator +(Number other);

  /// Subtraction operator.
  Number operator -(Number other);

  /// Multiplication operator.
  Number operator *(Number other);

  /// Euclidean modulo operator.
  ///
  /// Returns the remainder of the euclidean division. The euclidean division of
  /// two integers `a` and `b` yields two integers `q` and `r` such that
  /// `a == b * q + r` and `0 <= r < b.abs()`.
  ///
  /// The euclidean division is only defined for integers, but can be easily
  /// extended to work with doubles. In that case `r` may have a non-integer
  /// value, but it still verifies `0 <= r < |b|`.
  ///
  /// The sign of the returned value `r` is always positive.
  ///
  /// See [remainder] for the remainder of the truncating division.
  Number operator %(Number other);

  /// Division operator.
  Decimal operator /(Number other);

  /// Truncating division operator.
  ///
  /// If either operand is a [double] then the result of the truncating division
  /// `a ~/ b` is equivalent to `(a / b).truncate().toInt()`.
  ///
  /// If both operands are [int]s then `a ~/ b` performs the truncating
  /// integer division.
  Integer operator ~/(Number other);

  /// Negate operator.
  Number operator -();

  /// Returns the remainder of the truncating division of `this` by [other].
  ///
  /// The result `r` of this operation satisfies:
  /// `this == (this ~/ other) * other + r`.
  /// As a consequence the remainder `r` has the same sign as the divider `this`.
  Number remainder(Number other);

  /// Relational less than operator.
  bool operator <(Number other);

  /// Relational less than or equal operator.
  bool operator <=(Number other);

  /// Relational greater than operator.
  bool operator >(Number other);

  /// Relational greater than or equal operator.
  bool operator >=(Number other);

  /// True if the number is negative; otherwise, false.
  ///
  /// Negative numbers are those less than zero.
  bool get isNegative;

  /// True if the number is not a number; otherwise, false.
  bool get isNaN;

  /// True if the number is infinite; otherwise, false.
  bool get isInfinite;

  /// Returns the absolute value of this [num].
  Number abs();

  /// Returns minus one, zero or plus one depending on the sign and
  /// numerical value of the number.
  ///
  /// Returns minus one if the number is less than zero,
  /// plus one if the number is greater than zero,
  /// and zero if the number is equal to zero.
  Integer get sign;

  /// Returns the integer closest to `this`.
  ///
  /// Rounds away from zero when there is no closest integer:
  ///  `(3.5).round() == 4` and `(-3.5).round() == -4`.
  Integer round();

  /// Returns number rounded according to [precision] and [RoundingMode].
  ///
  /// If [precision] is negative, number is rounded to hundreds (-2), thousands (-3), etc. In that case, it rounds to nearest, ties away from zero.\
  /// If rounded number is integer, rounding mode `nearestEven` is automatically used and cannot be changed.
  ///
  /// Rounding modes: (https://en.wikipedia.org/wiki/IEEE_754#Rounding_rules, https://upload.wikimedia.org/wikipedia/commons/8/8a/Comparison_rounding_graphs_SMIL.svg)
  /// * `nearestEven` (0) - rounds to the nearest value; if the number falls midway, it is rounded to the nearest value with an even least significant digit
  /// * `nearestOdd` (1) - rounds to the nearest value; if the number falls midway, it is rounded to the nearest value with an odd least significant digit
  /// * `nearestFromZero` (2) - rounds to the nearest value; if the number falls midway, it is rounded to the value which is the farthest from zero
  /// * `nearestToZero` (3) - rounds to the nearest value; if the number falls midway, it is rounded to the value which is the closest to zero
  /// * `nearestDownward` (4) - rounds to the nearest value; if the number falls midway, it rounds down
  /// * `nearestUpward` (5) - rounds to the nearest value; if the number falls midway, it rounds down
  /// * `towardsZero` (6) - directed rounding towards zero
  /// * `fromZero` (7) - directed rounding from zero
  /// * `up` (8) - directed rounding towards positive infinity
  /// * `down` (9) - directed rounding towards negative infinity
  Number roundWithPrecision(int precision,
      [RoundingMode mode = RoundingMode.nearestEven]);

  /// Returns the greatest integer no greater than `this`.
  Integer floor();

  /// Returns the least integer no smaller than `this`.
  Integer ceil();

  /// Returns the integer obtained by discarding any fractional
  /// digits from `this`.
  Integer truncate();

  /// Truncates this [Number] to an integer and returns the result as an [Integer].
  Integer toInteger();

  /// Truncates this [Number] to an integer and returns the result as an [int]. */
  int toInt();

  ///  Returns a decimal-point string-representation of `this`.
  ///  Converts `this` to a [Decimal] before computing the string representation.
  ///  If the absolute value of `this` is greater or equal to `10^21` then this
  ///  methods returns an exponential representation computed by
  ///  `this.toStringAsExponential()`. Otherwise the result
  ///  is the closest string representation with exactly [fractionDigits] digits
  ///  after the decimal point. If [fractionDigits] equals 0 then the decimal
  ///  point is omitted.
  ///
  ///  The parameter [fractionDigits] must be an integer satisfying:
  ///  `0 <= fractionDigits <= 20`.
  ///
  ///  Examples:
  ///
  ///      1.toStringAsFixed(3);  // 1.000
  ///      (4321.12345678).toStringAsFixed(3);  // 4321.123
  ///      (4321.12345678).toStringAsFixed(5);  // 4321.12346
  ///      123456789012345678901.toStringAsFixed(3);  // 123456789012345683968.000
  ///      1000000000000000000000.toStringAsFixed(3); // 1e+21
  ///      5.25.toStringAsFixed(0); // 5
  String toStringAsFixed(int fractionDigits);

  /// Returns an exponential string-representation of `this`.
  ///
  /// Converts `this` to a [Decimal] before computing the string representation.
  ///
  /// If [fractionDigits] is given then it must be an integer satisfying:
  /// `0 <= fractionDigits <= 20`. In this case the string contains exactly
  /// [fractionDigits] after the decimal point. Otherwise, without the parameter,
  /// the returned string uses the shortest number of digits that accurately
  /// represent [this].
  ///
  /// If [fractionDigits] equals 0 then the decimal point is omitted.
  /// Examples:
  ///
  ///     1.toStringAsExponential();       // 1e+0
  ///     1.toStringAsExponential(3);      // 1.000e+0
  ///     123456.toStringAsExponential();  // 1.23456e+5
  ///     123456.toStringAsExponential(3); // 1.235e+5
  ///     123.toStringAsExponential(0);    // 1e+2
  String toStringAsExponential([int? fractionDigits]);

  /// Converts `this` to a decimal and returns a string representation with
  /// exactly [precision] significant digits.
  ///
  /// The parameter [precision] must be an integer satisfying:
  /// `1 <= precision <= 21`.
  ///
  /// Examples:
  ///
  ///     1.toStringAsPrecision(2);       // 1.0
  ///     1e15.toStringAsPrecision(3);    // 1.00+15
  ///     1234567.toStringAsPrecision(3); // 1.23e+6
  ///     1234567.toStringAsPrecision(9); // 1234567.00
  ///     12345678901234567890.toStringAsPrecision(20); // 12345678901234567168
  ///     12345678901234567890.toStringAsPrecision(14); // 1.2345678901235e+19
  ///     0.00000012345.toStringAsPrecision(15); // 1.23450000000000e-7
  ///     0.0000012345.toStringAsPrecision(15);  // 0.00000123450000000000
  String toStringAsPrecision(int precision);

  /// Returns the shortest string that correctly represent the input number.
  ///
  /// An [Integer] is converted to a decimal representation with no decimal point.
  @override
  String toString();

  /// Parses a string containing a number literal into a number.
  ///  The method first tries to read the [input] as integer (similar to
  /// [int.parse] without a radix).
  /// If that fails, it tries to parse the [input] as a decimal (similar to
  /// [Decimal.parse]).
  /// If that fails too, it throws FormatException.
  static Number parse(String input) {
    var source = input.trim();

    var parsedInt = int.tryParse(source);
    if (parsedInt != null) {
      return Integer(parsedInt);
    }

    var decimalResult = Decimal.parse(
        source); //this throws FormatException, if input is not decimal number
    return decimalResult;
  }
}
