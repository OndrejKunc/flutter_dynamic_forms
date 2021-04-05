// GENERATED CODE - DO NOT MODIFY BY HAND

//ignore_for_file: unused_import
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class FormGroup extends ItemsContainer {
  static const String namePropertyName = 'name';

  Property<String> get nameProperty => properties[namePropertyName] as Property<String>;
  set nameProperty(Property<String> value) =>
      registerProperty(namePropertyName, value);
  String get name =>
      nameProperty.value;
  Stream<String> get nameChanged => nameProperty.valueChanged;

  @override
  FormElement getInstance() {
    return FormGroup();
  }
}
