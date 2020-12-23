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
