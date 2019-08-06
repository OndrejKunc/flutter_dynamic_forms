import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';

class MutableElementValue<T> extends ElementValue<T> {
  MutableExpression<T> expression;
  bool get ignoreLastChange => _ignoreLastChange;
  bool _ignoreLastChange = false;
  T _initialValue;
  T _cachedValue;

  MutableElementValue(T _value, [T _initialValue]) {
    _cachedValue = _value;
    this._initialValue = _initialValue ?? _value;
    expression = MutableExpression(_value);
  }

  void setValue(T value, {bool ignoreLastChange = false}) {
    _ignoreLastChange = ignoreLastChange;
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
    return MutableElementValue(this.value, this._initialValue);
  }
}
