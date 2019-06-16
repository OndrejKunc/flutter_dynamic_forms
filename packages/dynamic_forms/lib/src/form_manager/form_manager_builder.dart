import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_elements/form_elements.dart';
import 'package:dynamic_forms/src/form_manager/form_manager.dart';
import 'package:dynamic_forms/src/iterators/form_element_iterator.dart';
import 'package:dynamic_forms/src/iterators/form_element_value_iterator.dart';
import 'package:dynamic_forms/src/parser/form_parser_service.dart';
import 'package:expression_language/expression_language.dart';
import 'package:petitparser/petitparser.dart';

class FormManagerBuilder {
  final FormParserService formParserService;

  FormManagerBuilder(this.formParserService);

  FormManager build(String xml) {
    var form = formParserService.parse(xml);

    var formElementMap = Map<String, FormElement>.fromIterable(
        getFormElementIterator<FormElement>(form),
        key: (x) => x.id,
        value: (x) => x);
    var expressionGrammarDefinition = ExpressionGrammarParser(formElementMap);
    var parser = expressionGrammarDefinition.build();
    _buildStringExpressions(form, parser);
    return _build(form, formElementMap);
  }

  FormManager buildFromForm(Form form) {
    var clonedForm = form.clone(null);
    var formElementMap = Map<String, FormElement>.fromIterable(
        getFormElementIterator<FormElement>(form),
        key: (x) => x.id,
        value: (x) => x);
    _buildCloneableExpressions(clonedForm, formElementMap);
    return _build(clonedForm, formElementMap);
  }

  FormManager _build(Form form, Map<String, FormElement> formElementMap) {
    buildElementsSubscriptionDependencies(form);

    var formValidations = Map<String, Validation>.fromIterable(
        getFormElementIterator<Validation>(form),
        key: (x) => x.id,
        value: (x) => x);

    var formPrimitiveMutableValues =
        getFormElementValueIterator<PrimitiveMutableElementValue>(form)
            .toList();

    return FormManager(
        form, formElementMap, formValidations, formPrimitiveMutableValues);
  }

  void _buildCloneableExpressions(
      Form form, Map<String, FormElement> expressionProviderElementMap) {
    var formElementExpressions =
        getFormElementValueIterator<CloneableExpressionElementValue>(form);

    for (var expressionValue in formElementExpressions) {
      expressionValue.buildExpression(expressionProviderElementMap);
    }
  }

  void _buildStringExpressions(Form form, Parser parser) {
    var formElementExpressions =
        getFormElementValueIterator<StringExpressionElementValue>(form);

    for (var expressionValue in formElementExpressions) {
      expressionValue.buildExpression(parser);
    }
  }

  void buildElementsSubscriptionDependencies(Form form) {
    var formElementValues = getFormElementValueIterator<ElementValue>(form);

    for (var elementValue in formElementValues) {
      var elementsValuesCollectorVisitor = ExpressionProviderCollectorVisitor();
      elementValue.getExpression().accept(elementsValuesCollectorVisitor);
      for (var sourceElementValue
          in elementsValuesCollectorVisitor.expressionProviders) {
        (sourceElementValue as ElementValue).addSubscriber(elementValue);
      }
    }
  }
}
