import 'package:dynamic_forms/dynamic_forms.dart' as model;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class DefaultFormGroupRenderer extends FormElementRenderer<model.FormGroup> {
  @override
  Widget render(
      model.FormGroup element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    List<Widget> childrenWidgets = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          element.name,
          style: TextStyle(color: Colors.grey),
        ),
      )
    ];
    for (var child in element.children) {
      if (child.isVisible.value) {
        childrenWidgets.add(renderer(child, context));
      }
    }

    return Column(
      children: childrenWidgets,
    );
  }
}
