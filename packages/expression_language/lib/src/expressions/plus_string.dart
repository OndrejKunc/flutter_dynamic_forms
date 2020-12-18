import 'package:expression_language/expression_language.dart';

class PlusStringExpression extends Expression<String> {
  final Expression<String> left;
  final Expression<String> right;

  PlusStringExpression(this.left, this.right);

  @override
  String evaluate() {
    return left.evaluate() + right.evaluate();
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      left,
      right,
    ];
  }

  @override
  Expression<String> clone(Map<String, ExpressionProviderElement> elementMap) {
    return PlusStringExpression(
        left.clone(elementMap), right.clone(elementMap));
  }
}
