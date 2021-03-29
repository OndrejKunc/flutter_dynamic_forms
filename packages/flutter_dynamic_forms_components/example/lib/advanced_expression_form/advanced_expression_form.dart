import 'package:flutter/material.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart'
    as components;
import 'package:expression_language/expression_language.dart';

/// This example shows how to write custom expressions
/// working with array of custom elements
class AdvancedExpressionForm extends StatelessWidget {
  final String _sampleJson = r'''
  {
    "@name": "form",
    "id": "form1",
    "children": [
        {
          "@name": "form",
          "id": "sliderCollection",
          "children": [
            {
              "@name": "slider",
              "id": "slider1",
              "value": 15.0,
              "minValue": 0.0,
              "maxValue": 100.0
            },
            {
              "@name": "slider",
              "id": "slider2",
              "value": 15.0,
              "minValue": 0.0,
              "maxValue": 100.0
            }
          ]
        },
        {
          "@name": "label",          
          "value": {
                "expression": "\"Slider 1: \" + toString(round(@slider1.value!, 2))"
          }
        },
        {
          "@name": "label",          
          "value": {
                "expression": "\"Slider 2: \" + toString(round(@slider2.value!, 2))"
          }
        },
        {
          "@name": "label",          
          "value": {
            "expression": "\"Sum: \" + toString(round(sumNumbers(selectNumberProperty(@sliderCollection.children, \"value\")), 2))"
          }
        }
    ]
}
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced Expression Form'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: ParsedFormProvider(
            create: (_) => JsonFormManager(),
            content: _sampleJson,
            parsers: components.getDefaultParserList(),
            child: FormRenderer<JsonFormManager>(
              renderers: components.getRenderers(),
            ),
            expressionFactories: [
              ExplicitFunctionExpressionFactory(
                name: 'selectNumberProperty',
                parametersLength: 2,
                createFunctionExpression: (parameters) =>
                    SelectNumberPropertyExpression(
                        parameters[0]
                            as Expression<List<ExpressionProviderElement>>,
                        parameters[1] as Expression<String>),
              ),
              ExplicitFunctionExpressionFactory(
                name: 'sumNumbers',
                parametersLength: 1,
                createFunctionExpression: (parameters) => SumNumbersExpression(
                    parameters[0] as Expression<List<Expression<Number>>>),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectNumberPropertyExpression<T extends ExpressionProviderElement>
    extends Expression<List<Expression<Number>>> {
  final Expression<List<T>> value;
  final Expression<String> selectorPropertyName;

  SelectNumberPropertyExpression(this.value, this.selectorPropertyName);

  @override
  Expression<List<Expression<Number>>> clone(
      Map<String, ExpressionProviderElement> elementMap) {
    return SelectNumberPropertyExpression<T>(
        value.clone(elementMap), selectorPropertyName.clone(elementMap));
  }

  @override
  List<Expression<Number>> evaluate() {
    var propertyName = selectorPropertyName.evaluate();
    var delegateExpressions = value
        .evaluate()
        .map((e) => createDelegateExpression(
            [e.id!], e.getExpressionProvider(propertyName)))
        .cast<Expression<Number?>>()
        .map((e) => NullableToNonNullableExpression(e))
        .toList();

    return delegateExpressions;
  }

  @override
  List<Expression> getChildren() {
    return [
      value,
      ...evaluate(), // expressions from the selector must be included as well
      selectorPropertyName,
    ];
  }
}

class SumNumbersExpression extends Expression<Number> {
  final Expression<List<Expression<Number>>> value;

  SumNumbersExpression(this.value);

  @override
  Expression<Number> clone(Map<String, ExpressionProviderElement> elementMap) {
    return SumNumbersExpression(value.clone(elementMap));
  }

  @override
  Number evaluate() {
    return value
        .evaluate()
        .map((v) => v.evaluate())
        .fold(Integer(0), (previous, current) => previous + current);
  }

  @override
  List<Expression> getChildren() {
    return [value];
  }
}
