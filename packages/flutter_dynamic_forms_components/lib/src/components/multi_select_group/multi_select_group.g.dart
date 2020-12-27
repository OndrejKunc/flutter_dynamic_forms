// GENERATED CODE - DO NOT MODIFY BY HAND

//ignore_for_file: unused_import
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class MultiSelectGroup<TMultiSelectChoice extends MultiSelectChoice> extends FormElement {
  static const String choicesPropertyName = 'choices';

  Property<List<TMultiSelectChoice>> get choicesProperty => properties[choicesPropertyName];
  set choicesProperty(Property<List<TMultiSelectChoice>> value) =>
      registerProperty(choicesPropertyName, value);
  List<TMultiSelectChoice> get choices =>
      choicesProperty.value;
  Stream<List<TMultiSelectChoice>> get choicesChanged => choicesProperty.valueChanged;

  @override
  FormElement getInstance() {
    return MultiSelectGroup();
  }
}
