// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';
import 'package:meta/meta.dart';

class SingleSelectGroup<TSingleSelectChoice extends SingleSelectChoice> extends FormElement {
  static const String choicesPropertyName = "choices";
  static const String valuePropertyName = "value";

  List<TSingleSelectChoice> get choices => properties[choicesPropertyName].value;
  Stream<List<TSingleSelectChoice>> get choicesChanged => properties[choicesPropertyName].valueChanged;

  String get value => properties[valuePropertyName].value;
  Stream<String> get valueChanged => properties[valuePropertyName].valueChanged;

  void fillCheckBox({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<List<TSingleSelectChoice>> choices,
    @required ElementValue<String> value,
  }) {
  }

  @override
  FormElement getInstance() {
    return SingleSelectGroup();
  }
}
