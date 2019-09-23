// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class ExampleValueElementParser extends ElementParser<ExampleValueElement> {
  @override
  String get name => "exampleValueElement";

  @override
  ExampleValueElement parse(ParserNode parserNode, FormElement parent,
      ElementParserFunction parser) =>
      ExampleValueElement( 
      firstProperty: parserNode.getStringValue(
        "firstProperty",
        isImmutable: true,
      ).value,
      secondProperty: parserNode.getValue<int>(
        "secondProperty",
        (s) => int.parse(s),
        () => 0,
        isImmutable: true,
      ).value,
    );
}
