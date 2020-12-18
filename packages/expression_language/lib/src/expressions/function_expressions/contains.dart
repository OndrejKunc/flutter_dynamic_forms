import 'package:expression_language/expression_language.dart';

class ContainsFunctionExpression extends Expression<bool> {
  final Expression<String> value;
  final Expression<String> searchValue;

  ContainsFunctionExpression(this.value, this.searchValue);

  @override
  bool evaluate() {
    return value.evaluate().contains(searchValue.evaluate());
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
    return ContainsFunctionExpression(
        value.clone(elementMap), searchValue.clone(elementMap));
  }
}
