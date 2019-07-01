import 'package:expression_language/expression_language.dart';

class PlusStringExpression extends Expression<String> {
  final Expression<String> left;
  final Expression<String> right;

  PlusStringExpression(this.left, this.right);

  @override
  String evaluate() {
    return left.evaluate() + right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitPlusString(this);
  }
}
