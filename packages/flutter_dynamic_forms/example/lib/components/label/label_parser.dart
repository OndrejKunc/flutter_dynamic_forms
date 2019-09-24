import 'package:dynamic_forms/dynamic_forms.dart';

import 'label.dart';

class LabelParser extends ElementParser<Label> {
  @override
  String get name => "label";

  @override
  Label parse(
      ParserNode parserNode, FormElement parent, ElementParserFunction parser) {
    var label = Label();
    label.fillLabel(
      id: parserNode.getPlainStringValue("id"),
      isVisible: parserNode.getIsVisible(),
      parent: parserNode.getParentValue(parent),
      value: parserNode.getStringValue("value"),
    );
    return label;
  }
}
