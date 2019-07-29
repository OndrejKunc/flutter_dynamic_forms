export './check_box/reactive_check_box_renderer.dart';
export './dropdown_button/reactive_dropdown_button_renderer.dart';
export './form_group/reactive_form_group_renderer.dart';
export './form/reactive_form_renderer.dart';
export './label/reactive_label_renderer.dart';
export './radio_button_group/reactive_radio_button_group_renderer.dart';
export './radio_button/reactive_radio_button_widget.dart';
export './text/reactive_text_renderer.dart';

import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

List<FormElementRenderer> getReactiveRenderers() {
  return [
    ReactiveFormRenderer(),
    ReactiveFormGroupRenderer(),
    ReactiveCheckBoxRenderer(),
    ReactiveLabelRenderer(),
    ReactiveTextRenderer(),
    ReactiveRadioButtonGroupRenderer(),
    ReactiveRadioButtonRenderer(),
    ReactiveDropdownButtonRenderer()
  ];
}
