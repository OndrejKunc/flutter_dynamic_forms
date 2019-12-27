// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';
import 'package:meta/meta.dart';

class CheckBox extends FormElement {
  static const String labelPropertyName = "label";
  static const String myDatePropertyName = "myDate";
  static const String myDecimalPropertyName = "myDecimal";
  static const String myDoublePropertyName = "myDouble";
  static const String myIntPropertyName = "myInt";
  static const String textColorPropertyName = "textColor";
  static const String valuePropertyName = "value";

  Property<String> get labelProperty => properties[labelPropertyName];
  set labelProperty(Property<String> value) =>
      registerProperty(labelPropertyName, value);
  String get label =>
      labelProperty.value;
  Stream<String> get labelChanged => labelProperty.valueChanged;

  Property<DateTime> get myDateProperty => properties[myDatePropertyName];
  set myDateProperty(Property<DateTime> value) =>
      registerProperty(myDatePropertyName, value);
  DateTime get myDate =>
      myDateProperty.value;
  Stream<DateTime> get myDateChanged => myDateProperty.valueChanged;

  Property<Decimal> get myDecimalProperty => properties[myDecimalPropertyName];
  set myDecimalProperty(Property<Decimal> value) =>
      registerProperty(myDecimalPropertyName, value);
  Decimal get myDecimal =>
      myDecimalProperty.value;
  Stream<Decimal> get myDecimalChanged => myDecimalProperty.valueChanged;

  Property<double> get myDoubleProperty => properties[myDoublePropertyName];
  set myDoubleProperty(Property<double> value) =>
      registerProperty(myDoublePropertyName, value);
  double get myDouble =>
      myDoubleProperty.value;
  Stream<double> get myDoubleChanged => myDoubleProperty.valueChanged;

  Property<int> get myIntProperty => properties[myIntPropertyName];
  set myIntProperty(Property<int> value) =>
      registerProperty(myIntPropertyName, value);
  int get myInt =>
      myIntProperty.value;
  Stream<int> get myIntChanged => myIntProperty.valueChanged;

  Property<String> get textColorProperty => properties[textColorPropertyName];
  set textColorProperty(Property<String> value) =>
      registerProperty(textColorPropertyName, value);
  String get textColor =>
      textColorProperty.value;
  Stream<String> get textColorChanged => textColorProperty.valueChanged;

  Property<bool> get valueProperty => properties[valuePropertyName];
  set valueProperty(Property<bool> value) =>
      registerProperty(valuePropertyName, value);
  bool get value =>
      valueProperty.value;
  Stream<bool> get valueChanged => valueProperty.valueChanged;

  @override
  FormElement getInstance() {
    return CheckBox();
  }
}
