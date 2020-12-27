// GENERATED CODE - DO NOT MODIFY BY HAND

//ignore_for_file: unused_import
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class Label extends FormElement {
  static const String valuePropertyName = 'value';

  Property<String> get valueProperty => properties[valuePropertyName];
  set valueProperty(Property<String> value) =>
      registerProperty(valuePropertyName, value);
  String get value =>
      valueProperty.value;
  Stream<String> get valueChanged => valueProperty.valueChanged;

  @override
  FormElement getInstance() {
    return Label();
  }
}
