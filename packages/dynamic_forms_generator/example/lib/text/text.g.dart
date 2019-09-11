// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class Text extends FormElement {
  static const String validationsPropertyName = "validations";
  static const String textInputTypePropertyName = "textInputType";
  static const String valuePropertyName = "value";
  static const String labelPropertyName = "label";

  List<Validation> get validations => properties[validationsPropertyName].value;
  Stream<List<Validation>> get validationsChanged => properties[validationsPropertyName].valueChanged;

  String get textInputType => properties[textInputTypePropertyName].value;
  Stream<String> get textInputTypeChanged => properties[textInputTypePropertyName].valueChanged;

  String get value => properties[valuePropertyName].value;
  Stream<String> get valueChanged => properties[valuePropertyName].valueChanged;

  String get label => properties[labelPropertyName].value;
  Stream<String> get labelChanged => properties[labelPropertyName].valueChanged;

  @override
  FormElement getInstance() {
    return Text();
  }
}
