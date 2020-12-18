import 'package:expression_language/expression_language.dart';

class NegateNumberExpression extends Expression<Number> {
  final Expression<Number> value;

  NegateNumberExpression(this.value);

  @override
  Number evaluate() {
    return -value.evaluate();
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
    ];
  }

  @override
  Expression<Number> clone(Map<String, ExpressionProviderElement> elementMap) {
    return NegateNumberExpression(value.clone(elementMap));
  }
}
