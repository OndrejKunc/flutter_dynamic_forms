// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class PaddingParser<TPadding extends Padding>
    extends FormElementParser<TPadding> {
  @override
  String get name => 'padding';

  @override
  FormElement getInstance() => Padding();

  @override
  void fillProperties(
    TPadding padding, 
    ParserNode parserNode, 
    Element? parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(padding, parserNode, parent, parser);
    padding
      ..childProperty = parserNode.getChildProperty<FormElement?>(
        propertyName: 'child',
        parent: padding,
        parser: parser,
        defaultValue: () => null,
        isContentProperty: false,
        isImmutable: true,
      );
  }
}
