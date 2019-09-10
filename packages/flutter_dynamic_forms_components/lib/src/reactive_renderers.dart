import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';

List<FormElementRenderer> getReactiveRenderers() {
  return [
    ReactiveFormRenderer(),
    ReactiveFormGroupRenderer(),
    ReactiveCheckBoxRenderer(),
    ReactiveLabelRenderer(),
    ReactiveTextRenderer(),
    ReactiveRadioButtonGroupRenderer(),
    ReactiveRadioButtonRenderer(),
    ReactiveDropdownButtonRenderer(),
    ReactiveSingleSelectChipGroupRenderer(),
    ReactiveSingleSelectChipChoiceRenderer(),
    ReactiveMultiSelectChipChoiceRenderer(),
    ReactiveMultiSelectChipGroupRenderer(),
  ];
}
