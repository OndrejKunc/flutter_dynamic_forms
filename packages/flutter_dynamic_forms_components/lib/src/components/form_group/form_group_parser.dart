import 'package:dynamic_forms/dynamic_forms.dart';

import 'form_group.dart';

class FormGroupParser extends FormElementParser<FormGroup> {
  @override
  String get name => "formGroup";

  @override
  FormGroup parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var formGroup = FormGroup();
    formGroup.fillFormGroup(
      id: parserNode.getPlainStringValue("id"),
      isVisible: parserNode.getIsVisible(),
      parent: parserNode.getParentValue(parent),
      name: parserNode.getStringValue("name"),
      children: parserNode.getChildren<FormElement>(
          parent: formGroup,
          parser: parser,
          childrenPropertyName: "children",
          isContentProperty: true),
    );
    return formGroup;
  }
}
