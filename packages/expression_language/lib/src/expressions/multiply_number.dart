import 'package:expression_language/expression_language.dart';

class MultiplyNumberExpression extends Expression<Number> {
  final Expression<Number> left;
  final Expression<Number> right;

  MultiplyNumberExpression(this.left, this.right);

  @override
  Number evaluate() {
    return left.evaluate() * right.evaluate();
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
    return MultiplyNumberExpression(
        left.clone(elementMap), right.clone(elementMap));
  }
}
