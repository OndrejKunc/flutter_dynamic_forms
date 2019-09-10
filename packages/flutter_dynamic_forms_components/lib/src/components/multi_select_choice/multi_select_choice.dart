import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

class MultiSelectChoice extends FormElement {
  static const String isSelectedPropertyName = "isSelected";
  static const String labelPropertyName = "label";

  String get label => properties[labelPropertyName].value;
  Stream<String> get labelChanged => properties[labelPropertyName].valueChanged;
  bool get isSelected => properties[isSelectedPropertyName].value;
  Stream<bool> get isSelectedChanged =>
      properties[isSelectedPropertyName].valueChanged;

  void fillMultiSelectChoice({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<String> label,
    @required ElementValue<bool> isSelected,
  }) {
    fillFormElement(id: id, parent: parent, isVisible: isVisible);
    registerElementValue(labelPropertyName, label);
    registerElementValue(isSelectedPropertyName, isSelected);
  }

  @override
  FormElement getInstance() {
    return MultiSelectChoice();
  }
}
