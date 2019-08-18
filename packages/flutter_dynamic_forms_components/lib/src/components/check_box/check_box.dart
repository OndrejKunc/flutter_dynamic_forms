import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

class CheckBox extends FormElement {
  static const String valuePropertyName = "value";
  static const String labelPropertyName = "label";

  bool get value => properties[valuePropertyName].value;
  Stream<bool> get valueChanged => properties[valuePropertyName].valueChanged;
  String get label => properties[labelPropertyName].value;
  Stream<String> get labelChanged => properties[labelPropertyName].valueChanged;

  void fillCheckBox({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<bool> value,
    @required ElementValue<String> label,
  }) {
    fillFormElement(id: id, parent: parent, isVisible: isVisible);
    registerElementValue(valuePropertyName, value);
    registerElementValue(labelPropertyName, label);
  }

  @override
  FormElement getInstance() {
    return CheckBox();
  }
}
