import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_manager/form_data.dart';
import 'package:dynamic_forms/src/iterators/form_element_iterator.dart';
import 'package:dynamic_forms/src/iterators/form_property_iterator.dart';
import 'package:dynamic_forms/src/parser/form_parser_service.dart';
import 'package:expression_language/expression_language.dart';

class FormBuilder {
  final FormParserService formParserService;
  final List<FunctionExpressionFactory> expressionFactories;

  FormBuilder(
    this.formParserService, {
    this.expressionFactories = const [],
  });

  FormData build(String content) {
    var root = formParserService.parse(content);

    var formElementMap = {
      for (var x in getFormElementIterator<FormElement>(root)) x.id: x
    };
    var parser = ExpressionParser(formElementMap,
        expressionFactories: expressionFactories);
    _buildStringExpressions(root, parser);
    return _build(root, formElementMap);
  }

  FormData buildFromForm(FormElement root) {
    var clonedForm = root.clone(null);
    var formElementMap = {
      for (var x in getFormElementIterator<FormElement>(clonedForm)) x.id: x
    };
    _buildCloneableExpressions(clonedForm, formElementMap);
    return _build(clonedForm, formElementMap);
  }

  FormData _build(FormElement root, Map<String, FormElement> formElementMap) {
    _buildElementsSubscriptionDependencies(root);

    var formValidations = getFormElementIterator<Validation>(root).toList();

    var formMutableValues =
        getFormPropertyIterator<MutableProperty>(root).toList();

    return FormData(
        form: root,
        formElementMap: formElementMap,
        validations: formValidations,
        mutableValues: formMutableValues);
  }

  void _buildCloneableExpressions(
      FormElement form, Map<String, FormElement> expressionProviderElementMap) {
    var formElementExpressions =
        getFormPropertyIterator<CloneableExpressionProperty>(form);

    for (var expressionValue in formElementExpressions) {
      expressionValue.buildExpression(expressionProviderElementMap);
    }
  }

  void _buildStringExpressions(FormElement root, ExpressionParser parser) {
    var formElementExpressions =
        getFormPropertyIterator<StringExpressionProperty>(root);

    for (var expressionValue in formElementExpressions) {
      expressionValue.buildExpression(parser);
    }
  }

  void _buildElementsSubscriptionDependencies(FormElement root) {
    var formProperties = getFormPropertyIterator<Property>(root);

    for (var property in formProperties) {
      for (var sourceProperty
          in property.getExpression().getExpressionProviders()) {
        (sourceProperty as Property).addSubscriber(property);
      }
    }
  }
}
