// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class ExampleValueElement extends ValueElement {
  static const String firstPropertyPropertyName = 'firstProperty';
  static const String secondPropertyPropertyName = 'secondProperty';

  final String firstProperty;
  final int secondProperty;

  ExampleValueElement({
    this.firstProperty = '',
    this.secondProperty = 0,
  });
  @override
  ExpressionProviderElement clone(
          ExpressionProvider<ExpressionProviderElement> parent) =>
  ExampleValueElement(
    firstProperty: firstProperty,
    secondProperty: secondProperty,
  );
  @override
  ExpressionProvider getExpressionProvider([String? propertyName]) {
    switch (propertyName) {
      case firstPropertyPropertyName:
        {
          return ImmutableProperty(firstProperty);
        }
      case secondPropertyPropertyName:
        {
          return ImmutableProperty(secondProperty);
        }
    default:
      throw Exception('Unknown propertyName $propertyName');
    }
  }
}
