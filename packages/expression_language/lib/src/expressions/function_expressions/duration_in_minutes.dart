import 'package:expression_language/expression_language.dart';

class DurationInMinutesFunctionExpression extends Expression<Integer> {
  final Expression<Duration> value;

  DurationInMinutesFunctionExpression(this.value);

  @override
  Integer evaluate() {
    return Integer(value.evaluate().inMinutes);
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
    ];
  }

  @override
  Expression<Integer> clone(Map<String, ExpressionProviderElement> elementMap) {
    return DurationInMinutesFunctionExpression(value.clone(elementMap));
  }
}
