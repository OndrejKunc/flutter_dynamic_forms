import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:flutter_dynamic_forms_components/src/components/multi_select_chip_choice/multi_select_chip_choice.dart';

class MultiSelectChipGroup extends MultiSelectGroup<MultiSelectChipChoice> {
  void fillMultiSelectChipGroup({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<List<MultiSelectChipChoice>> choices,
    @required ElementValue<String> value,
  }) {
    fillMultiSelectGroup(
      id: id,
      parent: parent,
      isVisible: isVisible,
      choices: choices,
    );
  }

  @override
  FormElement getInstance() {
    return MultiSelectChipGroup();
  }
}
