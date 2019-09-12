// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';
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
