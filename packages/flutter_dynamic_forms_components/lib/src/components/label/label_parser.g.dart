// GENERATED CODE - DO NOT MODIFY BY HAND

//ignore_for_file: unused_import
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class LabelParser<TLabel extends Label>
    extends FormElementParser<TLabel> {
  @override
  String get name => 'label';

  @override
  FormElement getInstance() => Label();

  @override
  void fillProperties(
    TLabel label, 
    ParserNode parserNode, 
    Element parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(label, parserNode, parent, parser);
    label
      ..valueProperty = parserNode.getStringProperty(
        'value',
        defaultValue: ParserNode.defaultString,
        isImmutable: true,
      );
  }
}
