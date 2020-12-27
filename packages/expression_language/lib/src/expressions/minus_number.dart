import 'package:expression_language/expression_language.dart';

class MinusNumberExpression extends Expression<Number> {
  final Expression<Number> left;
  final Expression<Number> right;

  MinusNumberExpression(this.left, this.right);

  @override
  Number evaluate() {
    return left.evaluate() - right.evaluate();
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
    return MinusNumberExpression(
        left.clone(elementMap), right.clone(elementMap));
  }
}
