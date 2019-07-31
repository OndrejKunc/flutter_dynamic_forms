import 'package:dynamic_forms/dynamic_forms.dart';

import 'package:xml/xml.dart';

import 'dropdown_button.dart';
import '../dropdown_option/dropdown_option.dart';

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
