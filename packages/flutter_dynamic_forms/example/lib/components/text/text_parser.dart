import 'package:dynamic_forms/dynamic_forms.dart';

import 'text.dart';

class TextParser extends FormElementParser<Text> {
  @override
  String get name => "text";

  @override
  Text parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var text = Text();
    text.fillText(
      id: parserNode.getPlainStringValue("id"),
      isVisible: parserNode.getIsVisible(),
      parent: parserNode.getParentValue(parent),
      value: parserNode.getStringValue("value", isImmutable: false),
      label: parserNode.getStringValue("label"),
      textInputType: parserNode.getStringValue("textInputType"),
      validations: parserNode.getChildren<Validation>(
          parent: text,
          childrenPropertyName: Text.validationsPropertyName,
          parser: parser),
    );
    return text;
  }
}
