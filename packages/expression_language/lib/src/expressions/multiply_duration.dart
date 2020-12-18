import 'package:expression_language/expression_language.dart';

class MultiplyDurationExpression extends Expression<Duration> {
  final Expression<Duration> left;
  final Expression<Integer> right;

  MultiplyDurationExpression(this.left, this.right);

  @override
  Duration evaluate() {
    return left.evaluate() * right.evaluate().value;
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
    return MultiplyDurationExpression(
        left.clone(elementMap), right.clone(elementMap));
  }
}
