// GENERATED CODE - DO NOT MODIFY BY HAND

//ignore_for_file: unused_import
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
      ..inputTypeProperty = parserNode.getEnumProperty(
        'inputType',
        TextFieldInputType.values,
        defaultValue: () => TextFieldInputType.text,
        isImmutable: true,
      )
      ..labelProperty = parserNode.getStringProperty(
        'label',
        defaultValue: ParserNode.defaultString,
        isImmutable: true,
      )
      ..validationsProperty = parserNode.getChildrenProperty<Validation>(
          parent: textField,
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
