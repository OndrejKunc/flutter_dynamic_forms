import 'package:expression_language/expression_language.dart';

class DivisionNumberExpression extends Expression<Number> {
  final Expression<Number> left;
  final Expression<Number> right;

  DivisionNumberExpression(this.left, this.right);

  @override
  Decimal evaluate() {
    Number rightValue = right.evaluate();
    Decimal epsilon = Decimal.parse("1e-15");
    if (rightValue.abs() < epsilon) {
      throw DivideByZeroException("Division by zero");
    }
    return left.evaluate() / right.evaluate();
  }

  @override
  Type getType() {
    return getTypeOfNumberExpression(left.getType(), right.getType());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDivision(this);
  }
}
