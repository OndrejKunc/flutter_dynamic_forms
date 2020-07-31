import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class JsonFormProvider extends FormProvider {
  const JsonFormProvider({
    Key key,
    @required Widget child,
    @required String jsonString,
    @required List<ElementParser> parsers,
  }) : super(
          key: key,
          child: child,
          formString: jsonString,
          parsers: parsers,
        );

  @override
  FormParserService getFormParserService(List<ElementParser> parsers) {
    return JsonFormParserService(parsers);
  }
}
