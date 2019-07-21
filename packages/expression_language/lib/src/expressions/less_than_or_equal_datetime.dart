import 'package:expression_language/expression_language.dart';

class LessThanOrEqualDateTimeExpression extends Expression<bool> {
  final Expression<DateTime> left;
  final Expression<DateTime> right;

  LessThanOrEqualDateTimeExpression(this.left, this.right);

  @override
  bool evaluate() {
    return (left.evaluate().isBefore(right.evaluate()) ||
        (left.evaluate().isAtSameMomentAs(right.evaluate())));
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitLessThanOrEqualDateTime(this);
  }
}
