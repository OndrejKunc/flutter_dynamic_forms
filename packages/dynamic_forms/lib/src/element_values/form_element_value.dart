import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';
import 'package:petitparser/petitparser.dart';

abstract class ElementValue<T> implements ExpressionProvider<T> {
  T get value;

  Expression<T> getExpression();

  void addSubscriber(ExpressionElementValue value) {
    subscribers.add(value);
  }

  @protected
  final Set<ExpressionElementValue> subscribers = {};

  @protected
  void notifySubscribers() {
    subscribers.forEach((s) => s.evaluate());
  }
}

class PrimitiveMutableElementValue<T> extends ElementValue<T> {
  MutableExpression<T> expression;
  T _initialValue;
  T _cachedValue;

  PrimitiveMutableElementValue(T _value) {
    _cachedValue = _value;
    _initialValue = _value;
    expression = MutableExpression(_value);
  }

  void setValue(T value) {
    var oldValue = _cachedValue;
    _cachedValue = value;
    expression.value = value;
    if (_cachedValue != oldValue) {
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
}

class PrimitiveImmutableElementValue<T> extends ElementValue<T> {
  final T _value;
  final ImmutableExpression<T> _expression;

  PrimitiveImmutableElementValue(this._value)
      : _expression = ImmutableExpression(_value);

  @override
  T get value => _value;

  @override
  Expression<T> getExpression() {
    return _expression;
  }
}

abstract class ExpressionElementValue<T> extends ElementValue<T> {
  @protected
  Expression<T> _expression;
  T _cachedValue;

  @override
  T get value => _cachedValue == null ? evaluate() : _cachedValue;

  T evaluate() {
    T oldValue = _cachedValue;
    _cachedValue = _expression.evaluate();
    if (_cachedValue != oldValue) {
      notifySubscribers();
    }
    return _cachedValue;
  }

  @override
  Expression<T> getExpression() {
    return _expression;
  }
}

class StringExpressionElementValue<T> extends ExpressionElementValue<T> {
  final String _expressionString;

  StringExpressionElementValue(this._expressionString);

  void buildExpression(Parser parser) {
    var result = parser.parse(_expressionString);
    _expression = result.value as Expression<T>;
  }
}

class ExplicitExpressionElementValue<T> extends ExpressionElementValue<T> {
  ExplicitExpressionElementValue(Expression<T> expression) {
    _expression = expression;
  }
}

class LazyExpressionElementValue<T> extends ExpressionElementValue<T> {
  LazyExpression<T> _lazyExpression;
  LazyExpressionElementValue(this._lazyExpression);

  @override
  Expression<T> getExpression() {
    if (_expression == null) {
      _expression = _lazyExpression();
    }
    return _expression;
  }
}

typedef LazyExpression<T> = Expression<T> Function();
