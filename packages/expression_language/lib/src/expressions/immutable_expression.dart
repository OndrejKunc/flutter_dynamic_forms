import 'package:expression_language/expression_language.dart';

class ImmutableExpression<T> extends Expression<T> {
  final T value;

  ImmutableExpression(this.value);

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
    return ImmutableExpression<T>(value);
  }
}
