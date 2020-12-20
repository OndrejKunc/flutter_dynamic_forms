import 'package:expression_language/expression_language.dart';

class TestExpression extends Expression<String> {
  final Expression<String> left;
  final Expression<String> right;

  TestExpression(this.left, this.right);

  @override
  Expression<String> clone(Map<String, ExpressionProviderElement> elementMap) {
    return TestExpression(left.clone(elementMap), right.clone(elementMap));
  }

  @override
  String evaluate() {
    return left.evaluate() + right.evaluate();
  }

  @override
  List<Expression> getChildren() {
    return [
      left,
      right,
    ];
  }
}
