import 'package:expression_language/expression_language.dart';

class LessThanOrEqualNumberExpression extends Expression<bool> {
  final Expression<Number> left;
  final Expression<Number> right;

  LessThanOrEqualNumberExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() <= right.evaluate();
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      left,
      right,
    ];
  }

  @override
  Expression<bool> clone(Map<String, ExpressionProviderElement> elementMap) {
    return LessThanOrEqualNumberExpression(
        left.clone(elementMap), right.clone(elementMap));
  }
}
