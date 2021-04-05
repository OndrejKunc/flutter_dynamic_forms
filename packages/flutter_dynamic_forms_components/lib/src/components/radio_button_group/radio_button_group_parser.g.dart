// GENERATED CODE - DO NOT MODIFY BY HAND

//ignore_for_file: unused_import
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class RadioButtonGroupParser<TRadioButtonGroup extends RadioButtonGroup>
    extends SingleSelectGroupParser<TRadioButtonGroup, RadioButton> {
  @override
  String get name => 'radioButtonGroup';

  @override
  FormElement getInstance() => RadioButtonGroup();

  @override
  void fillProperties(
    TRadioButtonGroup radioButtonGroup, 
    ParserNode parserNode, 
    Element? parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(radioButtonGroup, parserNode, parent, parser);
    radioButtonGroup
      ..arrangementProperty = parserNode.getStringProperty(
        'arrangement',
        defaultValue: ParserNode.defaultString,
        isImmutable: false,
      );
  }
}
