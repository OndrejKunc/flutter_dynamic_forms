import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/parser/parser_node.dart';

class JsonParserNode extends ParserNode {
  final Map<String, dynamic> element;
  JsonParserNode(this.element);

  @override
  String? getName() {
    return element['@name'];
  }

  @override
  Property<T> getProperty<T>(
      String name, T Function(String s) converter, T Function() defaultValue,
      {bool isImmutable = true}) {
    var property = element[name];
    if (property == null) {
      return createProperty<T>(defaultValue(), isImmutable);
    }
    if (property is String) {
      return createProperty<T>(converter(property), isImmutable);
    }
    if (property is bool && T == bool) {
      return createProperty<T>(property as T, isImmutable);
    }
    if (property is int && T == int) {
      return createProperty<T>(property as T, isImmutable);
    }
    if (property is double && T == double) {
      return createProperty<T>(property as T, isImmutable);
    }
    if (property is Map<String, dynamic>) {
      var expression = property['expression'];
      if (expression != null) {
        return StringExpressionProperty<T>(expression);
      }
    }
    return createProperty<T>(defaultValue(), isImmutable);
  }

  @override
  Property<T?> getNullableProperty<T>(
      String name, T Function(String s) converter, T? Function() defaultValue,
      {bool isImmutable = true}) {
    var property = element[name];
    if (property == null) {
      return createNullableProperty<T>(defaultValue(), isImmutable);
    }
    if (property is String) {
      return createNullableProperty<T>(converter(property), isImmutable);
    }
    if (property is bool && T == bool) {
      return createNullableProperty<T>(property as T, isImmutable);
    }
    if (property is int && T == int) {
      return createNullableProperty<T>(property as T, isImmutable);
    }
    if (property is double && T == double) {
      return createNullableProperty<T>(property as T, isImmutable);
    }
    if (property is Map<String, dynamic>) {
      var expression = property['expression'];
      if (expression != null) {
        return StringExpressionProperty<T?>(expression);
      }
    }
    return createNullableProperty<T>(defaultValue(), isImmutable);
  }

  @override
  String? getPlainString(String propertyName) {
    return element[propertyName];
  }

  @override
  Property<List<TFormElement>> getChildrenProperty<TFormElement>(
      {FormElement? parent,
      required String childrenPropertyName,
      required ElementParserFunction parser,
      bool isContentProperty = false,
      bool isImmutable = true}) {
    var childrenList = element[childrenPropertyName] as List?;
    var children = childrenList == null
        ? <TFormElement>[]
        : childrenList
            .map((c) => parser(JsonParserNode(c), parent))
            .cast<TFormElement>()
            .toList();
    var childrenProperty = createProperty(children, isImmutable);
    return childrenProperty;
  }

  @override
  Property<TFormElement> getChildProperty<TFormElement>({
    required String propertyName,
    required ElementParserFunction parser,
    required FormElement parent,
    required TFormElement Function() defaultValue,
    bool isContentProperty = false,
    bool isImmutable = true,
  }) {
    var childElement = element[propertyName] as Map<String, dynamic>?;

    if (childElement != null) {
      return createProperty<TFormElement>(
          parser(JsonParserNode(childElement), parent) as TFormElement,
          isImmutable);
    }
    return createProperty<TFormElement>(defaultValue(), isImmutable);
  }

  @override
  Property<TFormElement?> getNullableChildProperty<TFormElement>({
    required String propertyName,
    required ElementParserFunction parser,
    required FormElement parent,
    required TFormElement? Function() defaultValue,
    bool isContentProperty = false,
    bool isImmutable = true,
  }) {
    var childElement = element[propertyName] as Map<String, dynamic>?;

    if (childElement != null) {
      return createNullableProperty<TFormElement>(
          parser(JsonParserNode(childElement), parent) as TFormElement,
          isImmutable);
    }
    return createNullableProperty<TFormElement>(defaultValue(), isImmutable);
  }
}
