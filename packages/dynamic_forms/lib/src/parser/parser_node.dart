import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';

abstract class ParserNode {
  String getName();
  ElementValue<T> getValue<T>(
      String name, T converter(String s), T defaultValue(),
      {bool isImmutable = true});

  ElementValue<List<TElement>> getChildren<TElement>(
      {@required FormElement parent,
      @required String childrenPropertyName,
      @required ElementParserFunction parser,
      bool isContentProperty = false,
      bool isImmutable = true});

  String getPlainStringValue(String propertyName);

  ElementValue<TEnumElement> getEnum<TEnum, TEnumElement>(
      String name,
      List<TEnum> enumerationValues,
      TEnumElement Function(TEnum _) enumElementConstructor) {
    var inputValueSplits = getStringValue(name).value.split('.');
    var realEnumSplits = enumerationValues.first.toString().split('.');

    var nameOfEnum = realEnumSplits.first;
    var nameOfInputEnum = inputValueSplits.first;

    if (nameOfEnum != nameOfInputEnum) {
      throw "Enumeration $nameOfInputEnum does not exist";
    }

    var constantName = inputValueSplits.last;
    var returnValue = enumerationValues.firstWhere(
        (v) => nameOfEnum + '.' + constantName == v.toString(),
        orElse: () => null);

    if (returnValue == null) {
      throw "Enumeration $nameOfEnum does not have constant named $constantName";
    } else {
      return ImmutableElementValue<TEnumElement>(
          enumElementConstructor(returnValue));
    }
  }

  ElementValue<TElement> getChild<TElement>(
      {@required String name,
      @required ElementParserFunction parser,
      @required String childName,
      @required FormElement parent,
      @required TElement defaultValue(),
      bool isContentProperty = false,
      bool isImmutable = true});

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

  static String emptyString() => "";
  static String convertToString(String x) => x;
  static bool convertToBool(String x) => x?.toLowerCase() == "true";
  static bool defaultFalse() => false;
  static bool defaultTrue() => true;
  static int defaultInt() => 0;
  static Decimal defaultDecimal() => Decimal.fromInt(0);
}
