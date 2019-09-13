// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class DropdownButtonParser extends FormElementParser<DropdownButton> {
  @override
  String get name => "dropdownButton";

  @override
  DropdownButton parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var dropdownButton = DropdownButton();
    dropdownButton.fillDropdownButton(
      id: parserNode.getPlainStringValue("id"),
      parent: parserNode.getParentValue(parent),
      isVisible: parserNode.getIsVisible(),
      choices: parserNode.getChildren<DropdownOption>(
        parent: dropdownButton,
        parser: parser,
        childrenPropertyName: "choices",
        isContentProperty: true),
      value: parserNode.getStringValue(
        "value",
        isImmutable: false,
      ),
    );
    return dropdownButton;
  }
}
