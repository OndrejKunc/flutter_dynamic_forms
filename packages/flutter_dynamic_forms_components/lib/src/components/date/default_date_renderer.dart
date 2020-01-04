import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:intl/intl.dart';

import 'date.g.dart' as model;

class DefaultDateRenderer extends FormElementRenderer<model.Date> {
  @override
  Widget render(
      model.Date element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    final format = DateFormat(element.format);
    final time = element.value != null ? element.value : DateTime.now();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: format.format(time),
          ),
          onTap: () async {
            FocusScope.of(context).requestFocus(FocusNode());

            final DateTime picked = await showDatePicker(
              context: context,
              firstDate: element.firstDate,
              lastDate: element.lastDate,
              initialDate: element.initialDate,
            );

            if (picked != null) {
              dispatcher(
                ChangeValueEvent(
                  value: picked,
                  elementId: element.id,
                  propertyName: model.Date.valuePropertyName,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
