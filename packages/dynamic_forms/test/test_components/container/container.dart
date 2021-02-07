import 'package:dynamic_forms/dynamic_forms.dart';

class Container extends FormElement {
  static const String childrenPropertyName = 'children';
  static const String children2PropertyName = 'children2';

  Property<List<FormElement>> get childrenProperty =>
      properties[childrenPropertyName] as Property<List<FormElement>>;
  set childrenProperty(Property<List<FormElement>> value) =>
      registerProperty(childrenPropertyName, value);
  List<FormElement> get children => childrenProperty.value;
  Stream<List<FormElement>> get childrenChanged =>
      childrenProperty.valueChanged;

  Property<List<FormElement>> get children2Property =>
      properties[children2PropertyName] as Property<List<FormElement>>;
  set children2Property(Property<List<FormElement>> value) =>
      registerProperty(children2PropertyName, value);
  List<FormElement> get children2 => children2Property.value;
  Stream<List<FormElement>> get children2Changed =>
      children2Property.valueChanged;

  @override
  FormElement getInstance() {
    return Container();
  }
}
