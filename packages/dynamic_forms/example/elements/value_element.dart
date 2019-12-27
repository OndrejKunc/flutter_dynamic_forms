import 'package:dynamic_forms/dynamic_forms.dart';
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
          return ImmutableProperty(firstProperty);
        }
      case secondPropertyName:
        {
          return ImmutableProperty(secondProperty);
        }
      default:
        return null;
    }
  }
}
