import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';

List<FormElementParser<FormElement>> getDefaultParserList() {
  return [
    CheckBoxParser<CheckBox>(),
    DropdownButtonParser<DropdownButton>(),
    DropdownOptionParser<DropdownOption>(),
    FormParser<Form>(),
    FormGroupParser<FormGroup>(),
    LabelParser<Label>(),
    RadioButtonGroupParser<RadioButtonGroup>(),
    RadioButtonParser<RadioButton>(),
    ValidationParser<Validation>(),
    RequiredValidationParser(),
    // ignore: deprecated_member_use_from_same_package
    TextParser<Text>(),
    TextFieldParser<TextField>(),
    SingleSelectChipGroupParser<SingleSelectChipGroup>(),
    SingleSelectChipChoiceParser<SingleSelectChipChoice>(),
    MultiSelectChipChoiceParser<MultiSelectChipChoice>(),
    MultiSelectChipGroupParser<MultiSelectChipGroup>(),
    DateParser<Date>(),
    DateRangeParser<DateRange>(),
    SliderParser<Slider>()
  ];
}
