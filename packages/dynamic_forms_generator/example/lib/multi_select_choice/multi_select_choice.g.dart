// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';
import 'package:meta/meta.dart';

class MultiSelectChoice extends FormElement {
  static const String isSelectedPropertyName = "isSelected";
  static const String labelPropertyName = "label";

  bool get isSelected => properties[isSelectedPropertyName].value;
  Stream<bool> get isSelectedChanged => properties[isSelectedPropertyName].valueChanged;

  String get label => properties[labelPropertyName].value;
  Stream<String> get labelChanged => properties[labelPropertyName].valueChanged;

  void fillMultiSelectChoice({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<bool> isSelected,
    @required ElementValue<String> label,
  }) {
    fillFormElement(
      id: id,
      parent: parent,
      isVisible: isVisible,
    );
    registerElementValue(isSelectedPropertyName, isSelected);
    registerElementValue(labelPropertyName, label);
  }

  @override
  FormElement getInstance() {
    return MultiSelectChoice();
  }
}
