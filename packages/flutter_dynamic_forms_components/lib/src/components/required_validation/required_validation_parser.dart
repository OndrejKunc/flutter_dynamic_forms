import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:xml/xml.dart';

import '../required_validation/required_validation.dart';

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
