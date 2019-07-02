import 'package:expression_language/expression_language.dart';

class MultiplyDurationExpression extends Expression<Duration> {
  final Expression<Duration> left;
  final Expression<Integer> right;

  MultiplyDurationExpression(this.left, this.right);

  @override
  Duration evaluate() {
    return left.evaluate() * right.evaluate().value;
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitMultiplyDuration(this);
  }
}