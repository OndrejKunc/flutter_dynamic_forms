import 'package:dynamic_forms/src/element_values/element_values.dart';
import 'package:dynamic_forms/src/elements/value_element.dart';
import 'package:expression_language/src/expressions/expression_provider.dart';

class ExampleValueElement extends ValueElement {
  static const String firstPropertyName = "firstProperty";
  static const String secondPropertyName = "secondProperty";
  final String firstProperty;
  final int secondProperty;

  ExampleValueElement(this.firstProperty, this.secondProperty);

  @override
  ExpressionProviderElement clone(
          ExpressionProvider<ExpressionProviderElement> parent) =>
      ExampleValueElement(firstProperty, secondProperty);

  @override
  ExpressionProvider getExpressionProvider([String propertyName]) {
    switch (propertyName) {
      case firstPropertyName:
        {
          return ImmutableElementValue(firstProperty);
        }
      case secondPropertyName:
        {
          return ImmutableElementValue(secondProperty);
        }
      default:
        return null;
    }
  }
}
