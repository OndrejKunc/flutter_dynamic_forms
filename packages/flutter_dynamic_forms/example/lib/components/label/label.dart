import 'package:dynamic_forms/dynamic_forms.dart';

class Label extends FormElement {
  static const String valuePropertyName = 'value';

  Property<String> get valueProperty =>
      properties[valuePropertyName] as Property<String>;
  set valueProperty(Property<String> value) =>
      registerProperty(valuePropertyName, value);
  String get value => valueProperty.value;
  Stream<String> get valueChanged => valueProperty.valueChanged;

  @override
  FormElement getInstance() {
    return Label();
  }
}
