import 'package:expression_language/expression_language.dart';

class DiffDateTimeFunctionExpression extends Expression<Duration> {
  final Expression<DateTime> left;
  final Expression<DateTime> right;

  DiffDateTimeFunctionExpression(this.left, this.right);

  @override
  Duration evaluate() {
    var diff = left.evaluate().difference(right.evaluate());
    return (diff < Duration(microseconds: 0)) ? (-diff) : diff;
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
    return DiffDateTimeFunctionExpression(
        left.clone(elementMap), right.clone(elementMap));
  }
}
