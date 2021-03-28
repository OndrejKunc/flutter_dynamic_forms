import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart'
    as model;
import 'package:dynamic_forms/dynamic_forms.dart';

class FormGroupRenderer extends FormElementRenderer<model.FormGroup> {
  @override
  Widget render(
      model.FormGroup element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return LazyStreamBuilder(
      streamFactory: () => MergeStream([
        element.childrenChanged,
        ...element.children
            .whereType<FormElement>()
            .map((child) => child.isVisibleChanged),
        element.nameChanged,
      ]),
      builder: (context, _) {
        List<Widget> childrenWidgets = [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              element.name,
              style: TextStyle(color: Colors.grey),
            ),
          )
        ];
        childrenWidgets.addAll(
          element.children
              .whereType<FormElement>()
              .where((f) => f.isVisible)
              .map(
                (child) => renderer(child, context),
              ),
        );
        return Column(children: childrenWidgets);
      },
    );
  }
}
