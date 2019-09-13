// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class TextParser extends FormElementParser<Text> {
  @override
  String get name => "text";

  @override
  Text parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var text = Text();
    text.fillText(
      id: parserNode.getPlainStringValue("id"),
      parent: parserNode.getParentValue(parent),
      isVisible: parserNode.getIsVisible(),
      label: parserNode.getStringValue(
        "label",
        isImmutable: true,
      ),
      textInputType: parserNode.getStringValue(
        "textInputType",
        isImmutable: true,
      ),
      validations: parserNode.getChildren<Validation>(
          parent: text,
          parser: parser,
          childrenPropertyName: "validations",
          isContentProperty: false),
      value: parserNode.getStringValue(
        "value",
        isImmutable: false,
      ),
    );
    return text;
  }
}
