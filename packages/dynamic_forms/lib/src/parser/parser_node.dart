import 'package:dynamic_forms/dynamic_forms.dart';

abstract class ParserNode {
  String getName();
  ElementValue<T> getValue<T>(
      String name, T converter(String s), T defaultValue(),
      {bool isImmutable = true});

  ElementValue<List<TFormElement>> getChildren<TFormElement>(
      {FormElement parent,
      String childrenPropertyName,
      FormElementParserFunction parser,
      bool isContentProperty = false,
      bool isImmutable = true});

  String getPlainStringValue(String propertyName);

  ElementValue<bool> getIsVisible() =>
      getValue("isVisible", convertToBool, defaultTrue);

  ElementValue<String> getStringValue(String name, {bool isImmutable = true}) =>
      getValue(name, convertToString, emptyString, isImmutable: isImmutable);

  ElementValue<T> createPrimitiveElementValue<T>(T value, bool isImmutable) {
    return isImmutable
        ? PrimitiveImmutableElementValue<T>(value)
        : PrimitiveMutableElementValue<T>(value);
  }

  ElementValue<FormElement> getParentValue(FormElement parent) {
    if (parent == null) {
      return null;
    }
    return PrimitiveImmutableElementValue(parent);
  }

  String emptyString() => "";
  String convertToString(String x) => x;
  bool convertToBool(String x) => x?.toLowerCase() == "true";
  bool defaultFalse() => false;
  bool defaultTrue() => true;
}
