import 'package:expression_language/expression_language.dart';

class DateTimeMinusDurationExpression extends Expression<DateTime> {
  final Expression<DateTime> left;
  final Expression<Duration> right;

  DateTimeMinusDurationExpression(this.left, this.right);
  @override
  DateTime evaluate() {
    return left.evaluate().subtract(right.evaluate());
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      left,
      right,
    ];
  }

  @override
  Expression<DateTime> clone(
      Map<String, ExpressionProviderElement> elementMap) {
    return DateTimeMinusDurationExpression(
        left.clone(elementMap), right.clone(elementMap));
  }
}
