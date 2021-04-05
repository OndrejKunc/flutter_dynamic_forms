// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class ExampleFormElement extends FormElement {
  static const String enumExamplePropertyName = 'enumExample';
  static const String valueExamplePropertyName = 'valueExample';

  Property<ExampleEnum> get enumExampleProperty => properties[enumExamplePropertyName] as Property<ExampleEnum>;
  set enumExampleProperty(Property<ExampleEnum> value) =>
      registerProperty(enumExamplePropertyName, value);
  ExampleEnum get enumExample =>
      enumExampleProperty.value;
  Stream<ExampleEnum> get enumExampleChanged => enumExampleProperty.valueChanged;

  Property<ExampleValueElement> get valueExampleProperty => properties[valueExamplePropertyName] as Property<ExampleValueElement>;
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
