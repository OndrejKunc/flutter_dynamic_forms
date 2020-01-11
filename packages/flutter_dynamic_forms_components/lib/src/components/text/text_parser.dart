// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

@Deprecated('Use TextFieldParser instead. '
    'This component was deprecated after 0.10.1')
class TextParser<TText extends Text> extends FormElementParser<TText> {
  @override
  String get name => 'text';

  @override
  FormElement getInstance() => Text();

  @override
  void fillProperties(
    TText text,
    ParserNode parserNode,
    Element parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(text, parserNode, parent, parser);
    text
      ..labelProperty = parserNode.getStringValue(
        'label',
        isImmutable: true,
      )
      ..textInputTypeProperty = parserNode.getStringValue(
        'textInputType',
        isImmutable: true,
      )
      ..validationsProperty = parserNode.getChildren<Validation>(
          parent: text,
          parser: parser,
          childrenPropertyName: 'validations',
          isContentProperty: false)
      ..valueProperty = parserNode.getStringValue(
        'value',
        isImmutable: false,
      );
  }
}
