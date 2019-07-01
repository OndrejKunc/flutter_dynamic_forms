import 'package:expression_language/src/number_type/number.dart';
import 'package:expression_language/src/parser/expression_parser_exceptions.dart';
import 'package:expression_language/src/number_type/decimal.dart';
import 'package:expression_language/src/number_type/integer.dart';
import '../visitors/expression_visitor.dart';
import 'expression_provider.dart';

abstract class Expression<T> {
  T evaluate();
  void accept(ExpressionVisitor visitor);
  Type getType() => T;
}

class MutableExpression<T> extends Expression<T> {
  T value;

  MutableExpression(this.value);

  @override
  T evaluate() {
    return value;
  }

  @override
  Type getType() {
    return value.runtimeType;
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitMutable(this);
  }
}

class ImmutableExpression<T> extends Expression<T> {
  final T value;

  ImmutableExpression(this.value);

  @override
  T evaluate() {
    return value;
  }

  @override
  Type getType() {
    return value.runtimeType;
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitImmutable(this);
  }
}

class ConstantExpression<T> extends Expression<T> {
  final T value;

  ConstantExpression(this.value);

  @override
  String toString() {
    return "ConstantExpression: $value";
  }

  @override
  T evaluate() {
    return value;
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitConstant(this);
  }
}

class PlusNumberExpression extends Expression<Number> {
  final Expression<Number> left;
  final Expression<Number> right;

  PlusNumberExpression(this.left, this.right);

  @override
  String toString() {
    return "PlusExpression";
  }

  @override
  Number evaluate() {
    return left.evaluate() + right.evaluate();
  }

  @override
  Type getType() {
    return getTypeOfNumberExpression(left.getType(), right.getType());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitPlusNumber(this);
  }
}

class PlusStringExpression extends Expression<String> {
  final Expression<String> left;
  final Expression<String> right;

  PlusStringExpression(this.left, this.right);

  @override
  String toString() {
    return "PlusNumberExpression";
  }

  @override
  String evaluate() {
    return left.evaluate() + right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitPlusString(this);
  }
}

class MinusNumberExpression extends Expression<Number> {
  final Expression<Number> left;
  final Expression<Number> right;

  MinusNumberExpression(this.left, this.right);

  @override
  String toString() {
    return "MinusNumberExpression";
  }

  @override
  Number evaluate() {
    return left.evaluate() - right.evaluate();
  }

  @override
  Type getType() {
    return getTypeOfNumberExpression(left.getType(), right.getType());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitMinusNumber(this);
  }
}

class NegateNumberExpression extends Expression<Number> {
  final Expression<Number> value;

  NegateNumberExpression(this.value);

  @override
  String toString() {
    return "NegateNumberExpression";
  }

  @override
  Number evaluate() {
    return -value.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitNegateNumber(this);
  }
}

class MultiplyNumberExpression extends Expression<Number> {
  final Expression<Number> left;
  final Expression<Number> right;

  MultiplyNumberExpression(this.left, this.right);

  @override
  String toString() {
    return "MultiplyExpression";
  }

  @override
  Number evaluate() {
    return left.evaluate() * right.evaluate();
  }

  @override
  Type getType() {
    return getTypeOfNumberExpression(left.getType(), right.getType());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitMultiply(this);
  }
}

class LogicalOrExpression extends Expression<bool> {
  final Expression<bool> left;
  final Expression<bool> right;

  LogicalOrExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() || right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitLogicalOr(this);
  }
}

class LogicalAndExpression extends Expression<bool> {
  final Expression<bool> left;
  final Expression<bool> right;

  LogicalAndExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() && right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitLogicalAnd(this);
  }
}

class NegateBoolExpression extends Expression<bool> {
  final Expression<bool> value;

  NegateBoolExpression(this.value);

  @override
  String toString() {
    return "NegateBoolExpression";
  }

  @override
  bool evaluate() {
    return !value.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitNegateBool(this);
  }
}

class EqualNumberExpression extends Expression<bool> {
  final Expression<Number> left;
  final Expression<Number> right;

  EqualNumberExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() == right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitEqualNumber(this);
  }
}

class EqualBoolExpression extends Expression<bool> {
  final Expression<bool> left;
  final Expression<bool> right;

  EqualBoolExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() == right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitEqualBool(this);
  }
}

class EqualStringExpression extends Expression<bool> {
  final Expression<String> left;
  final Expression<String> right;

  EqualStringExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() == right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitEqualString(this);
  }
}

class EqualDateTimeExpression extends Expression<bool> {
  final Expression<DateTime> left;
  final Expression<DateTime> right;

  EqualDateTimeExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate().isAtSameMomentAs(right.evaluate());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitEqualDateTime(this);
  }
}

class EqualDurationExpression extends Expression<bool> {
  final Expression<Duration> left;
  final Expression<Duration> right;

  EqualDurationExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() == right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitEqualDuration(this);
  }
}

class NotEqualNumberExpression extends Expression<bool> {
  final Expression<Number> left;
  final Expression<Number> right;

  NotEqualNumberExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() != right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitNotEqualNumber(this);
  }
}

class NotEqualDurationExpression extends Expression<bool> {
  final Expression<Duration> left;
  final Expression<Duration> right;

  NotEqualDurationExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() != right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitNotEqualDuration(this);
  }
}

class NotEqualDateTimeExpression extends Expression<bool> {
  final Expression<DateTime> left;
  final Expression<DateTime> right;

  NotEqualDateTimeExpression(this.left, this.right);

  @override
  bool evaluate() {
    return !left.evaluate().isAtSameMomentAs(right.evaluate());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitNotEqualDateTime(this);
  }
}

class NotEqualBoolExpression extends Expression<bool> {
  final Expression<bool> left;
  final Expression<bool> right;

  NotEqualBoolExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() != right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitNotEqualBool(this);
  }
}

class NotEqualStringExpression extends Expression<bool> {
  final Expression<String> left;
  final Expression<String> right;

  NotEqualStringExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() != right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitNotEqualString(this);
  }
}

class LessThanNumberExpression extends Expression<bool> {
  final Expression<Number> left;
  final Expression<Number> right;

  LessThanNumberExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() < right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitLessThanNumber(this);
  }
}

class LessThanDurationExpression extends Expression<bool> {
  final Expression<Duration> left;
  final Expression<Duration> right;

  LessThanDurationExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() < right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitLessThanDuration(this);
  }
}

class LessThanDateTimeExpression extends Expression<bool> {
  final Expression<DateTime> left;
  final Expression<DateTime> right;

  LessThanDateTimeExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate().isBefore(right.evaluate());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitLessThanDateTime(this);
  }
}

class LessThanOrEqualNumberExpression extends Expression<bool> {
  final Expression<Number> left;
  final Expression<Number> right;

  LessThanOrEqualNumberExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() <= right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitLessThanOrEqualNumber(this);
  }
}

class LessThanOrEqualDurationExpression extends Expression<bool> {
  final Expression<Duration> left;
  final Expression<Duration> right;

  LessThanOrEqualDurationExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() <= right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitLessThanOrEqualDuration(this);
  }
}

class LessThanOrEqualDateTimeExpression extends Expression<bool> {
  final Expression<DateTime> left;
  final Expression<DateTime> right;

  LessThanOrEqualDateTimeExpression(this.left, this.right);

  @override
  bool evaluate() {
    return (left.evaluate().isBefore(right.evaluate()) ||
        (left.evaluate().isAtSameMomentAs(right.evaluate())));
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitLessThanOrEqualDateTime(this);
  }
}

class DelegateExpression<T> extends Expression<T> {
  final ExpressionProvider<T> expressionProvider;
  final List<String> expressionPath;

  DelegateExpression(this.expressionPath, this.expressionProvider);

  @override
  T evaluate() {
    return expressionProvider.getExpression().evaluate();
  }

  ExpressionProvider<T> getExpressionProvider<T>() {
    return expressionProvider as ExpressionProvider<
        T>; //Doesn't work without as, probably compiler error
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDelegate(this);
  }
}

class ConditionalExpression<T> extends Expression<T> {
  Expression<bool> condition;
  Expression<T> trueValue;
  Expression<T> falseValue;

  ConditionalExpression(this.condition, this.trueValue, this.falseValue);

  @override
  T evaluate() {
    return condition.evaluate() ? trueValue.evaluate() : falseValue.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitConditionalExpression(this);
  }
}

class LengthFunctionExpression extends Expression<Integer> {
  final Expression<String> value;

  LengthFunctionExpression(this.value);

  @override
  Integer evaluate() {
    return new Integer(value.evaluate().length);
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitLengthFunction(this);
  }
}

class ToStringFunctionExpression<T> extends Expression<String> {
  final Expression<T> value;

  ToStringFunctionExpression(this.value);

  @override
  String evaluate() {
    return value.evaluate().toString();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitToStringFunction(this);
  }
}

class IntegerDivisionNumberExpression extends Expression<Integer> {
  final Expression<Number> left;
  final Expression<Number> right;

  IntegerDivisionNumberExpression(this.left, this.right);

  @override
  Integer evaluate() {
    Number rightValue = right.evaluate();
    Decimal epsilon = Decimal.parse("1e-15");
    if (rightValue.abs() < epsilon)
      throw DivideByZeroException("Division by zero");
    return left.evaluate() ~/ right.evaluate();
  }

  @override
  Type getType() {
    return getTypeOfNumberExpression(left.getType(), right.getType());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitIntegerDivisionNumber(this);
  }
}

class DivisionNumberExpression extends Expression<Number> {
  final Expression<Number> left;
  final Expression<Number> right;

  DivisionNumberExpression(this.left, this.right);

  @override
  String toString() {
    return "DivisionExpression";
  }

  @override
  Decimal evaluate() {
    Number rightValue = right.evaluate();
    Decimal epsilon = Decimal.parse("1e-15");
    if (rightValue.abs() < epsilon)
      throw DivideByZeroException("Division by zero");
    return left.evaluate() / right.evaluate();
  }

  @override
  Type getType() {
    return getTypeOfNumberExpression(left.getType(), right.getType());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDivision(this);
  }
}

class ModuloExpression extends Expression<Number> {
  final Expression<Number> left;
  final Expression<Number> right;

  ModuloExpression(this.left, this.right);

  @override
  String toString() {
    return "ModuloExpression";
  }

  @override
  Number evaluate() {
    return left.evaluate() % right.evaluate();
  }

  @override
  Type getType() {
    return getTypeOfNumberExpression(left.getType(), right.getType());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitModulo(this);
  }
}

class DateTimePlusDurationExpression extends Expression<DateTime> {
  final Expression<DateTime> left;
  final Expression<Duration> right;

  DateTimePlusDurationExpression(this.left, this.right);
  @override
  DateTime evaluate() {
    return left.evaluate().add(right.evaluate());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDateTimePlusDuration(this);
  }
}

class DateTimeMinusDurationExpression extends Expression<DateTime> {
  final Expression<DateTime> left;
  final Expression<Duration> right;

  DateTimeMinusDurationExpression(this.left, this.right);
  @override
  DateTime evaluate() {
    return left.evaluate().subtract(right.evaluate());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDateTimeMinusDuration(this);
  }
}

class PlusDurationExpression extends Expression<Duration> {
  final Expression<Duration> left;
  final Expression<Duration> right;

  PlusDurationExpression(this.left, this.right);

  @override
  Duration evaluate() {
    return left.evaluate() + right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitPlusDuration(this);
  }
}

class MinusDurationExpression extends Expression<Duration> {
  final Expression<Duration> left;
  final Expression<Duration> right;

  MinusDurationExpression(this.left, this.right);

  @override
  Duration evaluate() {
    return left.evaluate() - right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitMinusDuration(this);
  }
}

class MultiplyDurationExpression extends Expression<Duration> {
  final Expression<Duration> left;
  final Expression<Integer> right;

  MultiplyDurationExpression(this.left, this.right);

  @override
  Duration evaluate() {
    return left.evaluate() * right.evaluate().value;
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitMultiplyDuration(this);
  }
}

class DivisionDurationExpression extends Expression<Duration> {
  final Expression<Duration> left;
  final Expression<Integer> right;

  DivisionDurationExpression(this.left, this.right);

  @override
  Duration evaluate() {
    if (right.evaluate().value == 0)
      throw DivideByZeroException("Division by zero");
    return left.evaluate() ~/ right.evaluate().value;
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDivisionDuration(this);
  }
}

class NegateDurationExpression extends Expression<Duration> {
  final Expression<Duration> value;

  NegateDurationExpression(this.value);

  @override
  Duration evaluate() {
    return -value.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitNegateDuration(this);
  }
}

class ListCountFunctionExpression<T> extends Expression<int> {
  final Expression<List<T>> value;

  ListCountFunctionExpression(this.value);

  @override
  int evaluate() {
    return value.evaluate().length;
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitListCountFunction(this);
  }
}

class RoundFunctionIntRoundingModeExpression extends Expression<Number> {
  final Expression<Number> value;
  final Expression<Integer> precision;
  final Expression<Integer> roundingMode;

  RoundFunctionIntRoundingModeExpression(
      this.value, this.precision, this.roundingMode);

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitRoundFunctionIntRoundingMode(this);
  }

  @override
  Number evaluate() {
    int roundingModeInt = roundingMode.evaluate().value;
    if ((roundingModeInt >= RoundingMode.values.length) ||
        (roundingModeInt < 0))
      throw InvalidParameter(
          "Rounding mode has to be integer in range [0,${RoundingMode.values.length - 1}");
    return value.evaluate().roundWithPrecision(precision.evaluate().value,
        RoundingMode.values[roundingMode.evaluate().value]);
  }
}

class RoundFunctionStringRoundingModeExpression extends Expression<Number> {
  final Expression<Number> value;
  final Expression<Integer> precision;
  final Expression<String> roundingMode;

  RoundFunctionStringRoundingModeExpression(
      this.value, this.precision, this.roundingMode);

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitRoundFunctionStringRoundingMode(this);
  }

  @override
  Number evaluate() {
    String roundingModeString = roundingMode.evaluate();
    String nameOfEnum = RoundingMode.nearestEven.toString().split('.').first;
    RoundingMode mode = RoundingMode.values.firstWhere(
        (e) => e.toString() == nameOfEnum + '.' + roundingModeString,
        orElse: () => throw InvalidParameter(
            "Rounding mode $roundingModeString does not exist"));
    return value
        .evaluate()
        .roundWithPrecision(precision.evaluate().value, mode);
  }
}

class RoundFunctionExpression extends Expression<Number> {
  final Expression<Number> value;
  final Expression<Number> precision;

  RoundFunctionExpression(this.value, this.precision);

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitRoundFunction(this);
  }

  @override
  Number evaluate() {
    return value
        .evaluate()
        .roundWithPrecision(precision.evaluate().toInteger().value);
  }
}

class DateTimeFunctionExpression extends Expression<DateTime> {
  final Expression<String> value;

  DateTimeFunctionExpression(this.value);

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDateTimeFunction(this);
  }

  @override
  DateTime evaluate() {
    DateTime returnValue = DateTime.tryParse(value.evaluate());
    if (returnValue == null) {
      throw InvalidParameter("Invalid format of date-time string");
    }
    return returnValue;
  }
}

class DurationFunctionExpression extends Expression<Duration> {
  final Expression<String> value;

  DurationFunctionExpression(this.value);

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDurationFunction(this);
  }

  @override
  Duration evaluate() {
    return convertIso8601DurationToDuration(value.evaluate());
  }

  Duration convertIso8601DurationToDuration(String input) {
    List<int> values = List(4);
    RegExp validator =
        RegExp(r"^P(([0-9]+D)?T?([0-9]+H)?([0-9]+M)?([0-9]+S)?)$");
    if (!validator.hasMatch(input)) {
      throw InvalidParameter("Invalid format of duration string");
    }
    List<RegExp> regularExpressions = [
      RegExp(r"[0-9]+D"),
      RegExp(r"[0-9]+H"),
      RegExp(r"[0-9]+M"),
      RegExp(r"[0-9]+S")
    ];
    List<String> matchedStrings = [
      regularExpressions[0].stringMatch(input),
      regularExpressions[1].stringMatch(input),
      regularExpressions[2].stringMatch(input),
      regularExpressions[3].stringMatch(input)
    ];

    for (int i = 0; i < matchedStrings.length; i++) {
      if ((matchedStrings[i] != null) && (matchedStrings.isNotEmpty)) {
        values[i] = int.parse(
            matchedStrings[i].substring(0, matchedStrings[i].length - 1));
      } else {
        values[i] = 0;
      }
    }
    return Duration(
        days: values[0],
        hours: values[1],
        minutes: values[2],
        seconds: values[3]);
  }
}

class NowFunctionExpression extends Expression<DateTime> {
  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitNowFunction(this);
  }

  @override
  DateTime evaluate() => DateTime.now();
}

class NowInUtcFunctionExpression extends Expression<DateTime> {
  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitNowInUtcFunction(this);
  }

  @override
  DateTime evaluate() => DateTime.now().toUtc();
}

class DiffDateTimeFunctionExpression extends Expression<Duration> {
  final Expression<DateTime> left;
  final Expression<DateTime> right;

  DiffDateTimeFunctionExpression(this.left, this.right);

  @override
  Duration evaluate() {
    var diff = left.evaluate().difference(right.evaluate());
    return (diff < Duration(microseconds: 0)) ? (-diff) : diff;
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDiffDateTimeFunction(this);
  }
}

class DurationInDaysFunctionExpression extends Expression<Integer> {
  final Expression<Duration> value;

  DurationInDaysFunctionExpression(this.value);

  @override
  Integer evaluate() {
    return Integer(value.evaluate().inDays);
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDurationInDaysFunction(this);
  }
}

class DurationInHoursFunctionExpression extends Expression<Integer> {
  final Expression<Duration> value;

  DurationInHoursFunctionExpression(this.value);

  @override
  Integer evaluate() {
    return Integer(value.evaluate().inHours);
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDurationInHoursFunction(this);
  }
}

class DurationInMinutesFunctionExpression extends Expression<Integer> {
  final Expression<Duration> value;

  DurationInMinutesFunctionExpression(this.value);

  @override
  Integer evaluate() {
    return Integer(value.evaluate().inMinutes);
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDurationInMinutesFunction(this);
  }
}

class DurationInSecondsFunctionExpression extends Expression<Integer> {
  final Expression<Duration> value;

  DurationInSecondsFunctionExpression(this.value);

  @override
  Integer evaluate() {
    return Integer(value.evaluate().inSeconds);
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDurationInSecondsFunction(this);
  }
}

Type getTypeOfNumberExpression(Type left, Type right) {
  if (left != right) {
    //One of them has to be decimal => whole expr is decimal
    return Decimal;
  }
  return left;
}
