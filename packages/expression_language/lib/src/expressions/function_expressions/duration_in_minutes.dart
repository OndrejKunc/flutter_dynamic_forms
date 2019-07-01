import 'package:expression_language/expression_language.dart';

class DurationInMinutesFunctionExpression extends Expression<Integer> {
  final Expression<Duration> value;

  DurationInMinutesFunctionExpression(this.value);

  @override
  Integer evaluate() {
    return Integer(value.evaluate().inMinutes);
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDurationInMinutesFunction(this);
  }
}
