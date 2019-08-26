import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/src/components/single_select_chip_choice/single_select_chip_choice.dart';
import 'package:flutter_dynamic_forms_components/src/components/single_select_chip_group/single_select_chip_group.dart';
import 'package:flutter_dynamic_forms_components/src/components/single_select_group/single_select_group.dart';
import 'package:rxdart/rxdart.dart';

class ReactiveSingleSelectChipChoiceRenderer
    extends FormElementRenderer<SingleSelectChipChoice> {
  @override
  Widget render(
      SingleSelectChipChoice element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    var parent = element.parent as SingleSelectChipGroup;
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
      child: LazyStreamBuilder<String>(
        initialData: parent.value,
        streamFactory: () =>
            Observable.merge([parent.valueChanged, element.propertyChanged]),
        builder: (context, _) {
          return ChoiceChip(
            label: Text(element.label),
            selected: parent.value == element.value,
            onSelected: (_) => dispatcher(
                  ChangeValueEvent(
                    value: element.value,
                    elementId: parent.id,
                    propertyName: SingleSelectGroup.valuePropertyName,
                  ),
                ),
          );
        },
      ),
    );
  }
}
