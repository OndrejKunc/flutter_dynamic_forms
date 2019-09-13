import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart'
    as model;

class DefaultSingleSelectChipChoiceRenderer
    extends FormElementRenderer<model.SingleSelectChipChoice> {
  @override
  Widget render(
      model.SingleSelectChipChoice element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    var parent = element.parent as model.SingleSelectChipGroup;

    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
      child: ChoiceChip(
        label: Text(element.label),
        selected: parent.value == element.value,
        onSelected: (_) => dispatcher(
          ChangeValueEvent(
            value: element.value,
            elementId: parent.id,
            propertyName: model.SingleSelectGroup.valuePropertyName,
          ),
        ),
      ),
    );
  }
}
