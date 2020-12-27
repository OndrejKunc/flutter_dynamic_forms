import 'package:expression_language/expression_language.dart';

class DoubleToDecimalExpression extends Expression<Decimal> {
  final Expression<double> value;

  DoubleToDecimalExpression(this.value);

  @override
  Decimal evaluate() {
    return Decimal.fromDouble(value.evaluate());
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
    ];
  }

  @override
  Expression<Decimal> clone(Map<String, ExpressionProviderElement> elementMap) {
    return DoubleToDecimalExpression(value.clone(elementMap));
  }
}
