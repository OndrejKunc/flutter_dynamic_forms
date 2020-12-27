import 'package:expression_language/expression_language.dart';

class DecimalToDoubleExpression extends Expression<double> {
  final Expression<Decimal> value;

  DecimalToDoubleExpression(this.value);

  @override
  double evaluate() {
    return value.evaluate().toDouble();
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
    ];
  }

  @override
  Expression<double> clone(Map<String, ExpressionProviderElement> elementMap) {
    return DecimalToDoubleExpression(value.clone(elementMap));
  }
}
