import 'package:expression_language/expression_language.dart';

class IsNullFunctionExpression<T> extends Expression<bool> {
  final Expression<T> value;

  IsNullFunctionExpression(this.value);

  @override
  bool evaluate() {
    return value.evaluate() == null;
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
    ];
  }

  @override
  Expression<bool> clone(Map<String, ExpressionProviderElement> elementMap) {
    return IsNullFunctionExpression(value.clone(elementMap));
  }
}
