import 'package:dynamic_forms/dynamic_forms.dart';
import '../dropdown_option/dropdown_option.dart';

class DropdownOptionParser extends FormElementParser<DropdownOption> {
  @override
  String get name => "dropdownOption";

  @override
  DropdownOption parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var dropdownOption = DropdownOption();
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
