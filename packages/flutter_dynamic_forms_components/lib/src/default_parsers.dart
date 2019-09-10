import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';

List<FormElementParser> getDefaultParserList() {
  return [
    AddressParser(),
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
  ];
}
