import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

class DateRange extends FormElement {
  static const String labelPropertyName = "label";
  static const String validationsPropertyName = "validations";
  static const String firstValuePropertyName = "firstValue";
  static const String secondValuePropertyName = "secondValue";
  static const String formatPropertyName = "format";
  static const String initialDatePropertyName = "initialDate";
  static const String minDatePropertyName = "minDate";
  static const String maxDatePropertyName = "maxDate";

  String get label => properties[labelPropertyName].value;
  Stream<String> get labelChanged => properties[labelPropertyName].valueChanged;
  DateTime get firstValue => properties[firstValuePropertyName].value;
  Stream<DateTime> get firstValueChanged =>
      properties[firstValuePropertyName].valueChanged;

  DateTime get secondValue => properties[secondValuePropertyName].value;
  Stream<DateTime> get secondValueChanged =>
      properties[secondValuePropertyName].valueChanged;

  String get format => properties[formatPropertyName].value;
  Stream<String> get formatChanged =>
      properties[formatPropertyName].valueChanged;

  DateTime get minDate => properties[minDatePropertyName].value;
  DateTime get maxDate => properties[maxDatePropertyName].value;
  DateTime get initialDate => properties[initialDatePropertyName].value;

  void fillDate({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<String> label,
    @required ElementValue<DateTime> firstValue,
    @required ElementValue<DateTime> secondValue,
    @required ElementValue<String> format,
    @required ElementValue<DateTime> initialDate,
    @required ElementValue<DateTime> minDate,
    @required ElementValue<DateTime> maxDate,
  }) {
    fillFormElement(
      id: id,
      parent: parent,
      isVisible: isVisible,
    );
    registerElementValue(labelPropertyName, label);
    registerElementValue(firstValuePropertyName, firstValue);
    registerElementValue(secondValuePropertyName, secondValue);
    registerElementValue(formatPropertyName, format);
    registerElementValue(initialDatePropertyName, initialDate);
    registerElementValue(minDatePropertyName, minDate);
    registerElementValue(maxDatePropertyName, maxDate);
  }

  @override
  FormElement getInstance() {
    return DateRange();
  }
}
