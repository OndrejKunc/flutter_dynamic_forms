export './check_box/default_check_box_renderer.dart';
export './dropdown_button/default_dropdown_button_renderer.dart';
export './form_group/default_form_group_renderer.dart';
export './form/default_form_renderer.dart';
export './label/default_label_renderer.dart';
export './radio_button_group/default_radio_button_group_renderer.dart';
export './radio_button/default_radio_button_widget.dart';
export './text/default_text_renderer.dart';

import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

List<FormElementRenderer> getDefaultRenderers() {
  return [
    DefaultFormRenderer(),
    DefaultFormGroupRenderer(),
    DefaultCheckBoxRenderer(),
    DefaultLabelRenderer(),
    DefaultTextRenderer(),
    DefaultRadioButtonGroupRenderer(),
    DefaultRadioButtonRenderer(),
    DefaultDropdownButtonRenderer()
  ];
}
