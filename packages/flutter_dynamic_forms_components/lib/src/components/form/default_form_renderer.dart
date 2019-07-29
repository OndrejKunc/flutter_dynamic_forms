import 'package:dynamic_forms/dynamic_forms.dart' as model;
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class DefaultFormRenderer extends FormElementRenderer<model.Form> {
  @override
  Widget render(
      model.Form element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    List<Widget> childrenWidgets = [];
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
