import 'dart:async';

import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

abstract class FormElement implements ExpressionProviderElement {
  static const String defaultPropertyName = "value";
  static const String parentPropertyName = "parent";
  static const String isVisiblePropertyName = "isVisible";

  String id;
  FormElement get parent => properties[parentPropertyName].value;
  bool get isVisible => properties[isVisiblePropertyName].value;
  Stream<bool> get isVisibleChanged =>
      properties[isVisiblePropertyName].valueChanged;

  @protected
  Map<String, ElementValue> properties = {};

  static Uuid uuid = new Uuid();

  void fillFormElement(
      {@required String id,
      @required ElementValue<FormElement> parent,
      @required ElementValue<bool> isVisible}) {
    this.id = id;
    registerElementValue(isVisiblePropertyName, isVisible);
    registerElementValue(parentPropertyName, parent);
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
    var mergedStream = Observable.merge(keyStreams);
    var connectableObservable = mergedStream.publishReplay(maxSize: 1);
    connectableObservable.connect();
    return connectableObservable;
  }

  ElementValue getElementValue([String propertyName]) {
    if (propertyName == null) {
      propertyName = defaultPropertyName;
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
    result.registerElementValue(parentPropertyName, parent as ElementValue);
    result._fillFromDictionary(this, result, parent);

    return result;
  }

  void _fillFromDictionary(FormElement oldFormElement, FormElement instance,
      ExpressionProvider<ExpressionProviderElement> parent) {
    var formElementProperties = Map.from(oldFormElement.getProperties())
      ..removeWhere((k, v) => k == parentPropertyName);
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
      return ImmutableElementValue(
          oldProperty.value.clone(getImmutableElementValue(instance)));
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
          childrenElements[i].clone(getImmutableElementValue(parent));
    }
    if (children is ImmutableElementValue) {
      return (children as ImmutableElementValue)
          .cloneWithValue(childrenElements);
    }

    return ImmutableElementValue(childrenElements);
  }

  ElementValue<FormElement> getImmutableElementValue(FormElement element) {
    if (element == null) {
      return null;
    }
    return ImmutableElementValue(element);
  }
}
