import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

const String SELECTED_VALUE_PROPERTY = "value";

abstract class FormElement implements ExpressionProviderElement {
  static const String DEFAULT_PROPERTY_NAME = "value";
  static const String PARENT_PROPERTY_NAME = "parent";
  static const String IS_VISIBLE_PROPERTY_NAME = "isVisible";

  String id;
  ElementValue<FormElement> get parent => properties[PARENT_PROPERTY_NAME];
  ElementValue<bool> get isVisible => properties[IS_VISIBLE_PROPERTY_NAME];
  set isVisible(ElementValue<bool> value) =>
      properties[IS_VISIBLE_PROPERTY_NAME] = value;
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

  Stream<String> get propertyChanged {
    if (_propertyChanged == null) {
      _propertyChanged = _getPropertyChanged();
    }
    return _propertyChanged;
  }

  Stream<String> _propertyChanged;

  Stream<String> _getPropertyChanged() {
    var keyStreams = List<Stream<String>>();
    properties.forEach((k, v) {
      keyStreams.add(v.valueChanged.map((_) => k));
    });
    return Observable.merge(keyStreams);
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

  @override
  ExpressionProviderElement clone(
      ExpressionProvider<ExpressionProviderElement> parent) {
    var result = getInstance();
    result.id = id;
    result.registerElementValue(PARENT_PROPERTY_NAME, parent as ElementValue);
    result._fillFromDictionary(this, result, parent);

    return result;
  }

  void _fillFromDictionary(FormElement oldFormElement, FormElement instance,
      ExpressionProvider<ExpressionProviderElement> parent) {
    var formElementProperties = Map.from(oldFormElement.getProperties())
      ..removeWhere((k, v) => k == PARENT_PROPERTY_NAME);
    formElementProperties.forEach((k, v) =>
        instance.properties[k] = cloneProperty(k, v, parent, instance));
  }

  @protected
  ElementValue cloneProperty(
      String key,
      ElementValue oldProperty,
      ExpressionProvider<ExpressionProviderElement> parent,
      ExpressionProviderElement instance) {
    if (oldProperty is ElementValue<List<FormElement>>) {
      return cloneChildren(oldProperty, instance);
    }
    if (oldProperty is ElementValue<ExpressionProviderElement>) {
      return PrimitiveImmutableElementValue(
          oldProperty.value.clone(getPrimitiveImmutableElementValue(instance)));
    } else {
      return oldProperty.clone();
    }
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

  ElementValue cloneChildren(
      ElementValue<List> children, ExpressionProviderElement parent) {
    var childrenElements = children.value.toList();
    for (var i = 0; i < childrenElements.length; i++) {
      childrenElements[i] =
          childrenElements[i].clone(getPrimitiveImmutableElementValue(parent));
    }
    if (children is PrimitiveImmutableElementValue) {
      return (children as PrimitiveImmutableElementValue)
          .cloneWithValue(childrenElements);
    }

    return PrimitiveImmutableElementValue(childrenElements);
  }

  ElementValue<FormElement> getPrimitiveImmutableElementValue(
      FormElement element) {
    if (element == null) {
      return null;
    }
    return PrimitiveImmutableElementValue(element);
  }
}
