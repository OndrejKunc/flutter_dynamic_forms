import 'package:expression_language/expression_language.dart';

class DoubleToDecimalExpression extends Expression<Decimal> {
  final Expression<double> value;

  DoubleToDecimalExpression(this.value);

  @override
  Decimal evaluate() {
    return Decimal.fromDouble(value.evaluate());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDoubleToDecimal(this);
  }
}
