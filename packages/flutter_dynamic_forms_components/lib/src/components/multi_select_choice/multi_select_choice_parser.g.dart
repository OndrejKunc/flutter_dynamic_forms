// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class MultiSelectChoiceParser<TMultiSelectChoice extends MultiSelectChoice>
    extends FormElementParser<TMultiSelectChoice> {
  @override
  String get name => "multiSelectChoice";

  @override
  FormElement getInstance() => MultiSelectChoice();

  @override
  void fillProperties(
    TMultiSelectChoice multiSelectChoice, 
    ParserNode parserNode, 
    Element parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(multiSelectChoice, parserNode, parent, parser);
    multiSelectChoice
      ..isSelectedProperty = parserNode.getValue(
        "isSelected",
        ParserNode.convertToBool,
        ParserNode.defaultFalse,
        isImmutable: false,
      )
      ..labelProperty = parserNode.getStringValue(
        "label",
        isImmutable: true,
      );
  }
}
