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
  List<Expression<dynamic>> getChildren() {
    return [
      left,
      right,
    ];
  }

  @override
  Expression<bool> clone(Map<String, ExpressionProviderElement> elementMap) {
    return LessThanDateTimeExpression(
        left.clone(elementMap), right.clone(elementMap));
  }
}
