import 'package:expression_language/expression_language.dart';

class EqualDurationExpression extends Expression<bool> {
  final Expression<Duration> left;
  final Expression<Duration> right;

  EqualDurationExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() == right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitEqualDuration(this);
  }
}
