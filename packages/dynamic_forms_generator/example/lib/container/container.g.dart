// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class Container extends FormElement {
  static const String childrenPropertyName = 'children';

  Property<List<FormElement>> get childrenProperty => properties[childrenPropertyName] as Property<List<FormElement>>;
  set childrenProperty(Property<List<FormElement>> value) =>
      registerProperty(childrenPropertyName, value);
  List<FormElement> get children =>
      childrenProperty.value;
  Stream<List<FormElement>> get childrenChanged => childrenProperty.valueChanged;

  @override
  FormElement getInstance() {
    return Container();
  }
}
