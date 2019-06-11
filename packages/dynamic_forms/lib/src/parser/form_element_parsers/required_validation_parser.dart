import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/parser/form_element_parser.dart';
import 'package:dynamic_forms/src/parser/parsing_helpers.dart';
import 'package:xml/xml.dart';

class RequiredValidationParser extends FormElementParser<RequiredValidation> {
  @override
  String get name => "requiredValidation";

  @override
  RequiredValidation parse(XmlElement element, FormElement parent,
      FormElementParserFunction parser) {
    RequiredValidation validation = RequiredValidation();
    validation.fillRequiredValidation(
      id: getAttribute(element, "id"),
      isVisible: getIsVisible(element),
      parent: getParentValue(parent),
      message: getStringValue(element, "message"),
    );
    return validation;
  }
}
