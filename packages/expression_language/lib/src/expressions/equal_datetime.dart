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
  List<Expression<dynamic>> getChildren() {
    return [
      left,
      right,
    ];
  }

  @override
  Expression<bool> clone(Map<String, ExpressionProviderElement> elementMap) {
    return EqualDateTimeExpression(
        left.clone(elementMap), right.clone(elementMap));
  }
}
