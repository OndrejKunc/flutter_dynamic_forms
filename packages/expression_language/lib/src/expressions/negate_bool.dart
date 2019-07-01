import 'package:expression_language/expression_language.dart';

class NegateBoolExpression extends Expression<bool> {
  final Expression<bool> value;

  NegateBoolExpression(this.value);

  @override
  bool evaluate() {
    return !value.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitNegateBool(this);
  }
}
