// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class DropdownButtonParser<TDropdownButton extends DropdownButton>
    extends SingleSelectGroupParser<TDropdownButton, DropdownOption> {
  @override
  String get name => 'dropdownButton';

  @override
  FormElement getInstance() => DropdownButton();

  @override
  void fillProperties(
    TDropdownButton dropdownButton, 
    ParserNode parserNode, 
    Element? parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(dropdownButton, parserNode, parent, parser);
  }
}
