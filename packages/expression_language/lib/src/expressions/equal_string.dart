import 'package:expression_language/expression_language.dart';

class EqualStringExpression extends Expression<bool> {
  final Expression<String> left;
  final Expression<String> right;

  EqualStringExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() == right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitEqualString(this);
  }
}
