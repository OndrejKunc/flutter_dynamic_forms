import 'package:expression_language/expression_language.dart';

class ToStringFunctionExpression<T> extends Expression<String> {
  final Expression<T> value;

  ToStringFunctionExpression(this.value);

  @override
  String evaluate() {
    return value.evaluate().toString();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitToStringFunction(this);
  }
}
