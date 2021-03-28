import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:intl/intl.dart';

import 'date_range.g.dart' as model;
import 'date_range_popup.dart';

class DateRangeRenderer extends FormElementRenderer<model.DateRange> {
  @override
  Widget render(
      model.DateRange element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return StreamBuilder(
      stream: element.propertyChanged,
      builder: (BuildContext context, _) {
        final format = DateFormat(element.format);

        String _getHintText() {
          if (element.firstValue != null && element.secondValue != null) {
            var first = format.format(element.firstValue!);
            var second = format.format(element.secondValue!);
            return "$first - $second";
          }
          return 'Select Date';
        }

        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: _getHintText(),
              ),
              onTap: () async {
                FocusScope.of(context).requestFocus(FocusNode());

                return await showDialog(
                  context: context,
                  builder: (BuildContext context) => CalendarPopupView(
                    barrierDismissible: true,
                    minimumDate: element.minDate,
                    maximumDate: element.maxDate,
                    initialStartDate: element.firstValue,
                    initialEndDate: element.secondValue,
                    onApplyClick: (DateTime? startDate, DateTime? endDate) {
                      if (startDate != null && endDate != null) {
                        dispatcher(
                          ChangeValueEvent(
                            value: startDate,
                            elementId: element.id!,
                            propertyName:
                                model.DateRange.firstValuePropertyName,
                          ),
                        );
                        dispatcher(
                          ChangeValueEvent(
                            value: endDate,
                            elementId: element.id!,
                            propertyName:
                                model.DateRange.secondValuePropertyName,
                          ),
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
