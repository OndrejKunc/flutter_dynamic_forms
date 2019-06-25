import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/parser/form_element_parser.dart';
import 'package:dynamic_forms/src/parser/parsing_helpers.dart';
import 'package:xml/xml.dart';

class FormGroupParser extends FormElementParser<FormGroup> {
  @override
  String get name => "formGroup";

  @override
  FormGroup parse(XmlElement element, FormElement parent,
      FormElementParserFunction parser) {
    var formGroup = FormGroup();
    formGroup.fillFormGroup(
      id: getAttribute(element, "id"),
      isVisible: getIsVisible(element),
      parent: getParentValue(parent),
      name: getStringValue(element, "name"),
      children: getChildren<FormElement>(element, formGroup, parser),
    );
    return formGroup;
  }
}
