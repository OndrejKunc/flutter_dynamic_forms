import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/element_values/element_value.dart';

class JsonParserNode extends ParserNode {
  final Map<String, dynamic> element;
  JsonParserNode(this.element);

  @override
  String getName() {
    return element["@name"];
  }

  @override
  ElementValue<T> getValue<T>(
      String name, T converter(String s), T defaultValue(),
      {bool isImmutable = true}) {
    var elementValue = element[name];
    if (elementValue == null) {
      return createElementValue<T>(defaultValue(), isImmutable);
    }
    if (elementValue is String) {
      return createElementValue<T>(
          converter(elementValue), isImmutable);
    }
    if (elementValue is Map<String, dynamic>) {
      var expression = elementValue["expression"];
      if (expression != null) {
        return StringExpressionElementValue<T>(expression);
      }
    }
    return createElementValue<T>(defaultValue(), isImmutable);
  }

  @override
  String getPlainStringValue(String propertyName) {
    return element[propertyName] ?? null;
  }

  @override
  ElementValue<List<TFormElement>> getChildren<TFormElement>(
      {FormElement parent,
      String childrenPropertyName,
      FormElementParserFunction parser,
      bool isContentProperty = false,
      bool isImmutable = true}) {
    var childrenList = element[childrenPropertyName] as List;
    var children = childrenList == null
        ? List<TFormElement>()
        : childrenList
            .map((c) => parser(JsonParserNode(c), parent))
            .cast<TFormElement>()
            .toList();
    var childrenElementValue =
        createElementValue(children, isImmutable);
    return childrenElementValue;
  }
}
