import 'package:dynamic_forms/dynamic_forms.dart';

import 'label.dart';

class LabelParser extends ElementParser<Label> {
  @override
  String get name => "label";

  @override
  Label parse(
      ParserNode parserNode, Element parent, ElementParserFunction parser) {
    var label = Label();
    label
      ..id = parserNode.getPlainStringValue("id")
      ..isVisibleProperty = parserNode.getIsVisible()
      ..parentProperty = parserNode.getParentValue(parent)
      ..valueProperty = parserNode.getStringValue("value");
    return label;
  }
}
