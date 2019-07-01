import 'package:expression_language/expression_language.dart';

class PlusNumberExpression extends Expression<Number> {
  final Expression<Number> left;
  final Expression<Number> right;

  PlusNumberExpression(this.left, this.right);

  @override
  Number evaluate() {
    return left.evaluate() + right.evaluate();
  }

  @override
  Type getType() {
    return getTypeOfNumberExpression(left.getType(), right.getType());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitPlusNumber(this);
  }
}
