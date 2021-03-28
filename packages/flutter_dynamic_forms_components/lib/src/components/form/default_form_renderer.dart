import 'package:expression_language/expression_language.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart'
    as model;

class DefaultFormRenderer extends FormElementRenderer<model.Form> {
  @override
  Widget render(
      model.Form element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return StreamBuilder<List<ExpressionProviderElement>>(
      initialData: element.children,
      stream: element.childrenChanged,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
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
