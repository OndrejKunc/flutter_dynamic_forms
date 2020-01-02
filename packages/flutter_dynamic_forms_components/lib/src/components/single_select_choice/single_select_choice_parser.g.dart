// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class SingleSelectChoiceParser<TSingleSelectChoice extends SingleSelectChoice>
    extends FormElementParser<TSingleSelectChoice> {
  @override
  String get name => "singleSelectChoice";

  @override
  FormElement getInstance() => SingleSelectChoice();

  @override
  void fillProperties(
    TSingleSelectChoice singleSelectChoice, 
    ParserNode parserNode, 
    Element parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(singleSelectChoice, parserNode, parent, parser);
    singleSelectChoice
      ..labelProperty = parserNode.getStringValue(
        "label",
        isImmutable: true,
      )
      ..valueProperty = parserNode.getStringValue(
        "value",
        isImmutable: true,
      );
  }
}
