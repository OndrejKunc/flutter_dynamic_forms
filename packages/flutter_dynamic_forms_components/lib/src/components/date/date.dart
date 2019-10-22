import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

class Date extends FormElement {
  static const String labelPropertyName = "label";
  static const String validationsPropertyName = "validations";
  static const String valuePropertyName = "value";
  static const String formatPropertyName = "format";
  static const String initialDatePropertyName = "initialDate";
  static const String firstDatePropertyName = "firstDate";
  static const String lastDatePropertyName = "lastDate";

  String get label => properties[labelPropertyName].value;
  Stream<String> get labelChanged => properties[labelPropertyName].valueChanged;
  DateTime get dateValue => properties[valuePropertyName].value;
  Stream<DateTime> get dateValueChanged =>
      properties[valuePropertyName].valueChanged;

  String get format => properties[formatPropertyName].value;
  Stream<String> get formatChanged =>
      properties[formatPropertyName].valueChanged;

  DateTime get firstDate => properties[firstDatePropertyName].value;
  DateTime get lastDate => properties[lastDatePropertyName].value;
  DateTime get initialDate => properties[initialDatePropertyName].value;

  void fillDate({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<String> label,
    @required ElementValue<DateTime> value,
    @required ElementValue<String> format,
    @required ElementValue<DateTime> initialDate,
    @required ElementValue<DateTime> firstDate,
    @required ElementValue<DateTime> lastDate,
  }) {
    fillFormElement(
      id: id,
      parent: parent,
      isVisible: isVisible,
    );
    registerElementValue(labelPropertyName, label);
    registerElementValue(valuePropertyName, value);
    registerElementValue(formatPropertyName, format);
    registerElementValue(initialDatePropertyName, initialDate);
    registerElementValue(firstDatePropertyName, firstDate);
    registerElementValue(lastDatePropertyName, lastDate);
  }

  @override
  FormElement getInstance() {
    return Date();
  }
}
