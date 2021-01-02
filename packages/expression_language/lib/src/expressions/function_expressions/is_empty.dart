import 'package:expression_language/expression_language.dart';

class IsEmptyFunctionExpression extends Expression<bool> {
  final Expression<String> value;

  IsEmptyFunctionExpression(this.value);

  @override
  bool evaluate() {
    var result = value.evaluate();
    return result == '';
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
    ];
  }

  @override
  Expression<bool> clone(Map<String, ExpressionProviderElement> elementMap) {
    return IsEmptyFunctionExpression(value.clone(elementMap));
  }
}
