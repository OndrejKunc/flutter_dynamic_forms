import 'package:expression_language/expression_language.dart';

class MutableExpression<T> extends Expression<T> {
  T value;

  MutableExpression(this.value);

  @override
  T evaluate() {
    return value;
  }

  @override
  Type getType() {
    return value.runtimeType;
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [];
  }

  @override
  Expression<T> clone(Map<String, ExpressionProviderElement> elementMap) {
    return MutableExpression<T>(value);
  }
}
