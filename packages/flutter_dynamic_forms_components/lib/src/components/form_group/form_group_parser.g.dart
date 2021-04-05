// GENERATED CODE - DO NOT MODIFY BY HAND

//ignore_for_file: unused_import
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class FormGroupParser<TFormGroup extends FormGroup>
    extends ItemsContainerParser<TFormGroup> {
  @override
  String get name => 'formGroup';

  @override
  FormElement getInstance() => FormGroup();

  @override
  void fillProperties(
    TFormGroup formGroup, 
    ParserNode parserNode, 
    Element? parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(formGroup, parserNode, parent, parser);
    formGroup
      ..nameProperty = parserNode.getStringProperty(
        'name',
        defaultValue: ParserNode.defaultString,
        isImmutable: true,
      );
  }
}
