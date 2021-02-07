import 'package:dynamic_forms/dynamic_forms.dart';

abstract class FormElementParser<TFormElement extends FormElement>
    extends ElementParser<TFormElement> {
  FormElement getInstance();

  @override
  TFormElement parse(
      ParserNode parserNode, Element? parent, ElementParserFunction parser) {
    var formElement = getInstance() as TFormElement;
    fillProperties(formElement, parserNode, parent, parser);
    return formElement;
  }

  void fillProperties(TFormElement formElement, ParserNode parserNode,
      Element? parent, ElementParserFunction parser) {
    formElement
      ..id = parserNode.getPlainString('id')
      ..isVisibleProperty = parserNode.getIsVisibleProperty()
      ..parentProperty = parserNode.getParentProperty(parent as FormElement?);
  }
}
