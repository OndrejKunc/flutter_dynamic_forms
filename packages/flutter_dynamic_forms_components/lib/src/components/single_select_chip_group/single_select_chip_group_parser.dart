import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/src/components/single_select_chip_choice/single_select_chip_choice.dart';
import 'single_select_chip_group.dart';

class SingleSelectChipGroupParser
    extends FormElementParser<SingleSelectChipGroup> {
  @override
  String get name => "singleSelectChipGroup";

  @override
  SingleSelectChipGroup parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var singleSelectChipGroup = SingleSelectChipGroup();
    singleSelectChipGroup.fillSingleSelectChipGroup(
      id: parserNode.getPlainStringValue("id"),
      isVisible: parserNode.getIsVisible(),
      parent: parserNode.getParentValue(parent),
      value: parserNode.getStringValue("value", isImmutable: false),
      choices: parserNode.getChildren<SingleSelectChipChoice>(
          parent: singleSelectChipGroup,
          childrenPropertyName: "choices",
          parser: parser,
          isContentProperty: true),
    );
    return singleSelectChipGroup;
  }
}
