import 'package:expression_language/expression_language.dart';

class ConstantExpression<T> extends Expression<T> {
  final T value;

  ConstantExpression(this.value);

  @override
  T evaluate() {
    return value;
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitConstant(this);
  }
}
