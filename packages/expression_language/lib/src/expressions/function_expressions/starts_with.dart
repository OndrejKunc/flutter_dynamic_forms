import 'package:expression_language/expression_language.dart';

class StartsWithFunctionExpression extends Expression<bool> {
  final Expression<String> value;
  final Expression<String> searchValue;

  StartsWithFunctionExpression(this.value, this.searchValue);

  @override
  bool evaluate() {
    return value.evaluate().startsWith(searchValue.evaluate());
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
    return StartsWithFunctionExpression(
        value.clone(elementMap), searchValue.clone(elementMap));
  }
}
