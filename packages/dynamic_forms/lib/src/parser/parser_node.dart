import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';

abstract class ParserNode {
  String getName();
  Property<T> getValue<T>(String name, T converter(String s), T defaultValue(),
      {bool isImmutable = true});

  Property<List<TElement>> getChildren<TElement>({
    @required FormElement parent,
    @required String childrenPropertyName,
    @required ElementParserFunction parser,
    bool isContentProperty = false,
    bool isImmutable = true,
  });

  String getPlainStringValue(String propertyName);

  Property<TEnumElement> getEnum<TEnum, TEnumElement>({
    @required String name,
    @required List<TEnum> enumerationValues,
    @required TEnumElement Function(TEnum _) enumElementConstructor,
  }) {
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
      return ImmutableProperty<TEnumElement>(
          enumElementConstructor(returnValue));
    }
  }

  Property<TElement> getChild<TElement>(
      {@required String propertyName,
      @required ElementParserFunction parser,
      @required FormElement parent,
      @required TElement defaultValue(),
      bool isContentProperty = false,
      bool isImmutable = true});

  Property<bool> getIsVisible() =>
      getValue("isVisible", convertToBool, defaultTrue);

  Property<String> getStringValue(String name, {bool isImmutable = true}) =>
      getValue(name, convertToString, emptyString, isImmutable: isImmutable);

  Property<Decimal> getDecimalValue(
    String name, {
    bool isImmutable = true,
  }) =>
      getValue<Decimal>(
          name, (s) => Decimal.tryParse(s) ?? defaultDecimal(), defaultDecimal,
          isImmutable: isImmutable);

  Property<double> getDoubleValue(
    String name, {
    bool isImmutable = true,
  }) =>
      getValue<double>(
          name, (s) => double.parse(s) ?? defaultDouble(), defaultDouble,
          isImmutable: isImmutable);

  Property<int> getIntValue(
    String name, {
    bool isImmutable = true,
  }) =>
      getValue<int>(name, (s) => int.tryParse(s) ?? defaultInt(), defaultInt,
          isImmutable: isImmutable);

  Property<T> createProperty<T>(T value, bool isImmutable) {
    return isImmutable
        ? ImmutableProperty<T>(value)
        : MutableProperty<T>(value);
  }

  Property<FormElement> getParentValue(FormElement parent) {
    if (parent == null) {
      return null;
    }
    return ImmutableProperty(parent);
  }

  static String emptyString() => "";
  static String convertToString(String x) => x;
  static bool convertToBool(String x) => x?.toLowerCase() == "true";
  static int convertToColor(String x) => int.parse(x);
  static bool defaultFalse() => false;
  static bool defaultTrue() => true;
  static int defaultInt() => 0;
  static Decimal defaultDecimal() => Decimal.fromInt(0);
  static double defaultDouble() => 2.0;
}
