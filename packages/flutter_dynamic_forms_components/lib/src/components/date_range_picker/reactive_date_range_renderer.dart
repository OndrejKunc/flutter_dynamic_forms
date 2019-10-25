import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:intl/intl.dart';

import 'date_range.dart' as model;
import 'date_range_popup.dart';

class ReactiveDateRangeRenderer extends FormElementRenderer<model.DateRange> {
  @override
  Widget render(
      model.DateRange element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return StreamBuilder(
      stream: element.dateValueChanged,
      builder: (BuildContext context, _) {
        final format = DateFormat(element.format);
        final time =
            element.dateValue != null ? element.dateValue : element.initialDate;

        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: format.format(time),
              ),
              onTap: () async {
                FocusScope.of(context).requestFocus(FocusNode());

                return await showDialog(
                  context: context,
                  builder: (BuildContext context) => CalendarPopupView(
                    barrierDismissible: true,
                    minimumDate: DateTime.now(),
                    //  maximumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 10),
                    initialEndDate: element.lastDate,
                    initialStartDate: element.firstDate,
                    onApplyClick: (DateTime startDate, DateTime endData) {
                      print(startDate);
                    },
                    onCancelClick: () {},
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
