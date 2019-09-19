import 'package:dynamic_forms/src/element_values/element_values.dart';
import 'package:dynamic_forms/src/elements/enum_element.dart';
import 'package:expression_language/src/expressions/expression_provider.dart';

enum Example { firstOption, secondOption }

class EnumElementExample extends EnumElement {
  final Example example;

  EnumElementExample(this.example);

  @override
  ExpressionProviderElement clone(
          ExpressionProvider<ExpressionProviderElement> parent) =>
      EnumElementExample(example);

  @override
  ExpressionProvider getExpressionProvider([String propertyName]) =>
      ImmutableElementValue(example);
}
