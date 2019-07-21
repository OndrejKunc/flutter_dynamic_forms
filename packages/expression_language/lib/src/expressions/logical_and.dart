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
  void accept(ExpressionVisitor visitor) {
    visitor.visitLogicalAnd(this);
  }
}
