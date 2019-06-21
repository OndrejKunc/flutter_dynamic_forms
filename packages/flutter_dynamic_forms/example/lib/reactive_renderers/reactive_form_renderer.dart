import 'package:dynamic_forms/dynamic_forms.dart' as model;
import 'package:expression_language/expression_language.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class ReactiveFormRenderer extends FormElementRenderer<model.Form> {
  @override
  Widget render(
      model.Form element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return StreamBuilder<List<ExpressionProviderElement>>(
      initialData: element.children.value,
      stream: element.children.valueChanged,
      builder: (context, snapshot) {
        List<Widget> childrenWidgets = [];
        for (var child in snapshot.data) {
          if ((child as model.FormElement).isVisible.value) {
            childrenWidgets.add(renderer(child, context));
          }
        }
        return Column(
          children: childrenWidgets,
        );
      },
    );
  }
}
