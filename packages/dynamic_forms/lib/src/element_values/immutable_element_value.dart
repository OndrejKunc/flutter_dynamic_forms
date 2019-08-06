import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';

class ImmutableElementValue<T> extends ElementValue<T> {
  final T _value;
  final ImmutableExpression<T> _expression;

  ImmutableElementValue(this._value)
      : _expression = ImmutableExpression(_value);

  @override
  T get value => _value;

  @override
  Expression<T> getExpression() {
    return _expression;
  }

  @override
  ElementValue<T> clone() {
    return ImmutableElementValue(_value);
  }

  ImmutableElementValue<T> cloneWithValue(T value) {
    return ImmutableElementValue(value);
  }
}
