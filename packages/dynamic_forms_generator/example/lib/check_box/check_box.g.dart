// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';
import 'package:meta/meta.dart';

class CheckBox extends FormElement {
  static const String labelPropertyName = "label";
  static const String myDatePropertyName = "myDate";
  static const String myDecimalPropertyName = "myDecimal";
  static const String myDoublePropertyName = "myDouble";
  static const String myIntPropertyName = "myInt";
  static const String valuePropertyName = "value";

  String get label => properties[labelPropertyName].value;
  Stream<String> get labelChanged => properties[labelPropertyName].valueChanged;

  DateTime get myDate => properties[myDatePropertyName].value;
  Stream<DateTime> get myDateChanged => properties[myDatePropertyName].valueChanged;

  Decimal get myDecimal => properties[myDecimalPropertyName].value;
  Stream<Decimal> get myDecimalChanged => properties[myDecimalPropertyName].valueChanged;

  double get myDouble => properties[myDoublePropertyName].value;
  Stream<double> get myDoubleChanged => properties[myDoublePropertyName].valueChanged;

  int get myInt => properties[myIntPropertyName].value;
  Stream<int> get myIntChanged => properties[myIntPropertyName].valueChanged;

  bool get value => properties[valuePropertyName].value;
  Stream<bool> get valueChanged => properties[valuePropertyName].valueChanged;

  void fillCheckBox({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<String> label,
    @required ElementValue<DateTime> myDate,
    @required ElementValue<Decimal> myDecimal,
    @required ElementValue<double> myDouble,
    @required ElementValue<int> myInt,
    @required ElementValue<bool> value,
  }) {
    fillFormElement(
      id: id,
      parent: parent,
      isVisible: isVisible,
    );
    registerElementValue(labelPropertyName, label);
    registerElementValue(myDatePropertyName, myDate);
    registerElementValue(myDecimalPropertyName, myDecimal);
    registerElementValue(myDoublePropertyName, myDouble);
    registerElementValue(myIntPropertyName, myInt);
    registerElementValue(valuePropertyName, value);
  }

  @override
  FormElement getInstance() {
    return CheckBox();
  }
}
