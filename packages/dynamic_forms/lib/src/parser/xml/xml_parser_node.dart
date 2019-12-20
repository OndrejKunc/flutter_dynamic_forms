import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/element_values/element_value.dart';
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
  ElementValue<T> getValue<T>(
      String name, T converter(String s), T defaultValue(),
      {bool isImmutable = true}) {
    var elementValue = getPropertyAsElement(element, name);
    if (elementValue != null) {
      var firstChild = elementValue.firstChild;
      if (firstChild != null) {
        if (firstChild is XmlText || firstChild is XmlCDATA) {
          return createElementValue<T>(converter(firstChild.text), isImmutable);
        }
        if (firstChild is XmlElement) {
          if (firstChild.name.qualified == "expression") {
            var expressionChild = firstChild.firstChild;
            if (expressionChild.nodeType == XmlNodeType.CDATA ||
                expressionChild.nodeType == XmlNodeType.TEXT) {
              return StringExpressionElementValue<T>(expressionChild.text);
            }
          }
        }
      }
    }
    var attributeValue = getAttribute(element, name);
    if (attributeValue != null) {
      return createElementValue<T>(converter(attributeValue), isImmutable);
    }
    return createElementValue<T>(defaultValue(), isImmutable);
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
    return getElement(xmlElement, xmlElement.name.qualified + "." + name);
  }

  @override
  ElementValue<List<TFormElement>> getChildren<TFormElement>(
      {FormElement parent,
      String childrenPropertyName,
      ElementParserFunction parser,
      bool isContentProperty = false,
      bool isImmutable = true}) {
    var childrenXmlElement =
        getPropertyAsElement(element, childrenPropertyName);
    if (childrenXmlElement != null) {
      var children = childrenXmlElement.children
          .where((c) => c is XmlElement)
          .map((c) => parser(XmlParserNode(c), parent))
          .cast<TFormElement>()
          .toList();
      var childrenElementValue = createElementValue(children, isImmutable);
      return childrenElementValue;
    }

    if (childrenXmlElement == null && isContentProperty) {
      var children = element.children
          .where((c) =>
              c is XmlElement &&
              !c.name.qualified.startsWith(element.name.qualified + "."))
          .map((c) => parser(XmlParserNode(c), parent))
          .cast<TFormElement>()
          .toList();
      if (children != null) {
        return createElementValue(children, isImmutable);
      }
    }

    return createElementValue(List<TFormElement>(), isImmutable);
  }

  @override
  ElementValue<TFormElement> getChild<TFormElement>({
    @required String propertyName,
    @required ElementParserFunction parser,
    @required FormElement parent,
    @required TFormElement defaultValue(),
    bool isContentProperty = false,
    bool isImmutable = true,
  }) {
    XmlElement propertyElement = getPropertyAsElement(element, propertyName);
    if (propertyElement == null && isContentProperty) {
      propertyElement = element;
    }

    if (propertyElement != null) {
      XmlElement childElement = propertyElement.children
          .firstWhere((c) => c is XmlElement, orElse: () => null);
      if (childElement != null) {
        return createElementValue<TFormElement>(
            parser(XmlParserNode(childElement), parent) as TFormElement,
            isImmutable);
      }
    }
    return createElementValue(defaultValue(), isImmutable);
  }
}
