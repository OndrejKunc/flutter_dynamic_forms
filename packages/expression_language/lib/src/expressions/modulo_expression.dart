import 'package:expression_language/expression_language.dart';

class ModuloExpression extends Expression<Number> {
  final Expression<Number> left;
  final Expression<Number> right;

  ModuloExpression(this.left, this.right);

  @override
  Number evaluate() {
    var rightValue = right.evaluate();
    var epsilon = Decimal.parse('1e-15');
    if (rightValue.abs() < epsilon) {
      throw DivideByZeroException('Modulo by zero');
    }
    return left.evaluate() % right.evaluate();
  }

  @override
  Type getType() {
    return getTypeOfNumberExpression(left.getType(), right.getType());
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      left,
      right,
    ];
  }

  @override
  Expression<Number> clone(Map<String, ExpressionProviderElement> elementMap) {
    return ModuloExpression(left.clone(elementMap), right.clone(elementMap));
  }
}
