import 'package:dynamic_forms/dynamic_forms.dart';

class Label extends FormElement {
  static const String valuePropertyName = 'value';
  static const String fontSizePropertyName = 'fontSize';
  static const String testIntPropertyName = 'testInt';
  static const String testDoublePropertyName = 'testDouble';
  static const String testBoolPropertyName = 'testBool';

  Property<String> get valueProperty => properties[valuePropertyName];
  set valueProperty(Property<String> value) =>
      registerProperty(valuePropertyName, value);
  String get value => valueProperty.value;

  Property<FontSize> get fontSizeProperty => properties[fontSizePropertyName];
  set fontSizeProperty(Property<FontSize> value) =>
      registerProperty(fontSizePropertyName, value);
  FontSize get fontSize => fontSizeProperty.value;

  Property<int> get testIntProperty => properties[testIntPropertyName];
  set testIntProperty(Property<int> value) =>
      registerProperty(testIntPropertyName, value);
  int get testInt => testIntProperty.value;

  Property<double> get testDoubleProperty => properties[testDoublePropertyName];
  set testDoubleProperty(Property<double> value) =>
      registerProperty(testDoublePropertyName, value);
  double get testDouble => testDoubleProperty.value;

  Property<bool> get testBoolProperty => properties[testBoolPropertyName];
  set testBoolProperty(Property<bool> value) =>
      registerProperty(testBoolPropertyName, value);
  bool get testBool => testBoolProperty.value;

  @override
  FormElement getInstance() {
    return Label();
  }
}

enum FontSize {
  small,
  medium,
  large,
}
