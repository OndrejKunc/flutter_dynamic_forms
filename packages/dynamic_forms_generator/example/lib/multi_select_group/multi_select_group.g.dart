// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class MultiSelectGroup<TMultiSelectChoice extends MultiSelectChoice> extends FormElement {
  static const String choicesPropertyName = "choices";

  List<TMultiSelectChoice> get choices => properties[choicesPropertyName].value;
  Stream<List<TMultiSelectChoice>> get choicesChanged => properties[choicesPropertyName].valueChanged;

  @override
  FormElement getInstance() {
    return MultiSelectGroup();
  }
}
