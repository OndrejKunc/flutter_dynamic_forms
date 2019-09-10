import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/src/components/multi_select_chip_choice/multi_select_chip_choice.dart';
import 'package:flutter_dynamic_forms_components/src/components/multi_select_choice/multi_select_choice.dart';

class ReactiveMultiSelectChipChoiceRenderer
    extends FormElementRenderer<MultiSelectChipChoice> {
  @override
  Widget render(
      MultiSelectChipChoice element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
      child: StreamBuilder<String>(
        stream: element.propertyChanged,
        builder: (context, _) {
          return ChoiceChip(
            label: Text(element.label),
            selected: element.isSelected,
            onSelected: (selected) => dispatcher(
                  ChangeValueEvent(
                    value: selected,
                    elementId: element.id,
                    propertyName: MultiSelectChoice.isSelectedPropertyName,
                  ),
                ),
          );
        },
      ),
    );
  }
}
