import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_elements/form_element.dart';
import 'package:meta/meta.dart';

class Label extends FormElement {
  static const String VALUE_PROPERTY_NAME = "value";
  String get value => properties[VALUE_PROPERTY_NAME].value;
  Stream get valueChanged => properties[VALUE_PROPERTY_NAME].valueChanged;

  void fillLabel(
      {@required String id,
      @required ElementValue<FormElement> parent,
      @required ElementValue<bool> isVisible,
      @required ElementValue<String> value}) {
    super.fillFormElement(id: id, parent: parent, isVisible: isVisible);
    registerElementValue(VALUE_PROPERTY_NAME, value);
  }

  @override
  FormElement getInstance() {
    return Label();
  }
}
