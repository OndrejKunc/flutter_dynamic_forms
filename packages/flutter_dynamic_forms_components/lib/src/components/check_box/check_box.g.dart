// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class CheckBox extends FormElement {
  static const String labelPropertyName = 'label';
  static const String valuePropertyName = 'value';

  Property<String> get labelProperty => properties[labelPropertyName];
  set labelProperty(Property<String> value) =>
      registerProperty(labelPropertyName, value);
  String get label =>
      labelProperty.value;
  Stream<String> get labelChanged => labelProperty.valueChanged;

  Property<bool> get valueProperty => properties[valuePropertyName];
  set valueProperty(Property<bool> value) =>
      registerProperty(valuePropertyName, value);
  bool get value =>
      valueProperty.value;
  Stream<bool> get valueChanged => valueProperty.valueChanged;

  @override
  FormElement getInstance() {
    return CheckBox();
  }
}
