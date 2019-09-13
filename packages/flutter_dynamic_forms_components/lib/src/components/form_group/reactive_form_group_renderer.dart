import 'package:expression_language/expression_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart' as model;
import 'package:dynamic_forms/dynamic_forms.dart';

class ReactiveFormGroupRenderer extends FormElementRenderer<model.FormGroup> {
  @override
  Widget render(
      model.FormGroup element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return StreamBuilder<List<ExpressionProviderElement>>(
      initialData: element.children,
      stream: element.childrenChanged,
      builder: (context, snapshot) {
        return StreamBuilder(
          stream: Observable.merge(
            snapshot.data
                .whereType<FormElement>()
                .map((child) => child.isVisibleChanged),
          ),
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
              snapshot.data
                  .whereType<FormElement>()
                  .where((f) => f.isVisible)
                  .map(
                    (child) => renderer(child, context),
                  ),
            );
            return Column(children: childrenWidgets);
          },
        );
      },
    );
  }
}
