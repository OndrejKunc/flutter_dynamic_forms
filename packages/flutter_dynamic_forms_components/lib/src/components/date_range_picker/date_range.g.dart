// GENERATED CODE - DO NOT MODIFY BY HAND

//ignore_for_file: unused_import
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class DateRange extends FormElement {
  static const String firstValuePropertyName = 'firstValue';
  static const String formatPropertyName = 'format';
  static const String initialDatePropertyName = 'initialDate';
  static const String labelPropertyName = 'label';
  static const String maxDatePropertyName = 'maxDate';
  static const String minDatePropertyName = 'minDate';
  static const String secondValuePropertyName = 'secondValue';

  Property<DateTime> get firstValueProperty => properties[firstValuePropertyName];
  set firstValueProperty(Property<DateTime> value) =>
      registerProperty(firstValuePropertyName, value);
  DateTime get firstValue =>
      firstValueProperty.value;
  Stream<DateTime> get firstValueChanged => firstValueProperty.valueChanged;

  Property<String> get formatProperty => properties[formatPropertyName];
  set formatProperty(Property<String> value) =>
      registerProperty(formatPropertyName, value);
  String get format =>
      formatProperty.value;
  Stream<String> get formatChanged => formatProperty.valueChanged;

  Property<DateTime> get initialDateProperty => properties[initialDatePropertyName];
  set initialDateProperty(Property<DateTime> value) =>
      registerProperty(initialDatePropertyName, value);
  DateTime get initialDate =>
      initialDateProperty.value;
  Stream<DateTime> get initialDateChanged => initialDateProperty.valueChanged;

  Property<String> get labelProperty => properties[labelPropertyName];
  set labelProperty(Property<String> value) =>
      registerProperty(labelPropertyName, value);
  String get label =>
      labelProperty.value;
  Stream<String> get labelChanged => labelProperty.valueChanged;

  Property<DateTime> get maxDateProperty => properties[maxDatePropertyName];
  set maxDateProperty(Property<DateTime> value) =>
      registerProperty(maxDatePropertyName, value);
  DateTime get maxDate =>
      maxDateProperty.value;
  Stream<DateTime> get maxDateChanged => maxDateProperty.valueChanged;

  Property<DateTime> get minDateProperty => properties[minDatePropertyName];
  set minDateProperty(Property<DateTime> value) =>
      registerProperty(minDatePropertyName, value);
  DateTime get minDate =>
      minDateProperty.value;
  Stream<DateTime> get minDateChanged => minDateProperty.valueChanged;

  Property<DateTime> get secondValueProperty => properties[secondValuePropertyName];
  set secondValueProperty(Property<DateTime> value) =>
      registerProperty(secondValuePropertyName, value);
  DateTime get secondValue =>
      secondValueProperty.value;
  Stream<DateTime> get secondValueChanged => secondValueProperty.valueChanged;

  @override
  FormElement getInstance() {
    return DateRange();
  }
}
