import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

class Date extends FormElement {
  static const String labelPropertyName = "label";
  static const String validationsPropertyName = "validations";
  static const String dateValuePropertyName = "dateValue";
  static const String formatPropertyName = "format";
  static const String firstDatePropertyName = "firstDate";
  static const String lastDatePropertyName = "lastDate";

  String get label => properties[labelPropertyName].value;
  Stream<String> get labelChanged => properties[labelPropertyName].valueChanged;
  String get dateValue => properties[dateValuePropertyName].value;
  Stream<String> get dateValueChanged =>
      properties[dateValuePropertyName].valueChanged;

  String get format => properties[formatPropertyName].value;
  Stream<String> get formatChanged =>
      properties[formatPropertyName].valueChanged;

  int get firstDate => properties[firstDatePropertyName].value; 
  int get lastDate => properties[lastDatePropertyName].value; 

  void fillDate({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<String> label,
    @required ElementValue<String> dateValue,
    @required ElementValue<String> format,
    @required ElementValue<int> firstDate,
    @required ElementValue<int> lastDate,
  }) {
    fillFormElement(
      id: id,
      parent: parent,
      isVisible: isVisible,
    );
    registerElementValue(labelPropertyName, label);
    registerElementValue(dateValuePropertyName, dateValue);
    registerElementValue(formatPropertyName, format);
    registerElementValue(firstDatePropertyName, firstDate);
    registerElementValue(lastDatePropertyName, lastDate);
  }

  @override
  FormElement getInstance() {
    return Date();
  }
}
