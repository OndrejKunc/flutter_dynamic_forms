import 'package:expression_language/expression_language.dart';

class PlusNumberExpression extends Expression<Number> {
  final Expression<Number> left;
  final Expression<Number> right;

  PlusNumberExpression(this.left, this.right);

  @override
  Number evaluate() {
    return left.evaluate() + right.evaluate();
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
    return PlusNumberExpression(
        left.clone(elementMap), right.clone(elementMap));
  }
}
