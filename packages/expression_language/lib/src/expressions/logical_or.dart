import 'package:expression_language/expression_language.dart';

class LogicalOrExpression extends Expression<bool> {
  final Expression<bool> left;
  final Expression<bool> right;

  LogicalOrExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() || right.evaluate();
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      left,
      right,
    ];
  }

  @override
  Expression<bool> clone(Map<String, ExpressionProviderElement> elementMap) {
    return LogicalOrExpression(left.clone(elementMap), right.clone(elementMap));
  }
}
