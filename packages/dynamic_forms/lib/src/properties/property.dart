import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

abstract class Property<T> implements ExpressionProvider<T> {
  T get value;

  @override
  Expression<T> getExpression();

  Stream<T> get valueChanged =>
      (valueChangedSubject ??= BehaviorSubject<T>.seeded(value)) as Stream<T>;

  @protected
  BehaviorSubject<T?>? valueChangedSubject;

  void addSubscriber(ExpressionProperty expressionProperty) {
    subscribers.add(expressionProperty);
  }

  @protected
  final Set<ExpressionProperty> subscribers = {};

  @protected
  void notifySubscribers() {
    subscribers.forEach((s) => s.evaluate());
  }

  Property<T> clone();
}
