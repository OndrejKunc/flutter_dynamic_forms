import 'package:expression_language/expression_language.dart';

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
        orElse: () => throw InvalidParameterException(
            "Rounding mode $roundingModeString does not exist"));
    return value
        .evaluate()
        .roundWithPrecision(precision.evaluate().value, mode);
  }
}