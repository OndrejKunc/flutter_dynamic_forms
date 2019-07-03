import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_elements/property_names.dart';
import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

const String SELECTED_VALUE_PROPERTY = "value";

abstract class FormElement implements ExpressionProviderElement {
  static const String DEFAULT_PROPERTY_NAME = "value";
  static const String PARENT_PROPERTY_NAME = "parent";
  static const String IS_VISIBLE_PROPERTY_NAME = "isVisible";

  String id;
  ElementValue<FormElement> get parent => properties[PARENT_PROPERTY_NAME];
  ElementValue<bool> get isVisible => properties[IS_VISIBLE_PROPERTY_NAME];
  @protected
  Map<String, ElementValue> properties = {};

  static Uuid uuid = new Uuid();

  void fillFormElement(
      {@required String id,
      @required ElementValue<FormElement> parent,
      @required ElementValue<bool> isVisible}) {
    this.id = id;
    registerElementValue(IS_VISIBLE_PROPERTY_NAME, isVisible);
    registerElementValue(PARENT_PROPERTY_NAME, parent);
  }

  FormElement getInstance();

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

  @override
  ExpressionProviderElement clone(
      ExpressionProvider<ExpressionProviderElement> parent) {
    var result = getInstance();
    result._fillFromDictionary(this, result, parent);
    result.fillFormElement(
        id: this.id, parent: parent, isVisible: this.isVisible);
    return result;
  }

  void _fillFromDictionary(
      FormElement formElement,
      ExpressionProviderElement instance,
      ExpressionProvider<ExpressionProviderElement> parent) {
    var formElementProperties = formElement.getProperties();
    formElementProperties.forEach((k, v) {
      if (v is List) properties[k] = cloneChildren(v, instance);
      if ((this is RequiredValidation) && (k == IS_VALID_PROPERTY_NAME))
        properties[k] = (this as RequiredValidation).getIsValid(parent);
      else
        properties[k] = v.clone();
    });
  }

  ExpressionProvider getExpressionProvider([String propertyName]) =>
      getElementValue(propertyName);

  ElementValue<T> registerElementValue<T>(
      String name, ElementValue<T> elementValue) {
    if (elementValue == null) {
      return null;
    }
    properties[name] = elementValue;
    return elementValue;
  }

  Map<String, ElementValue> getProperties() => properties;

  ElementValue<List<T>> cloneChildren<T extends FormElement>(
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
