import 'package:dynamic_forms/dynamic_forms.dart' as model;
import 'package:expression_language/expression_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:rxdart/rxdart.dart';

class ReactiveFormGroupRenderer extends FormElementRenderer<model.FormGroup> {
  @override
  Widget render(
      model.FormGroup element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return StreamBuilder<List<ExpressionProviderElement>>(
      initialData: element.children.value,
      stream: element.children.valueChanged,
      builder: (context, snapshot) {
        return StreamBuilder(
            stream: Observable.merge(
              snapshot.data
                  .whereType<model.FormElement>()
                  .map((child) => child.isVisible.valueChanged),
            ),
            builder: (context, _) {
              List<Widget> childrenWidgets = [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    element.name.value,
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ];
              childrenWidgets.addAll(
                snapshot.data
                    .whereType<model.FormElement>()
                    .where((f) => f.isVisible.value)
                    .map(
                      (child) => renderer(child, context),
                    ),
              );
              return Column(children: childrenWidgets);
            });
      },
    );
  }
}
