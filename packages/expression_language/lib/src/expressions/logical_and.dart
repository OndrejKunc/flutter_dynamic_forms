import 'package:expression_language/expression_language.dart';

class LogicalAndExpression extends Expression<bool> {
  final Expression<bool> left;
  final Expression<bool> right;

  LogicalAndExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() && right.evaluate();
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
    return LogicalAndExpression(
        left.clone(elementMap), right.clone(elementMap));
  }
}
