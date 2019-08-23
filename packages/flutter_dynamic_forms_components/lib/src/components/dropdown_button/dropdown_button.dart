import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:flutter_dynamic_forms_components/src/components/dropdown_option/dropdown_option.dart';
import 'package:meta/meta.dart';

class DropdownButton extends SingleSelectGroup {
  void fillDropdownButton({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<List<DropdownOption>> options,
    @required ElementValue<String> value,
  }) {
    fillSingleSelectGroup(
      id: id,
      parent: parent,
      isVisible: isVisible,
      choices: options,
      value: value,
    );
  }

  @override
  FormElement getInstance() {
    return DropdownButton();
  }
}
