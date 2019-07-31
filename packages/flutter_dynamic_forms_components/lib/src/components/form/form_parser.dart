import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/src/components/form/form.dart';
import 'package:xml/xml.dart';

class FormParser extends FormElementParser<Form> {
  @override
  String get name => "form";

  @override
  Form parse(XmlElement element, FormElement parent,
      FormElementParserFunction parser) {
    var form = Form();
    form.fillForm(
      id: getAttribute(element, "id"),
      isVisible: getIsVisible(element),
      name: getStringValue(element, "name"),
      children: getChildren<FormElement>(element, form, parser),
    );
    return form;
  }
}
