import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';

class ImmutableProperty<T> extends Property<T> {
  final T _value;
  final ImmutableExpression<T> _expression;

  ImmutableProperty(this._value) : _expression = ImmutableExpression(_value);

  @override
  T get value => _value;

  @override
  Expression<T> getExpression() {
    return _expression;
  }

  @override
  Property<T> clone() {
    return ImmutableProperty(_value);
  }

  ImmutableProperty<T> cloneWithValue(T value) {
    return ImmutableProperty(value);
  }
}
