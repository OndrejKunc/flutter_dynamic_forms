import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_elements/dropdown_option.dart';
import 'package:dynamic_forms/src/form_elements/form_element.dart';
import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';

class DropdownButton extends FormElement {
  ElementValue<List<DropdownOption>> options;
  ElementValue<String> value;

  void fillDropdownButton({
    @required String id,
    @required ElementValue<ExpressionProviderElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<List<DropdownOption>> options,
    @required ElementValue<String> value,
  }) {
    fillFormElement(id: id, parent: parent, isVisible: isVisible);
    this.options = registerElementValue("options", options);
    this.value = registerElementValue("value", value);
  }

  @override
  ExpressionProviderElement clone(
      ExpressionProvider<ExpressionProviderElement> parent) {
    var result = DropdownButton();
    result.fillDropdownButton(
      id: this.id,
      parent: parent,
      isVisible: this.isVisible.clone(),
      options: cloneChildren(this.options, result),
      value: this.value.clone(),
    );
    return result;
  }
}
