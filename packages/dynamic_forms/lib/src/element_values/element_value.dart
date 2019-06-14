import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';

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

  ElementValue<T> clone();
}