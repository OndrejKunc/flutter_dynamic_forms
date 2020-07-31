import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class XmlFormProvider extends FormProvider {
  const XmlFormProvider({
    Key key,
    @required Widget child,
    @required String xmlString,
    @required List<ElementParser> parsers,
  }) : super(
          key: key,
          child: child,
          formString: xmlString,
          parsers: parsers,
        );

  @override
  FormParserService getFormParserService(List<ElementParser> parsers) {
    return XmlFormParserService(parsers);
  }
}
