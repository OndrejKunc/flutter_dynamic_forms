// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

class DropdownOption extends SingleSelectChoice {
  void fillDropdownOption({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<String> label,
    @required ElementValue<String> value,
  }) {
    fillSingleSelectChoice(
      id: id,
      parent: parent,
      isVisible: isVisible,
      label: label,
      value: value,
    );
  }

  @override
  FormElement getInstance() {
    return DropdownOption();
  }
}
