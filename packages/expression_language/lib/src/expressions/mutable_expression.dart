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
  void accept(ExpressionVisitor visitor) {
    visitor.visitMutable(this);
  }
}