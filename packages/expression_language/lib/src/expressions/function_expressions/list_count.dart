import 'package:expression_language/expression_language.dart';

class ListCountFunctionExpression<T> extends Expression<int> {
  final Expression<List<T>> value;

  ListCountFunctionExpression(this.value);

  @override
  int evaluate() {
    return value.evaluate().length;
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitListCountFunction(this);
  }
}
