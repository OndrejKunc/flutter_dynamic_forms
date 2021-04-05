import 'package:expression_language/expression_language.dart';

class NullableIntToIntegerExpression extends Expression<Integer?> {
  final Expression<int?> value;

  NullableIntToIntegerExpression(this.value);

  @override
  Integer? evaluate() {
    var result = value.evaluate();
    if (result == null) {
      return null;
    }
    return Integer(result);
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
    ];
  }

  @override
  Expression<Integer?> clone(
      Map<String, ExpressionProviderElement> elementMap) {
    return NullableIntToIntegerExpression(value.clone(elementMap));
  }
}
