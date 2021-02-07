import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

abstract class ExpressionProperty<T> extends Property<T> {
  @protected
  T? _cachedValue;

  @override
  T get value => _cachedValue ?? evaluate();

  T evaluate() {
    var oldValue = _cachedValue;
    _cachedValue = getExpression().evaluate();
    if (_cachedValue != oldValue) {
      valueChangedSubject?.add(_cachedValue);
      notifySubscribers();
    }
    return _cachedValue!;
  }

  @override
  Property<T> clone() {
    return CloneableExpressionProperty<T>(getExpression());
  }
}
