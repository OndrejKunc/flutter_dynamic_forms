import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/parser/form_element_parser.dart';
import 'package:dynamic_forms/src/parser/parsing_helpers.dart';
import 'package:xml/xml.dart';

class DropdownButtonParser extends FormElementParser<DropdownButton> {
  @override
  String get name => "dropdownButton";

  @override
  DropdownButton parse(XmlElement element, FormElement parent,
      FormElementParserFunction parser) {
    var dropdownButton = DropdownButton();
    dropdownButton.fillDropdownButton(
      id: getAttribute(element, "id"),
      isVisible: getIsVisible(element),
      parent: getParentValue(parent),
      value: getStringValue(element, "value", isImmutable: false),
      options: getChildren<DropdownOption>(element, dropdownButton, parser),
    );
    return dropdownButton;
  }
}
