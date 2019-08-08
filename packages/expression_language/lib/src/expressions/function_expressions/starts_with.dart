import 'package:expression_language/expression_language.dart';

class StartsWithFunctionExpression extends Expression<bool> {
  final Expression<String> value;
  final Expression<String> searchValue;

  StartsWithFunctionExpression(this.value, this.searchValue);

  @override
  bool evaluate() {
    return value.evaluate().startsWith(searchValue.evaluate());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitStartsWithFunction(this);
  }
}
