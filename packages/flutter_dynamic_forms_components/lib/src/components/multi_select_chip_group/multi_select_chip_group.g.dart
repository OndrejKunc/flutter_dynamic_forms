// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

class MultiSelectChipGroup extends MultiSelectGroup<MultiSelectChipChoice> {
  void fillMultiSelectChipGroup({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<List<MultiSelectChipChoice>> choices,
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
