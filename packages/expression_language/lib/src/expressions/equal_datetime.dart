import 'package:expression_language/expression_language.dart';

class EqualDateTimeExpression extends Expression<bool> {
  final Expression<DateTime> left;
  final Expression<DateTime> right;

  EqualDateTimeExpression(this.left, this.right);

  @override
  bool evaluate() {
    return left.evaluate().isAtSameMomentAs(right.evaluate());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitEqualDateTime(this);
  }
}
