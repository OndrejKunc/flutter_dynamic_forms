import 'package:expression_language/expression_language.dart';

class IntToIntegerExpression extends Expression<Integer> {
  final Expression<int> value;

  IntToIntegerExpression(this.value);

  @override
  Integer evaluate() {
    return Integer(value.evaluate());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitIntToInteger(this);
  }
}
