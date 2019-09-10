import 'package:dynamic_forms/dynamic_forms.dart';

import 'dropdown_button.dart';
import '../dropdown_option/dropdown_option.dart';

class DropdownButtonParser extends FormElementParser<DropdownButton> {
  @override
  String get name => "dropdownButton";

  @override
  DropdownButton parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var dropdownButton = DropdownButton();
    dropdownButton.fillDropdownButton(
      id: parserNode.getPlainStringValue("id"),
      isVisible: parserNode.getIsVisible(),
      parent: parserNode.getParentValue(parent),
      value: parserNode.getStringValue("value", isImmutable: false),
      choices: parserNode.getChildren<DropdownOption>(
          parent: dropdownButton,
          childrenPropertyName: "choices",
          parser: parser,
          isContentProperty: true),
    );
    return dropdownButton;
  }
}
