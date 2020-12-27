import 'package:expression_language/expression_language.dart';

class DateTimePlusDurationExpression extends Expression<DateTime> {
  final Expression<DateTime> left;
  final Expression<Duration> right;

  DateTimePlusDurationExpression(this.left, this.right);
  @override
  DateTime evaluate() {
    return left.evaluate().add(right.evaluate());
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
    return DateTimePlusDurationExpression(
        left.clone(elementMap), right.clone(elementMap));
  }
}
