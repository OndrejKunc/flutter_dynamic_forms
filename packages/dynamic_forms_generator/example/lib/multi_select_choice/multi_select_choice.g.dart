// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class MultiSelectChoice extends FormElement {
  static const String isSelectedPropertyName = "isSelected";
  static const String labelPropertyName = "label";

  bool get isSelected => properties[isSelectedPropertyName].value;
  Stream<bool> get isSelectedChanged => properties[isSelectedPropertyName].valueChanged;

  String get label => properties[labelPropertyName].value;
  Stream<String> get labelChanged => properties[labelPropertyName].valueChanged;

  @override
  FormElement getInstance() {
    return MultiSelectChoice();
  }
}
