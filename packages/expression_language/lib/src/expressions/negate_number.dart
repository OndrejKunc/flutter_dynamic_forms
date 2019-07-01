import 'package:expression_language/expression_language.dart';

class NegateNumberExpression extends Expression<Number> {
  final Expression<Number> value;

  NegateNumberExpression(this.value);

  @override
  Number evaluate() {
    return -value.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitNegateNumber(this);
  }
}
