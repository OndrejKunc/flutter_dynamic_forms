import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

import 'radio_button.dart' as model;
import '../radio_button_group/radio_button_group.dart';

class DefaultRadioButtonRenderer
    extends FormElementRenderer<model.RadioButton> {
  @override
  Widget render(
      model.RadioButton element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    var parent = element.parent.value as RadioButtonGroup;

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: RadioListTile(
          title: Text(element.label),
          value: element.value,
          groupValue: parent.value,
          onChanged: (String value) => dispatcher(
            ChangeValueEvent(
                value: value,
                elementId: parent.id,
                propertyName: RadioButtonGroup.VALUE_PROPERTY_NAME),
          ),
        ));
  }
}
