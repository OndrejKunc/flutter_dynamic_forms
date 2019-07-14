import 'package:expression_language/expression_language.dart';

class DecimalToDoubleExpression extends Expression<double> {
  final Expression<Decimal> value;

  DecimalToDoubleExpression(this.value);

  @override
  double evaluate() {
    return value.evaluate().toDouble();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDecimalToDouble(this);
  }
}
