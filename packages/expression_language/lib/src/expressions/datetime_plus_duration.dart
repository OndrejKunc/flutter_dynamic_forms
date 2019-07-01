import 'package:expression_language/expression_language.dart';

class DateTimePlusDurationExpression extends Expression<DateTime> {
  final Expression<DateTime> left;
  final Expression<Duration> right;

  DateTimePlusDurationExpression(this.left, this.right);
  @override
  DateTime evaluate() {
    return left.evaluate().add(right.evaluate());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDateTimePlusDuration(this);
  }
}