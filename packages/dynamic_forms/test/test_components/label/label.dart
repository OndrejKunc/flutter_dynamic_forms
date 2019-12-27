import 'package:dynamic_forms/dynamic_forms.dart';

class Label extends FormElement {
  static const String valuePropertyName = "value";

  Property<String> get valueProperty => properties[valuePropertyName];
  set valueProperty(Property<String> value) =>
      registerProperty(valuePropertyName, value);
  String get value => valueProperty.value;

  @override
  FormElement getInstance() {
    return Label();
  }
}
