import 'package:expression_language/expression_language.dart';

class EqualStringExpression extends Expression<bool> {
  final Expression<String> left;
  final Expression<String> right;

  EqualStringExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() == right.evaluate();
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
    return EqualStringExpression(
        left.clone(elementMap), right.clone(elementMap));
  }
}
