import 'package:dynamic_forms/dynamic_forms.dart' as model;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class ReactiveRadioButtonRenderer
    extends FormElementRenderer<model.RadioButton> {
  @override
  Widget render(
      model.RadioButton element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    var parent = element.parent.value as model.RadioButtonGroup;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<String>(
        initialData: parent.value,
        stream: parent.valueChanged,
        builder: (context, parentValue) {
          return StreamBuilder<String>(
            initialData: element.value,
            stream: element.valueChanged,
            builder: (context, buttonValue) {
              return RadioListTile(
                title: StreamBuilder<String>(
                    initialData: element.label,
                    stream: element.labelChanged,
                    builder: (context, labelValue) {
                      return Text(labelValue.data);
                    }),
                value: buttonValue.data,
                groupValue: parentValue.data,
                onChanged: (String value) => dispatcher(
                      ChangeValueEvent(
                          value, parent.id, model.SELECTED_VALUE_PROPERTY),
                    ),
              );
            },
          );
        },
      ),
    );
  }
}
