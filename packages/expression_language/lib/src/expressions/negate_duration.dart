import 'package:expression_language/expression_language.dart';

class NegateDurationExpression extends Expression<Duration> {
  final Expression<Duration> value;

  NegateDurationExpression(this.value);

  @override
  Duration evaluate() {
    return -value.evaluate();
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
    ];
  }

  @override
  Expression<Duration> clone(
      Map<String, ExpressionProviderElement> elementMap) {
    return NegateDurationExpression(value.clone(elementMap));
  }
}
