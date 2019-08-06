import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';

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

  ElementValue<Decimal> getDecimalValue(
    String name, {
    bool isImmutable = true,
  }) =>
      getValue<Decimal>(
          name, (s) => Decimal.tryParse(s) ?? defaultDecimal(), defaultDecimal,
          isImmutable: isImmutable);

  ElementValue<int> getIntValue(
    String name, {
    bool isImmutable = true,
  }) =>
      getValue<int>(name, (s) => int.tryParse(s) ?? defaultInt(), defaultInt,
          isImmutable: isImmutable);

  ElementValue<T> createElementValue<T>(T value, bool isImmutable) {
    return isImmutable
        ? ImmutableElementValue<T>(value)
        : MutableElementValue<T>(value);
  }

  ElementValue<FormElement> getParentValue(FormElement parent) {
    if (parent == null) {
      return null;
    }
    return ImmutableElementValue(parent);
  }

  String emptyString() => "";
  String convertToString(String x) => x;
  bool convertToBool(String x) => x?.toLowerCase() == "true";
  bool defaultFalse() => false;
  bool defaultTrue() => true;
  int defaultInt() => 0;
  Decimal defaultDecimal() => Decimal.fromInt(0);
}
