import 'package:dynamic_forms/dynamic_forms.dart';

import 'text_field.dart';

class TextFieldParser<TTextField extends TextField>
    extends FormElementParser<TTextField> {
  @override
  String get name => 'textField';

  @override
  FormElement getInstance() => TextField();

  @override
  void fillProperties(
    TTextField text,
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
