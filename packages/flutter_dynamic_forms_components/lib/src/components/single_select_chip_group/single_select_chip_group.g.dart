// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

class SingleSelectChipGroup extends SingleSelectGroup<SingleSelectChipChoice> {
  void fillSingleSelectChipGroup({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<List<SingleSelectChipChoice>> choices,
    @required ElementValue<String> value,
  }) {
    fillSingleSelectGroup(
      id: id,
      parent: parent,
      isVisible: isVisible,
      choices: choices,
      value: value,
    );
  }

  @override
  FormElement getInstance() {
    return SingleSelectChipGroup();
  }
}
