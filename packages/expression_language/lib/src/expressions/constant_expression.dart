import 'package:expression_language/expression_language.dart';

class ConstantExpression<T> extends Expression<T> {
  final T value;

  ConstantExpression(this.value);

  @override
  T evaluate() {
    return value;
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [];
  }

  @override
  Expression<T> clone(Map<String, ExpressionProviderElement> elementMap) {
    return ConstantExpression<T>(value);
  }
}
