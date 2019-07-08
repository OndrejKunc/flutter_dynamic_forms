export 'default_check_box_renderer.dart';
export 'default_dropdown_button_renderer.dart';
export 'default_form_group_renderer.dart';
export 'default_form_renderer.dart';
export 'default_label_renderer.dart';
export 'default_radio_button_group_renderer.dart';
export 'default_radio_button_widget.dart';
export 'default_text_renderer.dart';

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
