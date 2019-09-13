// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';
import 'package:meta/meta.dart';

class Text extends FormElement {
  static const String labelPropertyName = "label";
  static const String textInputTypePropertyName = "textInputType";
  static const String validationsPropertyName = "validations";
  static const String valuePropertyName = "value";

  String get label => properties[labelPropertyName].value;
  Stream<String> get labelChanged => properties[labelPropertyName].valueChanged;

  String get textInputType => properties[textInputTypePropertyName].value;
  Stream<String> get textInputTypeChanged => properties[textInputTypePropertyName].valueChanged;

  List<Validation> get validations => properties[validationsPropertyName].value;
  Stream<List<Validation>> get validationsChanged => properties[validationsPropertyName].valueChanged;

  String get value => properties[valuePropertyName].value;
  Stream<String> get valueChanged => properties[valuePropertyName].valueChanged;

  void fillText({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<String> label,
    @required ElementValue<String> textInputType,
    @required ElementValue<List<Validation>> validations,
    @required ElementValue<String> value,
  }) {
    fillFormElement(
      id: id,
      parent: parent,
      isVisible: isVisible,
    );
    registerElementValue(labelPropertyName, label);
    registerElementValue(textInputTypePropertyName, textInputType);
    registerElementValue(validationsPropertyName, validations);
    registerElementValue(valuePropertyName, value);
  }

  @override
  FormElement getInstance() {
    return Text();
  }
}
