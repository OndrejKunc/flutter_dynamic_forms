import 'package:expression_language/expression_language.dart';

class ConversionExpression<TFrom, TTo extends TFrom> extends Expression<TTo> {
  final Expression<TFrom> value;

  ConversionExpression(this.value);

  @override
  TTo evaluate() {
    return value.evaluate() as TTo;
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
    ];
  }

  @override
  Expression<TTo> clone(Map<String, ExpressionProviderElement> elementMap) {
    return ConversionExpression<TFrom, TTo>(value.clone(elementMap));
  }
}
