import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_elements/form_element.dart';
import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';

class CheckBox extends FormElement {
  ElementValue<bool> value;
  ElementValue<String> label;

  void fillCheckBox({
    @required String id,
    @required ElementValue<ExpressionProviderElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<bool> value,
    @required ElementValue<String> label,
  }) {
    fillFormElement(id: id, parent: parent, isVisible: isVisible);
    this.value = registerElementValue("value", value);
    this.label = registerElementValue("label", label);
  }
}
