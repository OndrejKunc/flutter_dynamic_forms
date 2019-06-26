import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_elements/form_element.dart';
import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';

class RadioButton extends FormElement {
  ElementValue<String> label;
  ElementValue<String> value;

  void fillRadioButton({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<String> label,
    @required ElementValue<String> value,
  }) {
    fillFormElement(id: id, parent: parent, isVisible: isVisible);
    this.label = registerElementValue("label", label);
    this.value = registerElementValue("value", value);
  }

  @override
  ExpressionProviderElement clone(
      ExpressionProvider<ExpressionProviderElement> parent) {
    var result = RadioButton();
    result.fillRadioButton(
      id: this.id,
      parent: parent,
      isVisible: this.isVisible.clone(),
      label: this.label.clone(),
      value: this.value.clone(),
    );
    return result;
  }
}
