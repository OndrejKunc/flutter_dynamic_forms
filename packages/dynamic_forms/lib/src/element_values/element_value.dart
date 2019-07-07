import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

abstract class ElementValue<T> implements ExpressionProvider<T> {
  T get value;

  Expression<T> getExpression();

  Stream<T> get valueChanged => valueChangedSubject == null
      ? valueChangedSubject = BehaviorSubject<T>.seeded(value)
      : valueChangedSubject;

  @protected
  BehaviorSubject<T> valueChangedSubject;

  void addSubscriber(ExpressionElementValue expressionElementValue) {
    subscribers.add(expressionElementValue);
  }

  @protected
  final Set<ExpressionElementValue> subscribers = {};

  @protected
  void notifySubscribers() {
    subscribers.forEach((s) => s.evaluate());
  }

  ElementValue<T> clone();
}
