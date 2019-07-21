import 'package:expression_language/expression_language.dart';

class LessThanDateTimeExpression extends Expression<bool> {
  final Expression<DateTime> left;
  final Expression<DateTime> right;

  LessThanDateTimeExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate().isBefore(right.evaluate());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitLessThanDateTime(this);
  }
}
