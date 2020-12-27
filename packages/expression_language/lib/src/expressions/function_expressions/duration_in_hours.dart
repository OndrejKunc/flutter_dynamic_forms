import 'package:expression_language/expression_language.dart';

class DurationInHoursFunctionExpression extends Expression<Integer> {
  final Expression<Duration> value;

  DurationInHoursFunctionExpression(this.value);

  @override
  Integer evaluate() {
    return Integer(value.evaluate().inHours);
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
    ];
  }

  @override
  Expression<Integer> clone(Map<String, ExpressionProviderElement> elementMap) {
    return DurationInHoursFunctionExpression(value.clone(elementMap));
  }
}
