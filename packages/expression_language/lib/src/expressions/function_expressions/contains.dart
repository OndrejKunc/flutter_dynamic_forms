import 'package:expression_language/expression_language.dart';

class ContainsFunctionExpression extends Expression<bool> {
  final Expression<String> value;
  final Expression<String> searchValue;

  ContainsFunctionExpression(this.value, this.searchValue);

  @override
  bool evaluate() {
    return value.evaluate().contains(searchValue.evaluate());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitContainsFunction(this);
  }
}
