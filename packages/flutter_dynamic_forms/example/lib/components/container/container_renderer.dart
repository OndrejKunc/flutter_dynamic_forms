import 'package:expression_language/expression_language.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:rxdart/rxdart.dart';

import 'container.dart' as model;

class ContainerRenderer extends FormElementRenderer<model.Container> {
  @override
  Widget render(
      model.Container element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return StreamBuilder<List<ExpressionProviderElement>>(
      initialData: element.children,
      stream: element.childrenChanged,
      builder: (context, snapshot) {
        return StreamBuilder(
          stream: MergeStream(
            snapshot.data!
                .whereType<FormElement>()
                .map((child) => child.isVisibleChanged),
          ),
          builder: (context, _) {
            List<Widget> childrenWidgets = snapshot.data!
                .whereType<FormElement>()
                .where((f) => f.isVisible)
                .map(
                  (child) => renderer(child, context),
                )
                .toList();
            return Column(
              children: childrenWidgets,
            );
          },
        );
      },
    );
  }
}
