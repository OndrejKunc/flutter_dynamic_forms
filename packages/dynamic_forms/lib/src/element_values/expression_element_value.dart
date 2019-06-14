import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

abstract class ExpressionElementValue<T> extends ElementValue<T> {
  @protected
  T _cachedValue;

  @override
  T get value => _cachedValue == null ? evaluate() : _cachedValue;

  T evaluate() {
    T oldValue = _cachedValue;
    _cachedValue = getExpression().evaluate();
    if (_cachedValue != oldValue) {
      notifySubscribers();
    }
    return _cachedValue;
  }

  @override
  ElementValue<T> clone() {
    return CloneableExpressionElementValue<T>(getExpression());
  }
}
