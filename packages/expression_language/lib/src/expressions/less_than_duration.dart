import 'package:expression_language/expression_language.dart';

class LessThanDurationExpression extends Expression<bool> {
  final Expression<Duration> left;
  final Expression<Duration> right;

  LessThanDurationExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() < right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitLessThanDuration(this);
  }
}
