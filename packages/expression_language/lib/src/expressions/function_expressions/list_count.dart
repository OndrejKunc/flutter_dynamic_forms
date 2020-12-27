import 'package:expression_language/expression_language.dart';

class ListCountFunctionExpression<T> extends Expression<int> {
  final Expression<List<T>> value;

  ListCountFunctionExpression(this.value);

  @override
  int evaluate() {
    return value.evaluate().length;
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
    ];
  }

  @override
  Expression<int> clone(Map<String, ExpressionProviderElement> elementMap) {
    return ListCountFunctionExpression<T>(value.clone(elementMap));
  }
}
