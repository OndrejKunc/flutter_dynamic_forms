import 'package:expression_language/expression_language.dart';

class IntToIntegerExpression extends Expression<Integer> {
  final Expression<int> value;

  IntToIntegerExpression(this.value);

  @override
  Integer evaluate() {
    return Integer(value.evaluate());
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
    ];
  }

  @override
  Expression<Integer> clone(Map<String, ExpressionProviderElement> elementMap) {
    return IntToIntegerExpression(value.clone(elementMap));
  }
}
