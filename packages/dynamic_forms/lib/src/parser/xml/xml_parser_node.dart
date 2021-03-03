import 'package:collection/collection.dart' show IterableExtension;
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/parser/parser_node.dart';
import 'package:xml/xml.dart';

class XmlParserNode extends ParserNode {
  final XmlElement element;
  XmlParserNode(this.element);

  @override
  String getName() {
    return element.name.qualified;
  }

  @override
  Property<T> getProperty<T>(
      String name, T Function(String s) converter, T Function() defaultValue,
      {bool isImmutable = true}) {
    var property = getPropertyAsElement(element, name);
    if (property != null) {
      var firstChild = property.firstChild;
      if (firstChild != null) {
        if (firstChild is XmlText || firstChild is XmlCDATA) {
          return createProperty<T>(converter(firstChild.text), isImmutable);
        }
        if (firstChild is XmlElement) {
          if (firstChild.name.qualified == 'expression') {
            var expressionChild = firstChild.firstChild!;
            if (expressionChild.nodeType == XmlNodeType.CDATA ||
                expressionChild.nodeType == XmlNodeType.TEXT) {
              return StringExpressionProperty<T>(expressionChild.text);
            }
          }
        }
      }
    }
    var attributeValue = getAttribute(element, name);
    if (attributeValue != null) {
      return createProperty<T>(converter(attributeValue), isImmutable);
    }
    return createProperty<T>(defaultValue(), isImmutable);
  }

  @override
  Property<T?> getNullableProperty<T>(
      String name, T Function(String s) converter, T? Function() defaultValue,
      {bool isImmutable = true}) {
    var property = getPropertyAsElement(element, name);
    if (property != null) {
      var firstChild = property.firstChild;
      if (firstChild != null) {
        if (firstChild is XmlText || firstChild is XmlCDATA) {
          return createNullableProperty<T>(
              converter(firstChild.text), isImmutable);
        }
        if (firstChild is XmlElement) {
          if (firstChild.name.qualified == 'expression') {
            var expressionChild = firstChild.firstChild!;
            if (expressionChild.nodeType == XmlNodeType.CDATA ||
                expressionChild.nodeType == XmlNodeType.TEXT) {
              return StringExpressionProperty<T?>(expressionChild.text);
            }
          }
        }
      }
    }
    var attributeValue = getAttribute(element, name);
    if (attributeValue != null) {
      return createNullableProperty<T>(converter(attributeValue), isImmutable);
    }
    return createNullableProperty<T>(defaultValue(), isImmutable);
  }

  @override
  String? getPlainString(String propertyName) {
    return getAttribute(element, propertyName);
  }

  String? getAttribute(XmlElement xmlElement, String name) {
    return xmlElement.attributes
        .firstWhereOrNull((a) => a.name.qualified == name)
        ?.value;
  }

  XmlElement? getElement(XmlElement xmlElement, String name) {
    return xmlElement.children.firstWhereOrNull(
        (c) => c is XmlElement && c.name.qualified == name) as XmlElement?;
  }

  XmlElement? getPropertyAsElement(XmlElement xmlElement, String name) {
    return getElement(xmlElement, xmlElement.name.qualified + '.' + name);
  }

  @override
  Property<List<TFormElement>> getChildrenProperty<TFormElement>(
      {FormElement? parent,
      required String childrenPropertyName,
      ElementParserFunction? parser,
      bool isContentProperty = false,
      bool isImmutable = true}) {
    var childrenXmlElement =
        getPropertyAsElement(element, childrenPropertyName);
    if (childrenXmlElement != null) {
      var children = childrenXmlElement.children
          .whereType<XmlElement>()
          .map((c) => parser!(XmlParserNode(c), parent))
          .cast<TFormElement>()
          .toList();
      var childrenProperty = createProperty(children, isImmutable);
      return childrenProperty;
    }

    if (childrenXmlElement == null && isContentProperty) {
      var children = element.children
          .where((c) =>
              c is XmlElement &&
              !c.name.qualified.startsWith(element.name.qualified + '.'))
          .map((c) => parser!(XmlParserNode(c as XmlElement), parent))
          .cast<TFormElement>()
          .toList();
      return createProperty(children, isImmutable);
    }

    return createProperty(<TFormElement>[], isImmutable);
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
    var propertyElement = getPropertyAsElement(element, propertyName);
    if (propertyElement == null && isContentProperty) {
      propertyElement = element;
    }

    if (propertyElement != null) {
      var childElement = propertyElement.children
          .firstWhereOrNull((c) => c is XmlElement) as XmlElement?;
      if (childElement != null) {
        return createProperty<TFormElement>(
            parser(XmlParserNode(childElement), parent) as TFormElement,
            isImmutable);
      }
    }
    return createProperty(defaultValue(), isImmutable);
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
    var propertyElement = getPropertyAsElement(element, propertyName);
    if (propertyElement == null && isContentProperty) {
      propertyElement = element;
    }

    if (propertyElement != null) {
      var childElement = propertyElement.children
          .firstWhereOrNull((c) => c is XmlElement) as XmlElement?;
      if (childElement != null) {
        return createNullableProperty<TFormElement>(
            parser(XmlParserNode(childElement), parent) as TFormElement,
            isImmutable);
      }
    }
    return createNullableProperty(defaultValue(), isImmutable);
  }
}
