// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';
import 'package:meta/meta.dart';

class MultiSelectGroup<TMultiSelectChoice extends MultiSelectChoice> extends FormElement {
  static const String choicesPropertyName = "choices";

  List<TMultiSelectChoice> get choices => properties[choicesPropertyName].value;
  Stream<List<TMultiSelectChoice>> get choicesChanged => properties[choicesPropertyName].valueChanged;

  void fillCheckBox({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<List<TMultiSelectChoice>> choices,
  }) {
  }

  @override
  FormElement getInstance() {
    return MultiSelectGroup();
  }
}
