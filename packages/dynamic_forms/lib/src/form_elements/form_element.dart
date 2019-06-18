import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

const String SELECTED_VALUE_PROPERTY = "value";

abstract class FormElement implements ExpressionProviderElement {
  static const String DEFAULT_PROPERTY_NAME = "value";

  String id;
  ElementValue<ExpressionProviderElement> parent;
  Map<String, ElementValue> _properties = {};
  ElementValue<bool> isVisible;

  static Uuid uuid = new Uuid();

  void fillFormElement(
      {@required String id,
      @required ElementValue<ExpressionProviderElement> parent,
      @required ElementValue<bool> isVisible}) {
    this.id = id;
    this.isVisible = registerElementValue("isVisible", isVisible);
    this.parent = registerElementValue("parent", parent);
  }

  ElementValue getElementValue([String propertyName]) {
    if (propertyName == null) {
      propertyName = DEFAULT_PROPERTY_NAME;
    }
    var properties = getProperties();
    if (properties.containsKey(propertyName)) {
      return properties[propertyName];
    }
    throw Exception("Can't get expressions for $propertyName");
  }

  ExpressionProvider getExpressionProvider([String propertyName]) =>
      getElementValue(propertyName);

  ElementValue<T> registerElementValue<T>(
      String name, ElementValue<T> elementValue) {
    if (elementValue == null) {
      return null;
    }
    _properties[name] = elementValue;
    return elementValue;
  }

  Map<String, ElementValue> getProperties() => _properties;

  ElementValue<List<T>> cloneChildren<T extends ExpressionProviderElement>(
      ElementValue<List<T>> children, ExpressionProviderElement parent) {
    var childrenElements = children.value;
    var childrenCopy = List<T>.from(
      childrenElements.map(
        (c) => c.clone(
              getParentValue(parent),
            ),
      ),
    );
    return PrimitiveImmutableElementValue<List<T>>(childrenCopy);
  }
}
