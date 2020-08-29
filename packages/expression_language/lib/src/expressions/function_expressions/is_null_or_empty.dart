import 'package:expression_language/expression_language.dart';

class IsNullOrEmptyFunctionExpression<String> extends Expression<bool> {
  final Expression<String> value;

  IsNullOrEmptyFunctionExpression(this.value);

  @override
  bool evaluate() {
    var result = value.evaluate();
    return result == null || result == '';
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitIsNullOrEmptyFunction(this);
  }
}
