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
  List<Expression<dynamic>> getChildren() {
    return [
      left,
      right,
    ];
  }

  @override
  Expression<bool> clone(Map<String, ExpressionProviderElement> elementMap) {
    return LessThanOrEqualDateTimeExpression(
        left.clone(elementMap), right.clone(elementMap));
  }
}
