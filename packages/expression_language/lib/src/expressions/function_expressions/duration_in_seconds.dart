import 'package:expression_language/expression_language.dart';

class DurationInSecondsFunctionExpression extends Expression<Integer> {
  final Expression<Duration> value;

  DurationInSecondsFunctionExpression(this.value);

  @override
  Integer evaluate() {
    return Integer(value.evaluate().inSeconds);
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDurationInSecondsFunction(this);
  }
}
