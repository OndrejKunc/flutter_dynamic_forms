import 'package:expression_language/expression_language.dart';

class NegateBoolExpression extends Expression<bool> {
  final Expression<bool> value;

  NegateBoolExpression(this.value);

  @override
  bool evaluate() {
    return !value.evaluate();
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
    ];
  }

  @override
  Expression<bool> clone(Map<String, ExpressionProviderElement> elementMap) {
    return NegateBoolExpression(value.clone(elementMap));
  }
}
