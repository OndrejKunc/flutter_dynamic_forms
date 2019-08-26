import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:meta/meta.dart';

class SingleSelectGroup<TSingleSelectChoice extends SingleSelectChoice> extends FormElement {
  static const String valuePropertyName = "value";
  static const String choicesPropertyName = "choices";

  String get value => properties[valuePropertyName].value;
  Stream<String> get valueChanged => properties[valuePropertyName].valueChanged;
  List<TSingleSelectChoice> get choices => properties[choicesPropertyName].value;
  Stream<List<TSingleSelectChoice>> get choicesChanged =>
      properties[choicesPropertyName].valueChanged;

  void fillSingleSelectGroup({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<List<TSingleSelectChoice>> choices,
    @required ElementValue<String> value,
  }) {
    fillFormElement(id: id, parent: parent, isVisible: isVisible);
    registerElementValue(choicesPropertyName, choices);
    registerElementValue(valuePropertyName, value);
  }

  @override
  FormElement getInstance() {
    return SingleSelectGroup<TSingleSelectChoice>();
  }
}
