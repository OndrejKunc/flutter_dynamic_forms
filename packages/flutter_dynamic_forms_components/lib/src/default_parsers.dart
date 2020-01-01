import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';

List<ElementParser> getDefaultParserList() {
  return [
    CheckBoxParser(),
    DropdownButtonParser(),
    DropdownOptionParser(),
    FormParser(),
    FormGroupParser(),
    LabelParser(),
    RadioButtonGroupParser(),
    RadioButtonParser(),
    ValidationParser(),
    RequiredValidationParser(),
    TextParser(),
    SingleSelectChipGroupParser(),
    SingleSelectChipChoiceParser(),
    MultiSelectChipChoiceParser(),
    MultiSelectChipGroupParser(),
    DateParser(),
    DateRangeParser(),
    SliderParser()
  ];
}
