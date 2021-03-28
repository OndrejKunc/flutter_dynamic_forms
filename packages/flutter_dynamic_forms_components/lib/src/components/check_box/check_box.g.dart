// GENERATED CODE - DO NOT MODIFY BY HAND

//ignore_for_file: unused_import
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class CheckBox extends FormElement {
  static const String labelPropertyName = 'label';
  static const String valuePropertyName = 'value';

  Property<String> get labelProperty => properties[labelPropertyName] as Property<String>;
  set labelProperty(Property<String> value) =>
      registerProperty(labelPropertyName, value);
  String get label =>
      labelProperty.value;
  Stream<String> get labelChanged => labelProperty.valueChanged;

  Property<bool> get valueProperty => properties[valuePropertyName] as Property<bool>;
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
