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
  void accept(ExpressionVisitor visitor) {
    visitor.visitImmutable(this);
  }
}