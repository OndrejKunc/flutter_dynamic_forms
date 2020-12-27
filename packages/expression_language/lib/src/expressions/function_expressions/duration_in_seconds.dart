import 'package:expression_language/expression_language.dart';

class DurationInSecondsFunctionExpression extends Expression<Integer> {
  final Expression<Duration> value;

  DurationInSecondsFunctionExpression(this.value);

  @override
  Integer evaluate() {
    return Integer(value.evaluate().inSeconds);
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
    ];
  }

  @override
  Expression<Integer> clone(Map<String, ExpressionProviderElement> elementMap) {
    return DurationInSecondsFunctionExpression(value.clone(elementMap));
  }
}
