import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';

List<FormElementRenderer<FormElement>> getDefaultRenderers() {
  return [
    DefaultFormRenderer(),
    DefaultFormGroupRenderer(),
    DefaultCheckBoxRenderer(),
    DefaultLabelRenderer(),
    DefaultTextFieldRenderer(),
    DefaultRadioButtonGroupRenderer(),
    DefaultRadioButtonRenderer(),
    DefaultDropdownButtonRenderer(),
    DefaultSingleSelectChipGroupRenderer(),
    DefaultSingleSelectChipChoiceRenderer(),
    DefaultMultiSelectChipChoiceRenderer(),
    DefaultMultiSelectChipGroupRenderer(),
    DefaultDateRenderer(),
  ];
}
