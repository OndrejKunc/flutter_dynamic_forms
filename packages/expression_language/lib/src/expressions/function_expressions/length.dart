import 'package:expression_language/expression_language.dart';

class LengthFunctionExpression extends Expression<Integer> {
  final Expression<String> value;

  LengthFunctionExpression(this.value);

  @override
  Integer evaluate() {
    return Integer(value.evaluate().length);
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
    ];
  }

  @override
  Expression<Integer> clone(Map<String, ExpressionProviderElement> elementMap) {
    return LengthFunctionExpression(value.clone(elementMap));
  }
}
