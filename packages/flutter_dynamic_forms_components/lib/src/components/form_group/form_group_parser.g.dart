// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class FormGroupParser extends ElementParser<FormGroup> {
  @override
  String get name => "formGroup";

  @override
  FormGroup parse(
      ParserNode parserNode, FormElement parent, ElementParserFunction parser) {
    var formGroup = FormGroup();
    formGroup.fillFormGroup(
      id: parserNode.getPlainStringValue("id"),
      parent: parserNode.getParentValue(parent),
      isVisible: parserNode.getIsVisible(),
      children: parserNode.getChildren<FormElement>(
          parent: formGroup,
          parser: parser,
          childrenPropertyName: "children",
          isContentProperty: true),
      name: parserNode.getStringValue(
        "name",
        isImmutable: true,
      ),
    );
    return formGroup;
  }
}
