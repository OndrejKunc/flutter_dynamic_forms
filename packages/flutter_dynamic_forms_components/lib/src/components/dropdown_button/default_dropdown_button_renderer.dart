import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart'
    as model;

class DefaultDropdownButtonRenderer
    extends FormElementRenderer<model.DropdownButton> {
  @override
  Widget render(
      model.DropdownButton element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return Center(
      child: DropdownButton<String>(
        value: element.value,
        onChanged: (String newValue) => dispatcher(ChangeValueEvent(
          value: newValue,
          elementId: element.id,
          propertyName: model.SingleSelectGroup.valuePropertyName,
        )),
        items: element.choices
            .whereType<model.DropdownOption>()
            .map<DropdownMenuItem<String>>((model.DropdownOption option) {
          return DropdownMenuItem<String>(
            value: option.value,
            child: Text(option.label),
          );
        }).toList(),
      ),
    );
  }
}
