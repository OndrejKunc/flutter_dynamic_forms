import 'package:dynamic_forms/dynamic_forms.dart' as model;
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:rxdart/rxdart.dart';

class ReactiveRadioButtonGroupRenderer
    extends FormElementRenderer<model.RadioButtonGroup> {
  @override
  Widget render(
      model.RadioButtonGroup element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return StreamBuilder<List<model.RadioButton>>(
      initialData: element.children.value,
      stream: element.children.valueChanged,
      builder: (context, snapshot) {
        return StreamBuilder(
          stream: Observable.merge(
            snapshot.data.map((child) => child.isVisible.valueChanged),
          ),
          builder: (context, _) {
            List<Widget> childrenWidgets = [
              Padding(
                padding: const EdgeInsets.all(8.0),
              )
            ];
            childrenWidgets.addAll(
              snapshot.data.where((f) => f.isVisible.value).map(
                    (child) => renderer(child, context),
                  ),
            );
            return Column(
              children: childrenWidgets,
            );
          },
        );
      },
    );
  }
}
