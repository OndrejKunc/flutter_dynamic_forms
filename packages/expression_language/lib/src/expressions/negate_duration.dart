import 'package:expression_language/expression_language.dart';


class NegateDurationExpression extends Expression<Duration> {
  final Expression<Duration> value;

  NegateDurationExpression(this.value);

  @override
  Duration evaluate() {
    return -value.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitNegateDuration(this);
  }
}