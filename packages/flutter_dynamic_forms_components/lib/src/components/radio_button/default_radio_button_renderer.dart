import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart' as model;

class DefaultRadioButtonRenderer
    extends FormElementRenderer<model.RadioButton> {
  @override
  Widget render(
      model.RadioButton element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    var parent = element.parent as model.RadioButtonGroup;

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
                  propertyName: model.SingleSelectGroup.valuePropertyName),
            ),
      ),
    );
  }
}
