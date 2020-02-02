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
    return StreamBuilder<int>(
      initialData: 0,
      stream: element.changedStream,
      builder: (context, itemCount) {
        return StreamBuilder<List<ExpressionProviderElement>>(
          initialData: element.children,
          stream: element.childrenChanged,
          builder: (context, snapshot) {
            return Column(
              children: [
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
                    var children = snapshot.data;
                    if (children.isEmpty) {
                      return;
                    }

                    // Create copy of the first children
                    var clonedRoot = children[0].clone(null);

                    var clonedElements =
                        getFormElementIterator<FormElement>(clonedRoot)
                            .toList();

                    // Change id of each element in the new tree
                    for (var i = 0; i < clonedElements.length; i++) {
                      var clonedElement = clonedElements[i];
                      if (clonedElement.id != null) {
                        clonedElement.id = "${clonedElement.id}_$i";
                      }
                    }

                    (clonedRoot as FormElement).parentProperty =
                        (children[0] as FormElement).parentProperty;

                    // Add back to the children list
                    children.add(clonedRoot);

                    // Notify view about the change. Easiest way how to trigger the change
                    // is to add another mutable property to the model. Unfortunately children.add
                    // doesn't trigger the change and there is no mechanism for this type of change yet.
                    element.changedSubject.add(children.length);
                  },
                )
              ],
            );
          },
        );
      },
    );
  }
}
