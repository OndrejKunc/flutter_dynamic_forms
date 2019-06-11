import 'package:dynamic_forms/dynamic_forms.dart';

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
  ];
}
