import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/parser/form_element_parser.dart';
import 'package:dynamic_forms/src/parser/parsing_helpers.dart';
import 'package:xml/xml.dart';

class ValidationParser extends FormElementParser<Validation> {
  @override
  String get name => "validation";

  @override
  Validation parse(XmlElement element, FormElement parent,
      FormElementParserFunction parser) {
        Validation validation = Validation();
    validation.fillValidation(
      id: getAttribute(element, "id"),
      isVisible: getIsVisible(element),
      parent: getParentValue(parent),
      message: getStringValue(element, "message"),
      isValid: getValue(element, "isValid", convertToBool, defaultTrue),
    );
    return validation;
  }
}
