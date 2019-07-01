import 'package:expression_language/expression_language.dart';

class EqualBoolExpression extends Expression<bool> {
  final Expression<bool> left;
  final Expression<bool> right;

  EqualBoolExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() == right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitEqualBool(this);
  }
}
