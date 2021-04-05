import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';

List<FormElementRenderer<FormElement>> getRenderers() {
  return [
    DefaultFormRenderer(),
    FormGroupRenderer(),
    CheckBoxRenderer(),
    LabelRenderer(),
    TextFieldRenderer(),
    RadioButtonGroupRenderer(),
    ReactiveRadioButtonRenderer(),
    DropdownButtonRenderer(),
    SingleSelectChipGroupRenderer(),
    ReactiveSingleSelectChipChoiceRenderer(),
    MultiSelectChipChoiceRenderer(),
    MultiSelectChipGroupRenderer(),
    ReactiveDateRenderer(),
    DateRangeRenderer(),
    SliderRenderer(),
  ];
}
