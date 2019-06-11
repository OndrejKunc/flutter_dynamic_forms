import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/parser/form_element_parser.dart';
import 'package:dynamic_forms/src/parser/parsing_helpers.dart';
import 'package:xml/xml.dart';

class DropdownOptionParser extends FormElementParser<DropdownOption> {
  @override
  String get name => "dropdownOption";

  @override
  DropdownOption parse(XmlElement element, FormElement parent,
      FormElementParserFunction parser) {
    var dropdownOption = DropdownOption();
    dropdownOption.fillDropdownOption(
      id: getAttribute(element, "id"),
      isVisible: getIsVisible(element),
      parent: getParentValue(parent),
      value: getStringValue(element, "value"),
      label: getStringValue(element, "label"),
    );
    return dropdownOption;
  }
}
