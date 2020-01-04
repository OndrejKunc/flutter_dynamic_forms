// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class CheckBoxParser<TCheckBox extends CheckBox>
    extends FormElementParser<TCheckBox> {
  @override
  String get name => 'checkBox';

  @override
  FormElement getInstance() => CheckBox();

  @override
  void fillProperties(
    TCheckBox checkBox, 
    ParserNode parserNode, 
    Element parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(checkBox, parserNode, parent, parser);
    checkBox
      ..labelProperty = parserNode.getStringValue(
        'label',
        isImmutable: true,
      )
      ..valueProperty = parserNode.getValue(
        'value',
        ParserNode.convertToBool,
        ParserNode.defaultFalse,
        isImmutable: false,
      );
  }
}
