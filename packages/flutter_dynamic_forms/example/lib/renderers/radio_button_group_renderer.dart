import 'package:dynamic_forms/dynamic_forms.dart' as model;
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class RadioButtonGroupRenderer
    extends FormElementRenderer<model.RadioButtonGroup> {
  @override
  Widget render(
      model.RadioButtonGroup element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    List<Widget> childrenWidgets = [
      Padding(
        padding: const EdgeInsets.all(8.0),
      )
    ];
    for (var child in element.radioButtons) {
      if (child.isVisible.value) {
        childrenWidgets.add(renderer(child, context));
      }
    }

    return Column(
      children: childrenWidgets,
    );
  }
}
