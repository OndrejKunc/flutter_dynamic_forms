import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';

import '../required_validation/required_validation.dart';

class RequiredValidationParser extends ValidationParser<RequiredValidation> {
  @override
  String get name => 'requiredValidation';

  @override
  void fillProperties(RequiredValidation validation, ParserNode parserNode,
      Element? parent, parser) {
    validation
      ..id = parserNode.getPlainString('id')
      ..isVisibleProperty = parserNode.getIsVisibleProperty()
      ..parentProperty = parserNode.getParentProperty(parent as FormElement?)
      ..messageProperty = parserNode.getStringProperty('message')
      ..isValidProperty = getIsValid(parent);
  }

  @override
  FormElement getInstance() => RequiredValidation();

  /// Gets the "value" property of the parent element and creates
  /// ExpressionProperty which is true when the value property is
  /// greater than zero.
  ///
  /// It has to be declared as LazyExpressionProperty because parent
  /// properties are not initialized at this point so
  /// parent.getExpressionProvider would return null.
  LazyExpressionProperty<bool> getIsValid(FormElement? parent) {
    return LazyExpressionProperty(
      () => CustomFunctionExpression<bool>(
        [
          DelegateExpression(
            [parent!.id!],
            parent.getExpressionProvider(),
          ),
        ],
        (parameters) {
          var text = parameters[0] as String;
          return text.isNotEmpty;
        },
      ),
    );
  }
}
