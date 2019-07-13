import 'package:expression_language/expression_language.dart';

class IntegerToIntExpression extends Expression<int> {
  final Expression<Integer> value;

  IntegerToIntExpression(this.value);

  @override
  int evaluate() {
    return value.evaluate().toInt();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitIntegerToInt(this);
  }
}
