import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';

List<FormElementRenderer<FormElement>> getReactiveRenderers() {
  return [
    ReactiveFormRenderer(),
    ReactiveFormGroupRenderer(),
    ReactiveCheckBoxRenderer(),
    ReactiveLabelRenderer(),
    // ignore: deprecated_member_use_from_same_package
    ReactiveTextRenderer(),
    ReactiveTextFieldRenderer(),
    ReactiveRadioButtonGroupRenderer(),
    ReactiveRadioButtonRenderer(),
    ReactiveDropdownButtonRenderer(),
    ReactiveSingleSelectChipGroupRenderer(),
    ReactiveSingleSelectChipChoiceRenderer(),
    ReactiveMultiSelectChipChoiceRenderer(),
    ReactiveMultiSelectChipGroupRenderer(),
    ReactiveDateRenderer(),
    ReactiveDateRangeRenderer(),
    ReactiveSliderRenderer(),
  ];
}
