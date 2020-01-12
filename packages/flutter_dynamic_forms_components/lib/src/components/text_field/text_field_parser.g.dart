// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class TextFieldParser<TTextField extends TextField>
    extends FormElementParser<TTextField> {
  @override
  String get name => 'textField';

  @override
  FormElement getInstance() => TextField();

  @override
  void fillProperties(
    TTextField textField, 
    ParserNode parserNode, 
    Element parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(textField, parserNode, parent, parser);
    textField
      ..labelProperty = parserNode.getStringValue(
        'label',
        isImmutable: true,
      )
      ..textInputTypeProperty = parserNode.getStringValue(
        'textInputType',
        isImmutable: true,
      )
      ..validationsProperty = parserNode.getChildren<Validation>(
          parent: textField,
          parser: parser,
          childrenPropertyName: 'validations',
          isContentProperty: false)
      ..valueProperty = parserNode.getStringValue(
        'value',
        isImmutable: false,
      );
  }
}
