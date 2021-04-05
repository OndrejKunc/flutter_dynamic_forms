import 'package:expression_language/expression_language.dart';

class IsNullOrEmptyFunctionExpression extends Expression<bool> {
  final Expression<String?> value;

  IsNullOrEmptyFunctionExpression(this.value);

  @override
  bool evaluate() {
    var result = value.evaluate();
    return result == null || result == '';
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
    ];
  }

  @override
  Expression<bool> clone(Map<String, ExpressionProviderElement> elementMap) {
    return IsNullOrEmptyFunctionExpression(value.clone(elementMap));
  }
}
