import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/parser/parser_node.dart';
import 'package:meta/meta.dart';
import 'package:xml/xml.dart';

class XmlParserNode extends ParserNode {
  final XmlElement element;
  XmlParserNode(this.element);

  @override
  String getName() {
    return element.name.qualified;
  }

  @override
  Property<T> getValue<T>(
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
            var expressionChild = firstChild.firstChild;
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
  String getPlainStringValue(String propertyName) {
    return getAttribute(element, propertyName);
  }

  String getAttribute(XmlElement xmlElement, String name) {
    return xmlElement.attributes
        .firstWhere((a) => a.name.qualified == name, orElse: () => null)
        ?.value;
  }

  XmlElement getElement(XmlElement xmlElement, String name) {
    return xmlElement.children.firstWhere(
        (c) => c is XmlElement && c.name.qualified == name,
        orElse: () => null);
  }

  XmlElement getPropertyAsElement(XmlElement xmlElement, String name) {
    return getElement(xmlElement, xmlElement.name.qualified + '.' + name);
  }

  @override
  Property<List<TFormElement>> getChildren<TFormElement>(
      {FormElement parent,
      String childrenPropertyName,
      ElementParserFunction parser,
      bool isContentProperty = false,
      bool isImmutable = true}) {
    var childrenXmlElement =
        getPropertyAsElement(element, childrenPropertyName);
    if (childrenXmlElement != null) {
      var children = childrenXmlElement.children
          .whereType<XmlElement>()
          .map((c) => parser(XmlParserNode(c), parent))
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
          .map((c) => parser(XmlParserNode(c), parent))
          .cast<TFormElement>()
          .toList();
      if (children != null) {
        return createProperty(children, isImmutable);
      }
    }

    return createProperty(<TFormElement>[], isImmutable);
  }

  @override
  Property<TFormElement> getChild<TFormElement>({
    @required String propertyName,
    @required ElementParserFunction parser,
    @required FormElement parent,
    @required TFormElement Function() defaultValue,
    bool isContentProperty = false,
    bool isImmutable = true,
  }) {
    var propertyElement = getPropertyAsElement(element, propertyName);
    if (propertyElement == null && isContentProperty) {
      propertyElement = element;
    }

    if (propertyElement != null) {
      XmlElement childElement = propertyElement.children
          .firstWhere((c) => c is XmlElement, orElse: () => null);
      if (childElement != null) {
        return createProperty<TFormElement>(
            parser(XmlParserNode(childElement), parent) as TFormElement,
            isImmutable);
      }
    }
    return createProperty(defaultValue(), isImmutable);
  }
}
