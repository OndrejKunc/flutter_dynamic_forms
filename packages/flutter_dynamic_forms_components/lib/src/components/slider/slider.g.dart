// GENERATED CODE - DO NOT MODIFY BY HAND

//ignore_for_file: unused_import
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class Slider extends FormElement {
  static const String activeColorPropertyName = 'activeColor';
  static const String divisionPropertyName = 'division';
  static const String inactiveColorPropertyName = 'inactiveColor';
  static const String labelPropertyName = 'label';
  static const String maxValuePropertyName = 'maxValue';
  static const String minValuePropertyName = 'minValue';
  static const String valuePropertyName = 'value';

  Property<int> get activeColorProperty => properties[activeColorPropertyName] as Property<int>;
  set activeColorProperty(Property<int> value) =>
      registerProperty(activeColorPropertyName, value);
  int get activeColor =>
      activeColorProperty.value;
  Stream<int> get activeColorChanged => activeColorProperty.valueChanged;

  Property<int> get divisionProperty => properties[divisionPropertyName] as Property<int>;
  set divisionProperty(Property<int> value) =>
      registerProperty(divisionPropertyName, value);
  int get division =>
      divisionProperty.value;
  Stream<int> get divisionChanged => divisionProperty.valueChanged;

  Property<int> get inactiveColorProperty => properties[inactiveColorPropertyName] as Property<int>;
  set inactiveColorProperty(Property<int> value) =>
      registerProperty(inactiveColorPropertyName, value);
  int get inactiveColor =>
      inactiveColorProperty.value;
  Stream<int> get inactiveColorChanged => inactiveColorProperty.valueChanged;

  Property<String> get labelProperty => properties[labelPropertyName] as Property<String>;
  set labelProperty(Property<String> value) =>
      registerProperty(labelPropertyName, value);
  String get label =>
      labelProperty.value;
  Stream<String> get labelChanged => labelProperty.valueChanged;

  Property<double> get maxValueProperty => properties[maxValuePropertyName] as Property<double>;
  set maxValueProperty(Property<double> value) =>
      registerProperty(maxValuePropertyName, value);
  double get maxValue =>
      maxValueProperty.value;
  Stream<double> get maxValueChanged => maxValueProperty.valueChanged;

  Property<double> get minValueProperty => properties[minValuePropertyName] as Property<double>;
  set minValueProperty(Property<double> value) =>
      registerProperty(minValuePropertyName, value);
  double get minValue =>
      minValueProperty.value;
  Stream<double> get minValueChanged => minValueProperty.valueChanged;

  Property<double?> get valueProperty => properties[valuePropertyName] as Property<double?>;
  set valueProperty(Property<double?> value) =>
      registerProperty(valuePropertyName, value);
  double? get value =>
      valueProperty.value;
  Stream<double?> get valueChanged => valueProperty.valueChanged;

  @override
  FormElement getInstance() {
    return Slider();
  }
}
