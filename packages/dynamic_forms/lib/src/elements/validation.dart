import 'package:dynamic_forms/dynamic_forms.dart';

class Validation extends FormElement {
  static const String isValidPropertyName = 'isValid';
  static const String messagePropertyName = 'message';

  Property<bool> get isValidProperty => properties[isValidPropertyName] as Property<bool>;
  set isValidProperty(Property<bool> value) =>
      registerProperty(isValidPropertyName, value);
  bool get isValid => isValidProperty.value;
  Stream<bool> get isValidChanged => isValidProperty.valueChanged;

  Property<String> get messageProperty => properties[messagePropertyName] as Property<String>;
  set messageProperty(Property<String> value) =>
      registerProperty(messagePropertyName, value);
  String get message => properties[messagePropertyName]!.value;
  Stream<String> get messageChanged => messageProperty.valueChanged;

  @override
  FormElement getInstance() {
    return Validation();
  }
}
