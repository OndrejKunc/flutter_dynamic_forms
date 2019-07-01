import 'package:expression_language/expression_language.dart';

class DateTimeMinusDurationExpression extends Expression<DateTime> {
  final Expression<DateTime> left;
  final Expression<Duration> right;

  DateTimeMinusDurationExpression(this.left, this.right);
  @override
  DateTime evaluate() {
    return left.evaluate().subtract(right.evaluate());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDateTimeMinusDuration(this);
  }
}