import 'package:expression_language/expression_language.dart';

class NullableDoubleToDecimalExpression extends Expression<Decimal?> {
  final Expression<double?> value;

  NullableDoubleToDecimalExpression(this.value);

  @override
  Decimal? evaluate() {
    var result = value.evaluate();
    if (result == null) {
      return null;
    }
    return Decimal.fromDouble(result);
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
    ];
  }

  @override
  Expression<Decimal?> clone(
      Map<String, ExpressionProviderElement> elementMap) {
    return NullableDoubleToDecimalExpression(value.clone(elementMap));
  }
}
