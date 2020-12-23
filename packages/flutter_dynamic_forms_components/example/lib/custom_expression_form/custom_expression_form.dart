import 'package:flutter/material.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart'
    as components;
import 'package:expression_language/expression_language.dart';

class CustomExpressionForm extends StatelessWidget {
  final String _sampleJson = r'''
  {
    "@name": "form",
    "id": "form1",
    "children": [
        {
          "@name": "textField",
          "id": "sourceText",
          "label": "Enter custom text",
          "value": "Hello"
        },
        {
          "@name": "label",          
          "value": {
            "expression": "\"This is your text in upper case: \" + toUpperCase(@sourceText.value)"
          }
        }
    ]
}
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Expression Form'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: ParsedFormProvider(
            create: (_) => JsonFormManager(),
            content: _sampleJson,
            parsers: components.getDefaultParserList(),
            child: FormRenderer<JsonFormManager>(
              renderers: components.getReactiveRenderers(),
            ),
            expressionFactories: [
              ExplicitFunctionExpressionFactory(
                name: 'toUpperCase',
                parametersLength: 1,
                createFunctionExpression: (parameters) =>
                    ToUpperCaseExpression(parameters[0]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ToUpperCaseExpression extends Expression<String> {
  final Expression<String> value;

  ToUpperCaseExpression(this.value);

  @override
  Expression<String> clone(Map<String, ExpressionProviderElement> elementMap) {
    return ToUpperCaseExpression(value.clone(elementMap));
  }

  @override
  String evaluate() {
    return value.evaluate().toUpperCase();
  }

  @override
  List<Expression> getChildren() {
    return [
      value,
    ];
  }
}
