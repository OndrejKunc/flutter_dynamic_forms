import 'package:dynamic_forms/dynamic_forms.dart';

class ValidationParser<TValidation extends Validation>
    extends FormElementParser<TValidation> {
  @override
  String get name => 'validation';

  @override
  FormElement getInstance() => Validation();

  @override
  void fillProperties(
      TValidation validation, ParserNode parserNode, Element? parent, parser) {
    super.fillProperties(validation, parserNode, parent, parser);
    validation
      ..messageProperty = parserNode.getStringProperty('message')
      ..isValidProperty = parserNode.getBoolProperty('isValid',
          defaultValue: ParserNode.defaultTrue);
  }
}
