import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';

abstract class ParserNode {
  String getName();
  Property<T> getProperty<T>(
    String name,
    T Function(String s) converter,
    T Function() defaultValue, {
    bool isImmutable = true,
  });

  Property<List<TElement>> getChildrenProperty<TElement>({
    @required FormElement parent,
    @required String childrenPropertyName,
    @required ElementParserFunction parser,
    bool isContentProperty = false,
    bool isImmutable = true,
  });

  String getPlainString(String propertyName);

  Property<TElement> getChildProperty<TElement>(
      {@required String propertyName,
      @required ElementParserFunction parser,
      @required FormElement parent,
      @required TElement Function() defaultValue,
      bool isContentProperty = false,
      bool isImmutable = true});

  Property<bool> getBoolProperty(
    String name, {
    bool Function() defaultValue = defaultFalse,
    bool isImmutable = true,
  }) {
    return getProperty(
      name,
      convertToBool,
      defaultValue,
      isImmutable: isImmutable,
    );
  }

  Property<String> getStringProperty(
    String name, {
    String Function() defaultValue = defaultString,
    bool isImmutable = true,
  }) {
    return getProperty(
      name,
      convertToString,
      defaultValue,
      isImmutable: isImmutable,
    );
  }

  Property<Decimal> getDecimalProperty(
    String name, {
    Decimal Function() defaultValue = defaultDecimal,
    bool isImmutable = true,
  }) {
    return getProperty<Decimal>(
      name,
      (s) => Decimal.tryParse(s) ?? defaultValue(),
      defaultValue,
      isImmutable: isImmutable,
    );
  }

  Property<TEnum> getEnumProperty<TEnum>(
    String name,
    List<TEnum/*!*/> enumValues, {
    TEnum Function() defaultValue,
    bool isImmutable = true,
  }) {
    return getProperty<TEnum>(
      name,
      (s) {
        var lowerCaseInput = s.toLowerCase();
        return enumValues.firstWhere(
          (e) {
            var enumString = e.toString().toLowerCase();
            if (enumString == lowerCaseInput) {
              return true;
            }
            var lastPart = enumString.split('.').last;
            return lastPart == lowerCaseInput;
          },
          orElse: defaultValue ?? () => null,
        );
      },
      defaultValue ?? () => null,
      isImmutable: isImmutable,
    );
  }

  Property<double> getDoubleProperty(
    String name, {
    double Function() defaultValue = defaultDouble,
    bool isImmutable = true,
  }) {
    return getProperty<double>(
      name,
      (s) => double.tryParse(s) ?? defaultValue(),
      defaultValue,
      isImmutable: isImmutable,
    );
  }

  Property<int> getIntProperty(
    String name, {
    int Function() defaultValue = defaultInt,
    bool isImmutable = true,
  }) {
    return getProperty<int>(
      name,
      (s) => int.tryParse(s) ?? defaultValue(),
      defaultValue,
      isImmutable: isImmutable,
    );
  }

  Property<DateTime/*!*/> getDateTimeProperty(
    String name, {
    DateTime Function() defaultValue = defaultDateTime,
    bool isImmutable = true,
  }) {
    return getProperty<DateTime>(
      name,
      (s) => DateTime.tryParse(s) ?? defaultValue(),
      defaultValue,
      isImmutable: isImmutable,
    );
  }

  Property<T/*!*/> createProperty<T>(T value, bool isImmutable) {
    return isImmutable
        ? ImmutableProperty<T>(value)
        : MutableProperty<T>(value);
  }

  Property<FormElement> getParentProperty(FormElement parent) {
    if (parent == null) {
      return null;
    }
    return ImmutableProperty(parent);
  }

  Property<bool> getIsVisibleProperty() =>
      getProperty('isVisible', convertToBool, defaultTrue);

  static String defaultString() => '';
  static String convertToString(String x) => x;
  static bool convertToBool(String x) => x?.toLowerCase() == 'true';
  static int convertToColor(String x) => int.parse(x);
  static bool defaultFalse() => false;
  static bool defaultTrue() => true;
  static int defaultInt() => 0;
  static Decimal defaultDecimal() => Decimal.fromInt(0);
  static double defaultDouble() => 0.0;
  static DateTime defaultDateTime() => null;
}
