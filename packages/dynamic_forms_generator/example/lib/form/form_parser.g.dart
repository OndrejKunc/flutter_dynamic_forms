// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class FormParser extends FormElementParser<Form> {
  @override
  String get name => "form";

  @override
  Form parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var form = Form();
    form.fillForm(
      id: parserNode.getPlainStringValue("id"),
      parent: parserNode.getParentValue(parent),
      isVisible: parserNode.getIsVisible(),
      children: parserNode.getChildren<FormElement>(
        parent: form,
        parser: parser,
        childrenPropertyName: "children",
        isContentProperty: false),
      name: parserNode.getStringValue(
        "name",
        isImmutable: true,
      ),
    );
    return form;
  }
}
