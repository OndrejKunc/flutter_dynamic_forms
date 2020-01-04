import 'package:dynamic_forms/dynamic_forms.dart';

abstract class FormElementParser<TFormElement extends FormElement>
    extends ElementParser<TFormElement> {
  FormElement getInstance();

  @override
  TFormElement parse(
      ParserNode parserNode, Element parent, ElementParserFunction parser) {
    TFormElement formElement = getInstance();
    fillProperties(formElement, parserNode, parent, parser);
    return formElement;
  }

  void fillProperties(TFormElement formElement, ParserNode parserNode,
      Element parent, ElementParserFunction parser) {
    formElement
      ..id = parserNode.getPlainStringValue('id')
      ..isVisibleProperty = parserNode.getIsVisible()
      ..parentProperty = parserNode.getParentValue(parent);
  }
}
