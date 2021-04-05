// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class DropdownOptionParser<TDropdownOption extends DropdownOption>
    extends SingleSelectChoiceParser<TDropdownOption> {
  @override
  String get name => 'dropdownOption';

  @override
  FormElement getInstance() => DropdownOption();

  @override
  void fillProperties(
    TDropdownOption dropdownOption, 
    ParserNode parserNode, 
    Element? parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(dropdownOption, parserNode, parent, parser);
  }
}
