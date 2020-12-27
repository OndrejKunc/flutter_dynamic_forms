// GENERATED CODE - DO NOT MODIFY BY HAND

//ignore_for_file: unused_import
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class SingleSelectGroup<TSingleSelectChoice extends SingleSelectChoice> extends FormElement {
  static const String choicesPropertyName = 'choices';
  static const String valuePropertyName = 'value';

  Property<List<TSingleSelectChoice>> get choicesProperty => properties[choicesPropertyName];
  set choicesProperty(Property<List<TSingleSelectChoice>> value) =>
      registerProperty(choicesPropertyName, value);
  List<TSingleSelectChoice> get choices =>
      choicesProperty.value;
  Stream<List<TSingleSelectChoice>> get choicesChanged => choicesProperty.valueChanged;

  Property<String> get valueProperty => properties[valuePropertyName];
  set valueProperty(Property<String> value) =>
      registerProperty(valuePropertyName, value);
  String get value =>
      valueProperty.value;
  Stream<String> get valueChanged => valueProperty.valueChanged;

  @override
  FormElement getInstance() {
    return SingleSelectGroup();
  }
}
