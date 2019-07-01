import 'package:expression_language/expression_language.dart';

class RoundFunctionExpression extends Expression<Number> {
  final Expression<Number> value;
  final Expression<Number> precision;

  RoundFunctionExpression(this.value, this.precision);

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitRoundFunction(this);
  }

  @override
  Number evaluate() {
    return value
        .evaluate()
        .roundWithPrecision(precision.evaluate().toInteger().value);
  }
}