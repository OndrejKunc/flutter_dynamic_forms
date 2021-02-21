import 'package:expression_language/expression_language.dart';

class NullableToNonNullableExpression<T> extends Expression<T> {
  final Expression<T?> value;

  NullableToNonNullableExpression(this.value);

  @override
  T evaluate() {
    var result = value.evaluate();
    if (result == null) {
      throw NullReferenceException(
          'Instance of type $T is null and can\'t be converted to non-nullable');
    }
    return result;
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
    ];
  }

  @override
  Expression<T> clone(Map<String, ExpressionProviderElement> elementMap) {
    return NullableToNonNullableExpression<T>(value.clone(elementMap));
  }
}
