import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/src/components/multi_select_chip_choice/multi_select_chip_choice.dart';
import 'package:flutter_dynamic_forms_components/src/components/multi_select_chip_group/multi_select_chip_group.dart';

class MultiSelectChipGroupParser
    extends FormElementParser<MultiSelectChipGroup> {
  @override
  String get name => "multiSelectChipGroup";

  @override
  MultiSelectChipGroup parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var multiSelectChipGropup = MultiSelectChipGroup();
    multiSelectChipGropup.fillMultiSelectChipGroup(
      id: parserNode.getPlainStringValue("id"),
      isVisible: parserNode.getIsVisible(),
      parent: parserNode.getParentValue(parent),
      value: parserNode.getStringValue("value", isImmutable: false),
      choices: parserNode.getChildren<MultiSelectChipChoice>(
          parent: multiSelectChipGropup,
          childrenPropertyName: "choices",
          parser: parser,
          isContentProperty: true),
    );
    return multiSelectChipGropup;
  }
}
