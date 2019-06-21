import 'package:dynamic_forms/dynamic_forms.dart' as model;
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:rxdart/rxdart.dart';

class ReactiveDropdownButtonRenderer
    extends FormElementRenderer<model.DropdownButton> {
  @override
  Widget render(
      model.DropdownButton element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return StreamBuilder<String>(
      initialData: element.value.value,
      stream: element.value.valueChanged,
      builder: (context, dropDownValue) {
        return Center(
          child: StreamBuilder<List<model.DropdownOption>>(
            initialData: element.options.value,
            stream: element.options.valueChanged,
            builder: (context, options) {
              return StreamBuilder(
                stream: Observable.merge(
                  options.data.map((child) => child.isVisible.valueChanged),
                ),
                builder: (context, _) {
                  return DropdownButton<String>(
                    value: dropDownValue.data,
                    onChanged: (String newValue) => dispatcher(ChangeValueEvent(
                        newValue, element.id, model.SELECTED_VALUE_PROPERTY)),
                    items: options.data
                        .where((d) => d.isVisible.value)
                        .map<DropdownMenuItem<String>>(
                            (model.DropdownOption option) {
                      return DropdownMenuItem<String>(
                        value: option.value.value,
                        child: Text(option.label.value),
                      );
                    }).toList(),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
