import 'package:dynamic_forms/dynamic_forms.dart';

class SingleItemContainer extends FormElement {
  static const String childPropertyName = 'child';

  Property<FormElement?> get childProperty =>
      properties[childPropertyName] as Property<FormElement?>;
  set childProperty(Property<FormElement?> value) =>
      registerProperty(childPropertyName, value);
  FormElement? get child => childProperty.value;
  Stream<FormElement?> get childChanged => childProperty.valueChanged;

  @override
  FormElement getInstance() {
    return SingleItemContainer();
  }
}
