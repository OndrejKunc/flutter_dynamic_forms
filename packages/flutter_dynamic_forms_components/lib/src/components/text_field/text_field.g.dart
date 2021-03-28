// GENERATED CODE - DO NOT MODIFY BY HAND

//ignore_for_file: unused_import
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class TextField extends FormElement {
  static const String inputTypePropertyName = 'inputType';
  static const String labelPropertyName = 'label';
  static const String validationsPropertyName = 'validations';
  static const String valuePropertyName = 'value';

  Property<TextFieldInputType> get inputTypeProperty => properties[inputTypePropertyName] as Property<TextFieldInputType>;
  set inputTypeProperty(Property<TextFieldInputType> value) =>
      registerProperty(inputTypePropertyName, value);
  TextFieldInputType get inputType =>
      inputTypeProperty.value;
  Stream<TextFieldInputType> get inputTypeChanged => inputTypeProperty.valueChanged;

  Property<String> get labelProperty => properties[labelPropertyName] as Property<String>;
  set labelProperty(Property<String> value) =>
      registerProperty(labelPropertyName, value);
  String get label =>
      labelProperty.value;
  Stream<String> get labelChanged => labelProperty.valueChanged;

  Property<List<Validation>> get validationsProperty => properties[validationsPropertyName] as Property<List<Validation>>;
  set validationsProperty(Property<List<Validation>> value) =>
      registerProperty(validationsPropertyName, value);
  List<Validation> get validations =>
      validationsProperty.value;
  Stream<List<Validation>> get validationsChanged => validationsProperty.valueChanged;

  Property<String> get valueProperty => properties[valuePropertyName] as Property<String>;
  set valueProperty(Property<String> value) =>
      registerProperty(valuePropertyName, value);
  String get value =>
      valueProperty.value;
  Stream<String> get valueChanged => valueProperty.valueChanged;

  @override
  FormElement getInstance() {
    return TextField();
  }
}
