// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';
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
