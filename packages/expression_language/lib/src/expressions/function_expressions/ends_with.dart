import 'package:expression_language/expression_language.dart';

class EndsWithFunctionExpression extends Expression<bool> {
  final Expression<String> value;
  final Expression<String> searchValue;

  EndsWithFunctionExpression(this.value, this.searchValue);

  @override
  bool evaluate() {
    return value.evaluate().endsWith(searchValue.evaluate());
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
      searchValue,
    ];
  }

  @override
  Expression<bool> clone(Map<String, ExpressionProviderElement> elementMap) {
    return EndsWithFunctionExpression(
        value.clone(elementMap), searchValue.clone(elementMap));
  }
}
