import 'package:dynamic_forms/dynamic_forms.dart';

class Label extends FormElement {
  static const String valuePropertyName = 'value';
  static const String fontSizePropertyName = 'fontSize';

  Property<String> get valueProperty => properties[valuePropertyName];
  set valueProperty(Property<String> value) =>
      registerProperty(valuePropertyName, value);
  String get value => valueProperty.value;

  Property<FontSize> get fontSizeProperty => properties[fontSizePropertyName];
  set fontSizeProperty(Property<FontSize> value) =>
      registerProperty(fontSizePropertyName, value);
  FontSize get fontSize => fontSizeProperty.value;

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
