// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class ExampleFormElement extends FormElement {
  static const String enumExamplePropertyName = 'enumExample';
  static const String valueExamplePropertyName = 'valueExample';

  Property<ExampleEnumElement> get enumExampleProperty => properties[enumExamplePropertyName];
  set enumExampleProperty(Property<ExampleEnumElement> value) =>
      registerProperty(enumExamplePropertyName, value);
  ExampleEnumElement get enumExample =>
      enumExampleProperty.value;
  Stream<ExampleEnumElement> get enumExampleChanged => enumExampleProperty.valueChanged;

  Property<ExampleValueElement> get valueExampleProperty => properties[valueExamplePropertyName];
  set valueExampleProperty(Property<ExampleValueElement> value) =>
      registerProperty(valueExamplePropertyName, value);
  ExampleValueElement get valueExample =>
      valueExampleProperty.value;
  Stream<ExampleValueElement> get valueExampleChanged => valueExampleProperty.valueChanged;

  @override
  FormElement getInstance() {
    return ExampleFormElement();
  }
}
