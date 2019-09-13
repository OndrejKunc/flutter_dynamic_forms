// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class LabelParser extends FormElementParser<Label> {
  @override
  String get name => "label";

  @override
  Label parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var label = Label();
    label.fillLabel(
      id: parserNode.getPlainStringValue("id"),
      parent: parserNode.getParentValue(parent),
      isVisible: parserNode.getIsVisible(),
      value: parserNode.getStringValue(
        "value",
        isImmutable: true,
      ),
    );
    return label;
  }
}
