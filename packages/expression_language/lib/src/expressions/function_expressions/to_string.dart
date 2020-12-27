import 'package:expression_language/expression_language.dart';

class ToStringFunctionExpression<T> extends Expression<String> {
  final Expression<T> value;

  ToStringFunctionExpression(this.value);

  @override
  String evaluate() {
    return value.evaluate().toString();
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
    ];
  }

  @override
  Expression<String> clone(Map<String, ExpressionProviderElement> elementMap) {
    return ToStringFunctionExpression<T>(
      value.clone(elementMap),
    );
  }
}
