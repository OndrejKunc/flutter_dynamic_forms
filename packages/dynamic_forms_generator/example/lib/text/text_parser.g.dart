// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class TextParser<TText extends Text>
    extends FormElementParser<TText> {
  @override
  String get name => 'text';

  @override
  FormElement getInstance() => Text();

  @override
  void fillProperties(
    TText text, 
    ParserNode parserNode, 
    Element? parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(text, parserNode, parent, parser);
    text
      ..labelProperty = parserNode.getStringProperty(
        'label',
        defaultValue: ParserNode.defaultString,
        isImmutable: true,
      )
      ..textInputTypeProperty = parserNode.getStringProperty(
        'textInputType',
        defaultValue: ParserNode.defaultString,
        isImmutable: true,
      )
      ..validationsProperty = parserNode.getChildrenProperty<Validation>(
          parent: text,
          parser: parser,
          childrenPropertyName: 'validations',
          isContentProperty: false)
      ..valueProperty = parserNode.getStringProperty(
        'value',
        defaultValue: ParserNode.defaultString,
        isImmutable: false,
      );
  }
}
