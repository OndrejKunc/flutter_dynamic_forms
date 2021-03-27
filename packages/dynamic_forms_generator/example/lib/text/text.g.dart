// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class Text extends FormElement {
  static const String labelPropertyName = 'label';
  static const String textInputTypePropertyName = 'textInputType';
  static const String validationsPropertyName = 'validations';
  static const String valuePropertyName = 'value';

  Property<String> get labelProperty => properties[labelPropertyName] as Property<String>;
  set labelProperty(Property<String> value) =>
      registerProperty(labelPropertyName, value);
  String get label =>
      labelProperty.value;
  Stream<String> get labelChanged => labelProperty.valueChanged;

  Property<String> get textInputTypeProperty => properties[textInputTypePropertyName] as Property<String>;
  set textInputTypeProperty(Property<String> value) =>
      registerProperty(textInputTypePropertyName, value);
  String get textInputType =>
      textInputTypeProperty.value;
  Stream<String> get textInputTypeChanged => textInputTypeProperty.valueChanged;

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
    return Text();
  }
}
