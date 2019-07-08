export 'reactive_check_box_renderer.dart';
export 'reactive_dropdown_button_renderer.dart';
export 'reactive_form_group_renderer.dart';
export 'reactive_form_renderer.dart';
export 'reactive_label_renderer.dart';
export 'reactive_radio_button_group_renderer.dart';
export 'reactive_radio_button_widget.dart';
export 'reactive_text_renderer.dart';

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
