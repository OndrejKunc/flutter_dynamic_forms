import 'package:dynamic_forms/src/form_elements/form.dart';
import 'package:dynamic_forms/src/form_elements/form_element.dart';
import 'package:dynamic_forms/src/parser/form_element_parser.dart';
import 'package:dynamic_forms/src/parser/parsing_helpers.dart';
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
      children: getChildren(element, form, parser),
    );
    return form;
  }
}
