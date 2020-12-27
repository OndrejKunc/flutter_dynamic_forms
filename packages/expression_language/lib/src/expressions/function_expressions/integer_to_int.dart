import 'package:expression_language/expression_language.dart';

class IntegerToIntExpression extends Expression<int> {
  final Expression<Integer> value;

  IntegerToIntExpression(this.value);

  @override
  int evaluate() {
    return value.evaluate().toInt();
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
    ];
  }

  @override
  Expression<int> clone(Map<String, ExpressionProviderElement> elementMap) {
    return IntegerToIntExpression(value.clone(elementMap));
  }
}
