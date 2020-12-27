import 'package:expression_language/expression_language.dart';

class DivisionDurationExpression extends Expression<Duration> {
  final Expression<Duration> left;
  final Expression<Integer> right;

  DivisionDurationExpression(this.left, this.right);

  @override
  Duration evaluate() {
    if (right.evaluate().value == 0) {
      throw DivideByZeroException('Division by zero');
    }
    return left.evaluate() ~/ right.evaluate().value;
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
    return DivisionDurationExpression(
        left.clone(elementMap), right.clone(elementMap));
  }
}
