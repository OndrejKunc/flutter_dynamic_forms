// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class Padding extends FormElement {
  static const String childPropertyName = 'child';

  Property<FormElement?> get childProperty => properties[childPropertyName] as Property<FormElement?>;
  set childProperty(Property<FormElement?> value) =>
      registerProperty(childPropertyName, value);
  FormElement? get child =>
      childProperty.value;
  Stream<FormElement?> get childChanged => childProperty.valueChanged;

  @override
  FormElement getInstance() {
    return Padding();
  }
}
