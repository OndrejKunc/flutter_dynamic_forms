import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_elements/form_element.dart';
import 'package:meta/meta.dart';

class RadioButton extends FormElement {
  final String VALUE_PROPERTY_NAME = "value";
  final String LABEL_PROPERTY_NAME = "label";

  String get label => properties[LABEL_PROPERTY_NAME].value;
  Stream get labelChanged => properties[LABEL_PROPERTY_NAME].valueChanged;
  String get value => properties[VALUE_PROPERTY_NAME].value;
  Stream get valueChanged => properties[VALUE_PROPERTY_NAME].valueChanged;

  void fillRadioButton({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<String> label,
    @required ElementValue<String> value,
  }) {
    fillFormElement(id: id, parent: parent, isVisible: isVisible);
    registerElementValue(LABEL_PROPERTY_NAME, label);
    registerElementValue(VALUE_PROPERTY_NAME, value);
  }

  @override
  FormElement getInstance() {
    return RadioButton();
  }
}
