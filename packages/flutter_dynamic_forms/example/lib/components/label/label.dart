import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

class Label extends FormElement {
  static const String valuePropertyName = "value";
  String get value => properties[valuePropertyName].value;
  Stream<String> get valueChanged => properties[valuePropertyName].valueChanged;

  void fillLabel(
      {@required String id,
      @required ElementValue<FormElement> parent,
      @required ElementValue<bool> isVisible,
      @required ElementValue<String> value}) {
    super.fillFormElement(id: id, parent: parent, isVisible: isVisible);
    registerElementValue(valuePropertyName, value);
  }

  @override
  FormElement getInstance() {
    return Label();
  }
}
