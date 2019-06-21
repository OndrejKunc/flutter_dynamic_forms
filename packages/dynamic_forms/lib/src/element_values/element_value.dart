import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

abstract class ElementValue<T> implements ExpressionProvider<T> {
  T get value;

  Expression<T> getExpression();

  Stream<T> get valueChanged => behaviorSubject == null
      ? behaviorSubject = BehaviorSubject<T>.seeded(value)
      : behaviorSubject;

  @protected
  BehaviorSubject<T> behaviorSubject;

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
