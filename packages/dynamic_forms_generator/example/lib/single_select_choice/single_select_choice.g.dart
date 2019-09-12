// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';
import 'package:meta/meta.dart';

class SingleSelectChoice extends FormElement {
  static const String labelPropertyName = "label";
  static const String valuePropertyName = "value";

  String get label => properties[labelPropertyName].value;
  Stream<String> get labelChanged => properties[labelPropertyName].valueChanged;

  String get value => properties[valuePropertyName].value;
  Stream<String> get valueChanged => properties[valuePropertyName].valueChanged;

  void fillSingleSelectChoice({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<String> label,
    @required ElementValue<String> value,
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
    return SingleSelectChoice();
  }
}
