import 'package:expression_language/expression_language.dart';

class RoundFunctionIntRoundingModeExpression extends Expression<Number> {
  final Expression<Number> value;
  final Expression<Integer> precision;
  final Expression<Integer> roundingMode;

  RoundFunctionIntRoundingModeExpression(
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
    return RoundFunctionIntRoundingModeExpression(value.clone(elementMap),
        precision.clone(elementMap), roundingMode.clone(elementMap));
  }

  @override
  Number evaluate() {
    var roundingModeInt = roundingMode.evaluate().value;
    if ((roundingModeInt >= RoundingMode.values.length) ||
        (roundingModeInt < 0)) {
      throw InvalidParameterException(
          'Rounding mode has to be integer in range [0,${RoundingMode.values.length - 1}');
    }
    return value.evaluate().roundWithPrecision(precision.evaluate().value,
        RoundingMode.values[roundingMode.evaluate().value]);
  }
}
