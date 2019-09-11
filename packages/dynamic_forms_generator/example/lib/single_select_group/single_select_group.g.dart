// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class SingleSelectGroup<TSingleSelectChoice extends SingleSelectChoice> extends FormElement {
  static const String valuePropertyName = "value";
  static const String choicesPropertyName = "choices";

  String get value => properties[valuePropertyName].value;
  Stream<String> get valueChanged => properties[valuePropertyName].valueChanged;

  List<TSingleSelectChoice> get choices => properties[choicesPropertyName].value;
  Stream<List<TSingleSelectChoice>> get choicesChanged => properties[choicesPropertyName].valueChanged;

  @override
  FormElement getInstance() {
    return SingleSelectGroup();
  }
}
