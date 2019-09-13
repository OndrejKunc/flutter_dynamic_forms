// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

class CheckBox extends FormElement {
  static const String labelPropertyName = "label";
  static const String valuePropertyName = "value";

  String get label => properties[labelPropertyName].value;
  Stream<String> get labelChanged => properties[labelPropertyName].valueChanged;

  bool get value => properties[valuePropertyName].value;
  Stream<bool> get valueChanged => properties[valuePropertyName].valueChanged;

  void fillCheckBox({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<String> label,
    @required ElementValue<bool> value,
  }) {
    fillFormElement(
      id: id,
      parent: parent,
      isVisible: isVisible,
    );
    registerElementValue(labelPropertyName, label);
    registerElementValue(valuePropertyName, value);
  }

  @override
  FormElement getInstance() {
    return CheckBox();
  }
}
