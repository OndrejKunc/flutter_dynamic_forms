// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

class Slider extends FormElement {
  static const String activeColorPropertyName = "activeColor";
  static const String divisionPropertyName = "division";
  static const String inactiveColorPropertyName = "inactiveColor";
  static const String labelPropertyName = "label";
  static const String maxValuePropertyName = "maxValue";
  static const String minValuePropertyName = "minValue";
  static const String valuePropertyName = "value";

  int get activeColor => properties[activeColorPropertyName].value;
  Stream<int> get activeColorChanged =>
      properties[activeColorPropertyName].valueChanged;

  int get division => properties[divisionPropertyName].value;
  Stream<int> get divisionChanged =>
      properties[divisionPropertyName].valueChanged;

  int get inactiveColor => properties[inactiveColorPropertyName].value;
  Stream<int> get inactiveColorChanged =>
      properties[inactiveColorPropertyName].valueChanged;

  String get label => properties[labelPropertyName].value;
  Stream<String> get labelChanged => properties[labelPropertyName].valueChanged;

  double get maxValue => properties[maxValuePropertyName].value;
  Stream<double> get maxValueChanged =>
      properties[maxValuePropertyName].valueChanged;

  double get minValue => properties[minValuePropertyName].value;
  Stream<double> get minValueChanged =>
      properties[minValuePropertyName].valueChanged;

  double get value => properties[valuePropertyName].value;
  Stream<double> get valueChanged => properties[valuePropertyName].valueChanged;

  void fillSlider({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<int> activeColor,
    @required ElementValue<int> division,
    @required ElementValue<int> inactiveColor,
    @required ElementValue<String> label,
    @required ElementValue<double> maxValue,
    @required ElementValue<double> minValue,
    @required ElementValue<double> value,
  }) {
    fillFormElement(
      id: id,
      parent: parent,
      isVisible: isVisible,
    );
    registerElementValue(activeColorPropertyName, activeColor);
    registerElementValue(divisionPropertyName, division);
    registerElementValue(inactiveColorPropertyName, inactiveColor);
    registerElementValue(labelPropertyName, label);
    registerElementValue(maxValuePropertyName, maxValue);
    registerElementValue(minValuePropertyName, minValue);
    registerElementValue(valuePropertyName, value);
  }

  @override
  FormElement getInstance() {
    return Slider();
  }
}
