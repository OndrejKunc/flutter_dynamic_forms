import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:flutter_dynamic_forms_components/src/components/form/form.dart';

class FormParser extends FormElementParser<Form> {
  @override
  String get name => "form";

  @override
  Form parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var form = Form();
    form.fillForm(
      id: parserNode.getPlainStringValue("id"),
      isVisible: parserNode.getIsVisible(),
      name: parserNode.getStringValue("name"),
      children: parserNode.getChildren<FormElement>(
          parent: form,
          parser: parser,
          childrenPropertyName: "children",
          isContentProperty: true),
    );
    return form;
  }
}
