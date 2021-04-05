import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';

abstract class ParserNode {
  String? getName();
  Property<T> getProperty<T>(
    String name,
    T Function(String s) converter,
    T Function() defaultValue, {
    bool isImmutable = true,
  });

  Property<T?> getNullableProperty<T>(
    String name,
    T Function(String s) converter,
    T? Function() defaultValue, {
    bool isImmutable = true,
  });

  Property<List<TElement>> getChildrenProperty<TElement>({
    required FormElement parent,
    required String childrenPropertyName,
    required ElementParserFunction parser,
    bool isContentProperty = false,
    bool isImmutable = true,
  });

  String? getPlainString(String propertyName);

  Property<TElement> getChildProperty<TElement>({
    required String propertyName,
    required ElementParserFunction parser,
    required FormElement parent,
    required TElement Function() defaultValue,
    bool isContentProperty = false,
    bool isImmutable = true,
  });

  Property<TElement?> getNullableChildProperty<TElement>({
    required String propertyName,
    required ElementParserFunction parser,
    required FormElement parent,
    required TElement? Function() defaultValue,
    bool isContentProperty = false,
    bool isImmutable = true,
  });

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

  Property<bool?> getNullableBoolProperty(
    String name, {
    bool? Function() defaultValue = defaultNullableBool,
    bool isImmutable = true,
  }) {
    return getNullableProperty(
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

  Property<String?> getNullableStringProperty(
    String name, {
    String? Function() defaultValue = defaultNullableString,
    bool isImmutable = true,
  }) {
    return getNullableProperty(
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

  Property<Decimal?> getNullableDecimalProperty(
    String name, {
    Decimal? Function() defaultValue = defaultNullableDecimal,
    bool isImmutable = true,
  }) {
    return getNullableProperty<Decimal>(
      name,
      (s) => Decimal.tryParse(s) ?? defaultDecimal(),
      defaultValue,
      isImmutable: isImmutable,
    );
  }

  Property<TEnum> getEnumProperty<TEnum>(
    String name,
    List<TEnum> enumValues, {
    required TEnum Function() defaultValue,
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
          orElse: defaultValue,
        );
      },
      defaultValue,
      isImmutable: isImmutable,
    );
  }

  Property<TEnum?> getNullableEnumProperty<TEnum>(
    String name,
    List<TEnum> enumValues, {
    TEnum Function()? defaultValue,
    bool isImmutable = true,
  }) {
    return getNullableProperty<TEnum>(
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
          orElse: defaultValue ?? (() => null) as TEnum Function()?,
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

  Property<double?> getNullableDoubleProperty(
    String name, {
    double? Function() defaultValue = defaultNullableDouble,
    bool isImmutable = true,
  }) {
    return getNullableProperty<double>(
      name,
      (s) => double.tryParse(s) ?? defaultDouble(),
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

  Property<int?> getNullableIntProperty(
    String name, {
    int? Function() defaultValue = defaultNullableInt,
    bool isImmutable = true,
  }) {
    return getNullableProperty<int>(
      name,
      (s) => int.tryParse(s) ?? defaultInt(),
      defaultValue,
      isImmutable: isImmutable,
    );
  }

  Property<DateTime> getDateTimeProperty(
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

  Property<DateTime?> getNullableDateTimeProperty(
    String name, {
    DateTime? Function() defaultValue = defaultNullableDateTime,
    bool isImmutable = true,
  }) {
    return getNullableProperty<DateTime?>(
      name,
      (s) => DateTime.tryParse(s) ?? defaultValue(),
      defaultValue,
      isImmutable: isImmutable,
    );
  }

  Property<T> createProperty<T>(T value, bool isImmutable) {
    return isImmutable
        ? ImmutableProperty<T>(value)
        : MutableProperty<T>(value);
  }

  Property<T?> createNullableProperty<T>(T? value, bool isImmutable) {
    return isImmutable
        ? ImmutableProperty<T?>(value)
        : MutableProperty<T?>(value);
  }

  Property<FormElement>? getParentProperty(FormElement? parent) {
    if (parent == null) {
      return null;
    }
    return ImmutableProperty(parent);
  }

  Property<bool> getIsVisibleProperty() =>
      getBoolProperty('isVisible', defaultValue: defaultTrue);

  static String defaultString() => '';
  static String? defaultNullableString() => null;
  static String convertToString(String x) => x;
  static bool convertToBool(String x) => x.toLowerCase() == 'true';
  static int convertToColor(String x) => int.parse(x);
  static bool defaultFalse() => false;
  static bool defaultTrue() => true;
  static bool? defaultNullableBool() => null;
  static int defaultInt() => 0;
  static int? defaultNullableInt() => null;
  static Decimal defaultDecimal() => Decimal.fromInt(0);
  static Decimal? defaultNullableDecimal() => null;
  static double defaultDouble() => 0.0;
  static double? defaultNullableDouble() => null;
  static DateTime defaultDateTime() =>
      DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
  static DateTime? defaultNullableDateTime() => null;
}
