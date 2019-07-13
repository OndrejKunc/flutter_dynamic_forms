import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';

class PrimitiveMutableElementValue<T> extends ElementValue<T> {
  MutableExpression<T> expression;
  T _initialValue;
  T _cachedValue;

  PrimitiveMutableElementValue(T _value, [T _initialValue]) {
    _cachedValue = _value;
    this._initialValue = _initialValue ?? _value;
    expression = MutableExpression(_value);
  }

  void setValue(T value) {
    var oldValue = _cachedValue;
    _cachedValue = value;
    expression.value = value;
    if (_cachedValue != oldValue) {
      valueChangedSubject?.add(_cachedValue);
      notifySubscribers();
    }
  }

  void resetValue() {
    setValue(_initialValue);
  }

  @override
  T get value => _cachedValue;

  @override
  Expression<T> getExpression() {
    return expression;
  }

  @override
  ElementValue<T> clone() {
    return PrimitiveMutableElementValue(this.value, this._initialValue);
  }
}
