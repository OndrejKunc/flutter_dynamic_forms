import 'package:dynamic_forms/dynamic_forms.dart';
import 'dart:developer' as developer;

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
    var id = parserNode.getPlainString('id');
    if (!_isIdValid(id)) {
      developer.log(
        'Warning: Invalid identifier \'$id\' for element type $TFormElement in FormElementParser.\n'
        'Only alphanumerics characters and underscores are allowed and identifiers cannot start with a number.',
        level: 900, // 900 relates to Warning according to the package:logging
      );
    }
    formElement
      ..id = id
      ..isVisibleProperty = parserNode.getIsVisibleProperty()
      ..parentProperty = parserNode.getParentProperty(parent as FormElement?);
  }

  static final identifierRegexp = RegExp(r'^[a-zA-Z_][a-zA-Z0-9_]*$');

  bool _isIdValid(String? id) {
    if (id == null) {
      return true;
    }
    return id == '' || identifierRegexp.hasMatch(id);
  }
}
