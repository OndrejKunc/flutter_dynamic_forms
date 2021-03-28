import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart'
    as model;

class CheckBoxRenderer extends FormElementRenderer<model.CheckBox> {
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
          StreamBuilder<bool>(
            initialData: element.value,
            stream: element.valueChanged,
            builder: (context, snapshot) {
              return Checkbox(
                onChanged: (value) => dispatcher(
                  ChangeValueEvent(
                    value: value,
                    elementId: element.id!,
                  ),
                ),
                value: snapshot.data,
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: StreamBuilder<String>(
              initialData: element.label,
              stream: element.labelChanged,
              builder: (context, snapshot) {
                return Text(snapshot.data!);
              },
            ),
          )
        ],
      ),
    );
  }
}
