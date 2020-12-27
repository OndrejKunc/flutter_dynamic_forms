import 'package:expression_language/expression_language.dart';

class MinusDurationExpression extends Expression<Duration> {
  final Expression<Duration> left;
  final Expression<Duration> right;

  MinusDurationExpression(this.left, this.right);

  @override
  Duration evaluate() {
    return left.evaluate() - right.evaluate();
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
    return MinusDurationExpression(
        left.clone(elementMap), right.clone(elementMap));
  }
}
