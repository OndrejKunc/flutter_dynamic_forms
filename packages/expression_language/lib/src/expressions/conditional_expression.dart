import 'package:expression_language/expression_language.dart';

class ConditionalExpression<T> extends Expression<T> {
  Expression<bool> condition;
  Expression<T> trueValue;
  Expression<T> falseValue;

  ConditionalExpression(this.condition, this.trueValue, this.falseValue);

  @override
  T evaluate() {
    return condition.evaluate() ? trueValue.evaluate() : falseValue.evaluate();
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      condition,
      trueValue,
      falseValue,
    ];
  }

  @override
  Expression<T> clone(Map<String, ExpressionProviderElement> elementMap) {
    return ConditionalExpression<T>(condition.clone(elementMap),
        trueValue.clone(elementMap), falseValue.clone(elementMap));
  }
}
