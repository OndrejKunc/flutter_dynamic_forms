import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_manager/form_manager.dart';
import 'package:dynamic_forms/src/iterators/form_element_iterator.dart';
import 'package:dynamic_forms/src/iterators/form_property_iterator.dart';
import 'package:dynamic_forms/src/parser/form_parser_service.dart';
import 'package:expression_language/expression_language.dart';

class FormManagerBuilder {
  final FormParserService formParserService;

  FormManagerBuilder(this.formParserService);

  FormManager build(String content) {
    var root = formParserService.parse(content);

    var formElementMap = Map<String, FormElement>.fromIterable(
        getFormElementIterator<FormElement>(root),
        key: (x) => x.id,
        value: (x) => x);
    var parser = ExpressionParser(formElementMap);
    _buildStringExpressions(root, parser);
    return _build(root, formElementMap);
  }

  FormManager buildFromForm(FormElement root) {
    var clonedForm = root.clone(null);
    var formElementMap = Map<String, FormElement>.fromIterable(
        getFormElementIterator<FormElement>(clonedForm),
        key: (x) => x.id,
        value: (x) => x);
    _buildCloneableExpressions(clonedForm, formElementMap);
    return _build(clonedForm, formElementMap);
  }

  FormManager _build(
      FormElement root, Map<String, FormElement> formElementMap) {
    _buildElementsSubscriptionDependencies(root);

    var formValidations = Map<String, Validation>.fromIterable(
        getFormElementIterator<Validation>(root),
        key: (x) => x.id,
        value: (x) => x);

    var formMutableValues =
        getFormPropertyIterator<MutableProperty>(root).toList();

    return FormManager(
        root, formElementMap, formValidations, formMutableValues);
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
      var elementsValuesCollectorVisitor = ExpressionProviderCollectorVisitor();
      property.getExpression().accept(elementsValuesCollectorVisitor);
      for (var sourceProperty
          in elementsValuesCollectorVisitor.expressionProviders) {
        (sourceProperty as Property).addSubscriber(property);
      }
    }
  }
}
