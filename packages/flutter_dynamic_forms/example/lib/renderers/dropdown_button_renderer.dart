import 'package:dynamic_forms/dynamic_forms.dart' as model;
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class DropdownButtonRenderer extends FormElementRenderer<model.DropdownButton> {
  @override
  Widget render(
      model.DropdownButton element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return Center(
      child: DropdownButton<String>(
        value: element.value.value,
        onChanged: (String newValue) => dispatcher(ChangeValueEvent(
            newValue, element.id, model.SELECTED_VALUE_PROPERTY)),
        items: element.options.value
            .map<DropdownMenuItem<String>>((model.DropdownOption option) {
          return DropdownMenuItem<String>(
            value: option.value.value,
            child: Text(option.label.value),
          );
        }).toList(),
      ),
    );
  }
}
