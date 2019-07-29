import 'package:dynamic_forms/dynamic_forms.dart' as model;
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

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
              propertyName: model.SELECTED_VALUE_PROPERTY,
            )),
        items: element.options
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
