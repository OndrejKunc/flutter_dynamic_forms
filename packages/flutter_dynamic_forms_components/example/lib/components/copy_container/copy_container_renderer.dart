import 'package:expression_language/expression_language.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter/material.dart';

import 'copy_container.dart';

class CopyContainerRenderer extends FormElementRenderer<CopyContainer> {
  @override
  Widget render(
      CopyContainer element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return StreamBuilder<List<ExpressionProviderElement>>(
      initialData: element.children,
      stream: element.childrenChanged,
      builder: (context, snapshot) {
        return Column(children: [
          ...snapshot.data
              .whereType<FormElement>()
              .where((f) => f.isVisible)
              .map(
                (child) => renderer(child, context),
              )
              .toList(),
          IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {
                // TODO
              })
        ]);
      },
    );
  }
}
