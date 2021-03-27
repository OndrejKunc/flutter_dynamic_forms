// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class RadioButtonGroup extends SingleSelectGroup<RadioButton> {
  static const String arrangementPropertyName = 'arrangement';

  Property<String> get arrangementProperty => properties[arrangementPropertyName] as Property<String>;
  set arrangementProperty(Property<String> value) =>
      registerProperty(arrangementPropertyName, value);
  String get arrangement =>
      arrangementProperty.value;
  Stream<String> get arrangementChanged => arrangementProperty.valueChanged;

  @override
  FormElement getInstance() {
    return RadioButtonGroup();
  }
}
