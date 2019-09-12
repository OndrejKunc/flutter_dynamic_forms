// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class FormGroupParser extends FormElementParser<FormGroup> {
  @override
  String get name => "formGroup";

  @override
  FormGroup parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var formGroup = FormGroup();
    formGroup.fillFormGroup(
      id: parserNode.getPlainStringValue("id"),
      parent: parserNode.getParentValue(parent),
      isVisible: parserNode.getIsVisible(),
      children: parserNode.getChildren<FormElement>(
        parent: formGroup,
        parser: parser,
        childrenPropertyName: "children",
        isContentProperty: false),
      name: parserNode.getStringValue(
        "name",
        isImmutable: true,
      ),
    );
    return formGroup;
  }
}
