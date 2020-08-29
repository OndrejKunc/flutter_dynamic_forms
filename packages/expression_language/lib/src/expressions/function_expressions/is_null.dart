import 'package:expression_language/expression_language.dart';

class IsNullFunctionExpression<T> extends Expression<bool> {
  final Expression<T> value;

  IsNullFunctionExpression(this.value);

  @override
  bool evaluate() {
    return value.evaluate() == null;
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitIsNullFunction(this);
  }
}
