import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';

class MutableProperty<T> extends Property<T> {
  final MutableExpression<T> expression;
  bool get ignoreLastChange => _ignoreLastChange;
  bool _ignoreLastChange = false;
  final T _initialValue;
  T _cachedValue;

  MutableProperty(T _value, [T? _initialValue])
      : _cachedValue = _value,
        _initialValue = _initialValue ?? _value,
        expression = MutableExpression(_value);

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
  Property<T> clone() {
    return MutableProperty(value, _initialValue);
  }
}
