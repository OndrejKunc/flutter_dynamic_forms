import 'package:expression_language/expression_language.dart';

class RoundFunctionStringRoundingModeExpression extends Expression<Number> {
  final Expression<Number> value;
  final Expression<Integer> precision;
  final Expression<String> roundingMode;

  RoundFunctionStringRoundingModeExpression(
      this.value, this.precision, this.roundingMode);

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
      precision,
      roundingMode,
    ];
  }

  @override
  Expression<Number> clone(Map<String, ExpressionProviderElement> elementMap) {
    return RoundFunctionStringRoundingModeExpression(value.clone(elementMap),
        precision.clone(elementMap), roundingMode.clone(elementMap));
  }

  @override
  Number evaluate() {
    var roundingModeString = roundingMode.evaluate();
    var nameOfEnum = RoundingMode.nearestEven.toString().split('.').first;
    var mode = RoundingMode.values.firstWhere(
        (e) => e.toString() == nameOfEnum + '.' + roundingModeString,
        orElse: () => throw InvalidParameterException(
            'Rounding mode $roundingModeString does not exist'));
    return value
        .evaluate()
        .roundWithPrecision(precision.evaluate().value, mode);
  }
}
