import 'package:expression_language/expression_language.dart';

class LessThanOrEqualDurationExpression extends Expression<bool> {
  final Expression<Duration> left;
  final Expression<Duration> right;

  LessThanOrEqualDurationExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() <= right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitLessThanOrEqualDuration(this);
  }
}
