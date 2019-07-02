import 'package:expression_language/expression_language.dart';

class LessThanNumberExpression extends Expression<bool> {
  final Expression<Number> left;
  final Expression<Number> right;

  LessThanNumberExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate() < right.evaluate();
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitLessThanNumber(this);
  }
}