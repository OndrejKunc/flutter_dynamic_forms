import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/src/components/single_select_chip_choice/single_select_chip_choice.dart';

class SingleSelectChipChoiceParser
    extends FormElementParser<SingleSelectChipChoice> {
  @override
  String get name => "singleSelectChipChoice";

  @override
  SingleSelectChipChoice parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var dropdownOption = SingleSelectChipChoice();
    dropdownOption.fillSingleSelectChoice(
      id: parserNode.getPlainStringValue("id"),
      isVisible: parserNode.getIsVisible(),
      parent: parserNode.getParentValue(parent),
      value: parserNode.getStringValue("value"),
      label: parserNode.getStringValue("label"),
    );
    return dropdownOption;
  }
}
