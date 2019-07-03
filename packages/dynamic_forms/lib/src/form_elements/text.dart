import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_elements/form_element.dart';
import 'package:dynamic_forms/src/form_elements/validation.dart';
import 'package:meta/meta.dart';

class Text extends FormElement {
  final String VALUE_PROPERTY_NAME = "value";
  final String LABEL_PROPERTY_NAME = "label";
  final TEXT_INPUT_TYPE_PROPERTY_NAME = "textInputType";
  final VALIDATIONS_PROPERTY_NAME = "validations";

  String get label => properties[LABEL_PROPERTY_NAME].value;
  Stream get labelChanged => properties[LABEL_PROPERTY_NAME].valueChanged;
  String get value => properties[VALUE_PROPERTY_NAME].value;
  Stream get valueChanged => properties[VALUE_PROPERTY_NAME].valueChanged;
  String get textInputType => properties[TEXT_INPUT_TYPE_PROPERTY_NAME].value;
  Stream get textInputTypeChanged =>
      properties[TEXT_INPUT_TYPE_PROPERTY_NAME].valueChanged;
  List<Validation> get validations =>
      properties[VALIDATIONS_PROPERTY_NAME].value;
  Stream get validationsChanged =>
      properties[VALIDATIONS_PROPERTY_NAME].valueChanged;

  void fillText({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<String> value,
    @required ElementValue<String> label,
    @required ElementValue<String> textInputType,
    @required ElementValue<List<Validation>> validations,
  }) {
    fillFormElement(id: id, parent: parent, isVisible: isVisible);
    registerElementValue(VALUE_PROPERTY_NAME, value);
    registerElementValue(LABEL_PROPERTY_NAME, label);
    registerElementValue(TEXT_INPUT_TYPE_PROPERTY_NAME, textInputType);
    registerElementValue(VALIDATIONS_PROPERTY_NAME, validations);
  }

  @override
  FormElement getInstance() {
    return Text();
  }
}
