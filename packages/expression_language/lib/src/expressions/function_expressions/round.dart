import 'package:expression_language/expression_language.dart';

class RoundFunctionExpression extends Expression<Number> {
  final Expression<Number> value;
  final Expression<Number> precision;

  RoundFunctionExpression(this.value, this.precision);

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
      precision,
    ];
  }

  @override
  Expression<Number> clone(Map<String, ExpressionProviderElement> elementMap) {
    return RoundFunctionExpression(
        value.clone(elementMap), precision.clone(elementMap));
  }

  @override
  Number evaluate() {
    return value
        .evaluate()
        .roundWithPrecision(precision.evaluate().toInteger().value);
  }
}
