import 'package:expression_language/expression_language.dart';

class PlusDurationExpression extends Expression<Duration> {
  final Expression<Duration> left;
  final Expression<Duration> right;

  PlusDurationExpression(this.left, this.right);

  @override
  Duration evaluate() {
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
  Expression<Duration> clone(
      Map<String, ExpressionProviderElement> elementMap) {
    return PlusDurationExpression(
        left.clone(elementMap), right.clone(elementMap));
  }
}
