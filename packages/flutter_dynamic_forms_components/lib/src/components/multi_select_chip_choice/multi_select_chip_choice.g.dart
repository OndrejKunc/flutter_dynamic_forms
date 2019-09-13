// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

class MultiSelectChipChoice extends MultiSelectChoice {
  void fillMultiSelectChipChoice({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<bool> isSelected,
    @required ElementValue<String> label,
  }) {
    fillMultiSelectChoice(
      id: id,
      parent: parent,
      isVisible: isVisible,
      isSelected: isSelected,
      label: label,
    );
  }

  @override
  FormElement getInstance() {
    return MultiSelectChipChoice();
  }
}
