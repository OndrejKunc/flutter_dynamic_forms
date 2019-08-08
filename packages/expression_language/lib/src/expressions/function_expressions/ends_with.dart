import 'package:expression_language/expression_language.dart';

class EndsWithFunctionExpression extends Expression<bool> {
  final Expression<String> value;
  final Expression<String> searchValue;

  EndsWithFunctionExpression(this.value, this.searchValue);

  @override
  bool evaluate() {
    return value.evaluate().endsWith(searchValue.evaluate());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitEndsWithFunction(this);
  }
}
