import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:xml/xml.dart';

typedef FormElementParserFunction = FormElement Function(
    XmlElement element, FormElement parent);

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

ElementValue<T> getValue<T>(
    XmlElement xmlElement, String name, T converter(String s), T defaultValue(),
    {bool isImmutable = true}) {
  var elementValue = getPropertyAsElement(xmlElement, name);
  if (elementValue != null) {
    var firstChild = elementValue.firstChild;
    if (firstChild != null) {
      if (firstChild is XmlText) {
        return _createPrimitiveElementValue<T>(
            converter(firstChild.text), isImmutable);
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
  var attributeValue = getAttribute(xmlElement, name);
  if (attributeValue != null) {
    return _createPrimitiveElementValue<T>(
        converter(attributeValue), isImmutable);
  }
  return _createPrimitiveElementValue<T>(defaultValue(), isImmutable);
}

ElementValue<T> _createPrimitiveElementValue<T>(T value, bool isImmutable) {
  return isImmutable
      ? PrimitiveImmutableElementValue<T>(value)
      : PrimitiveMutableElementValue<T>(value);
}

ElementValue<List<TFormElement>> getChildren<TFormElement extends FormElement>(XmlElement element,
        FormElement parent, FormElementParserFunction parser, {bool isImmutable = true}) =>
    _createPrimitiveElementValue(element.children
        .where((c) => c is XmlElement && !c.name.qualified.startsWith(element.name.qualified + "."))
        .map((c) => parser(c, parent))
        .cast<TFormElement>()
        .toList(), isImmutable);

ElementValue<FormElement> getParentValue(FormElement parent) {
  if (parent == null){
    return null;
  }
  return PrimitiveImmutableElementValue(parent);
}

ElementValue<List<TFormElement>> getChildrenFromElement<TFormElement>(
    XmlElement element,
    FormElement parent,
    String childrenElementName,
    FormElementParserFunction parser,
    {bool isImmutable = true}) {
  var childrenXmlElement = getPropertyAsElement(element, childrenElementName);
  var children = childrenXmlElement == null
      ? List<TFormElement>()
      : childrenXmlElement.children
          .where((c) => c is XmlElement)
          .map((c) => parser(c, parent))
          .cast<TFormElement>()
          .toList();
  var validations = _createPrimitiveElementValue(children, isImmutable);
  return validations;
}

ElementValue<bool> getIsVisible(XmlElement element) =>
    getValue(element, "isVisible", convertToBool, defaultTrue);

ElementValue<String> getStringValue(XmlElement element, String name, {bool isImmutable = true}) =>
    getValue(element, name, convertToString, emptyString, isImmutable: isImmutable);

String emptyString() => "";
String convertToString(String x) => x;
bool convertToBool(String x) => x == "true";
bool defaultFalse() => false;
bool defaultTrue() => true;
