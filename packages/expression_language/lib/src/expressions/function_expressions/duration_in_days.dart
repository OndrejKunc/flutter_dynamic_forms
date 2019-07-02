import 'package:expression_language/expression_language.dart';

class DurationInDaysFunctionExpression extends Expression<Integer> {
  final Expression<Duration> value;

  DurationInDaysFunctionExpression(this.value);

  @override
  Integer evaluate() {
    return Integer(value.evaluate().inDays);
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDurationInDaysFunction(this);
  }
}

class DurationInHoursFunctionExpression extends Expression<Integer> {
  final Expression<Duration> value;

  DurationInHoursFunctionExpression(this.value);

  @override
  Integer evaluate() {
    return Integer(value.evaluate().inHours);
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDurationInHoursFunction(this);
  }
}