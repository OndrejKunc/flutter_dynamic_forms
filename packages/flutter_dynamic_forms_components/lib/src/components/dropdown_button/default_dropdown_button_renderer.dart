import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

import 'dropdown_button.dart' as model;
import '../dropdown_option/dropdown_option.dart';

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
              propertyName: model.DropdownButton.VALUE_PROPERTY_NAME,
            )),
        items: element.options
            .map<DropdownMenuItem<String>>((DropdownOption option) {
          return DropdownMenuItem<String>(
            value: option.value,
            child: Text(option.label),
          );
        }).toList(),
      ),
    );
  }
}
