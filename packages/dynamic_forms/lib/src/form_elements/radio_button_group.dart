import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_elements/form_element.dart';
import 'package:dynamic_forms/src/form_elements/radio_button.dart';
import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';

class RadioButtonGroup extends FormElement {
  ElementValue<String> value;
  ElementValue<List<RadioButton>> radioButtons;

  void fillRadioButtonGroup({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<List<RadioButton>> radioButtons,
    @required ElementValue<String> value,
  }) {
    fillFormElement(id: id, parent: parent, isVisible: isVisible);
    this.radioButtons = registerElementValue("radioButtons", radioButtons);
    this.value = registerElementValue("value", value);
  }

  @override
  ExpressionProviderElement clone(
      ExpressionProvider<ExpressionProviderElement> parent) {
    var result = RadioButtonGroup();
    result.fillRadioButtonGroup(
      id: this.id,
      parent: parent,
      isVisible: this.isVisible.clone(),
      radioButtons: cloneChildren(this.radioButtons, result),
      value: this.value.clone(),
    );
    return result;
  }
}
