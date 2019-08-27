import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/src/components/multi_select_chip_choice/multi_select_chip_choice.dart';

class MultiSelectChipChoiceParser
    extends FormElementParser<MultiSelectChipChoice> {
  @override
  String get name => "multiSelectChipChoice";

  @override
  MultiSelectChipChoice parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var multiSelectChipChoice = MultiSelectChipChoice();
    multiSelectChipChoice.fillMultiSelectChoice(
      id: parserNode.getPlainStringValue("id"),
      isVisible: parserNode.getIsVisible(),
      parent: parserNode.getParentValue(parent),
      isSelected: parserNode.getValue(
          "isSelected", ParserNode.convertToBool, ParserNode.defaultFalse,
          isImmutable: false),
      label: parserNode.getStringValue("label"),
    );
    return multiSelectChipChoice;
  }
}
