import 'package:expression_language/expression_language.dart';

class DurationInDaysFunctionExpression extends Expression<Integer> {
  final Expression<Duration> value;

  DurationInDaysFunctionExpression(this.value);

  @override
  Integer evaluate() {
    return Integer(value.evaluate().inDays);
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
    ];
  }

  @override
  Expression<Integer> clone(Map<String, ExpressionProviderElement> elementMap) {
    return DurationInDaysFunctionExpression(value.clone(elementMap));
  }
}
