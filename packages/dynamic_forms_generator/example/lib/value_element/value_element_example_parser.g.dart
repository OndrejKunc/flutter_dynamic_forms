// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class ExampleValueElementParser extends ElementParser<ExampleValueElement> {
  @override
  String get name => 'exampleValueElement';

  @override
  ExampleValueElement parse(ParserNode parserNode, FormElement? parent,
      ElementParserFunction parser) =>
      ExampleValueElement( 
      firstProperty: parserNode.getStringProperty(
        'firstProperty',
        defaultValue: ParserNode.defaultString,
        isImmutable: true,
      ).value,
      secondProperty: parserNode.getIntProperty(
        'secondProperty',      
        defaultValue: ParserNode.defaultInt,
        isImmutable: true,
      ).value,
    );
}
