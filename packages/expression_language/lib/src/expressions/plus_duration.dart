import 'package:expression_language/expression_language.dart';

class PlusDurationExpression extends Expression<Duration> {
  final Expression<Duration> left;
  final Expression<Duration> right;

  PlusDurationExpression(this.left, this.right);

  @override
  Duration evaluate() {
    return left.evaluate() + right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitPlusDuration(this);
  }
}
