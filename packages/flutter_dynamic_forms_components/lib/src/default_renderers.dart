import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';

List<FormElementRenderer> getDefaultRenderers() {
  return [
    DefaultFormRenderer(),
    DefaultFormGroupRenderer(),
    DefaultCheckBoxRenderer(),
    DefaultLabelRenderer(),
    DefaultTextRenderer(),
    DefaultRadioButtonGroupRenderer(),
    DefaultRadioButtonRenderer(),
    DefaultDropdownButtonRenderer(),
    DefaultSingleSelectChipGroupRenderer(),
    DefaultSingleSelectChipChoiceRenderer(),
    DefaultMultiSelectChipChoiceRenderer(),
    DefaultMultiSelectChipGroupRenderer(),
  ];
}
