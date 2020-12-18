import 'package:expression_language/expression_language.dart';

class LessThanNumberExpression extends Expression<bool> {
  final Expression<Number> left;
  final Expression<Number> right;

  LessThanNumberExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() < right.evaluate();
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
    return LessThanNumberExpression(
        left.clone(elementMap), right.clone(elementMap));
  }
}
