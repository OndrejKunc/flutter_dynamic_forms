import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart'
    as model;

class DefaultCheckBoxRenderer extends FormElementRenderer<model.CheckBox> {
  @override
  Widget render(
      model.CheckBox element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Checkbox(
            onChanged: (value) => dispatcher(
                ChangeValueEvent(value: value, elementId: element.id)),
            value: element.value,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(element.label),
          )
        ],
      ),
    );
  }
}
