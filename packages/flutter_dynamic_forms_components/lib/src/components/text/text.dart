import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

class Text extends FormElement {
  static const String valuePropertyName = "value";
  static const String labelPropertyName = "label";
  static const String textInputPropertyName = "textInputType";
  static const String validationsPropertyName = "validations";

  String get label => properties[labelPropertyName].value;
  Stream<String> get labelChanged => properties[labelPropertyName].valueChanged;
  String get value => properties[valuePropertyName].value;
  Stream<String> get valueChanged => properties[valuePropertyName].valueChanged;
  String get textInputType => properties[textInputPropertyName].value;
  Stream<String> get textInputTypeChanged =>
      properties[textInputPropertyName].valueChanged;
  List<Validation> get validations => properties[validationsPropertyName].value;
  Stream<List<Validation>> get validationsChanged =>
      properties[validationsPropertyName].valueChanged;

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
    registerElementValue(valuePropertyName, value);
    registerElementValue(labelPropertyName, label);
    registerElementValue(textInputPropertyName, textInputType);
    registerElementValue(validationsPropertyName, validations);
  }

  @override
  FormElement getInstance() {
    return Text();
  }
}
