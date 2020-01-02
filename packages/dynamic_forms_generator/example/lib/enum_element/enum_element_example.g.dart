// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';
import 'package:meta/meta.dart';

enum ExampleEnumElementEnum { firstOption, secondOption,}

class ExampleEnumElement extends EnumElement {
  final ExampleEnumElementEnum enumeration;
  ExampleEnumElement({@required this.enumeration});
  @override
  ExpressionProviderElement clone(
          ExpressionProvider<ExpressionProviderElement> parent) =>
      ExampleEnumElement(enumeration: enumeration);
      
  @override
  ExpressionProvider getExpressionProvider(
          [String propertyName]) =>
      ImmutableProperty(enumeration);
}
