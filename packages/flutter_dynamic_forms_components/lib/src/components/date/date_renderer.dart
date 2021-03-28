import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:intl/intl.dart';

import 'date.g.dart' as model;

class ReactiveDateRenderer extends FormElementRenderer<model.Date> {
  @override
  Widget render(
      model.Date element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return StreamBuilder(
      stream: element.valueChanged,
      builder: (BuildContext context, _) {
        final format = DateFormat(element.format);
        var value = element.value;
        final DateTime time = value != null ? value : element.initialDate;

        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: format.format(time),
              ),
              onTap: () async {
                FocusScope.of(context).requestFocus(FocusNode());
                var firstDate = element.firstDate;
                var lastDate = element.lastDate;

                final DateTime? picked = await showDatePicker(
                  context: context,
                  firstDate:
                      firstDate != null ? firstDate : DateTime(1979, 01, 01),
                  lastDate:
                      lastDate != null ? lastDate : DateTime(2050, 01, 01),
                  initialDate: element.initialDate,
                );

                if (picked != null) {
                  dispatcher(
                    ChangeValueEvent(
                      value: picked,
                      elementId: element.id!,
                      // propertyName: model.Date.valuePropertyName,
                    ),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
