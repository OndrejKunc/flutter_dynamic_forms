import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/iterators/form_element_iterator.dart';
import 'package:expression_language/expression_language.dart';
import 'package:test/test.dart';

import 'test_components/container/container_parser.dart';
import 'test_components/label/label.dart';
import 'test_components/label/label_parser.dart';
import 'test_components/single_item_container/single_item_container_parser.dart';

List<ElementParser> _getDefaultParserList() {
  return [
    ContainerParser(),
    LabelParser(),
    SingleItemContainerParser(),
  ];
}

void main() {
  test('json with expressions', () {
    var parserService = JsonFormParserService(_getDefaultParserList());

    var json = '''
    {
        "@name": "container",
        "id": "form1",
        "children": [
          {
            "@name": "label",
            "id": "label1",
            "value": "John Doe"
          },
          {
            "@name": "label",
            "id": "label2",
            "value": {
              "expression": "\\"Welcome \\" + @label1 + \\"!\\""
            }
          }
        ]
    }''';

    var result = parserService.parse(json);

    var formElementMap = Map<String, FormElement>.fromIterable(
        getFormElementIterator<FormElement>(result),
        key: (x) => x.id,
        value: (x) => x);

    var formElementExpressions =
        getFormPropertyIterator<ExpressionProperty>(result);

    var expressionGrammarDefinition = ExpressionGrammarParser(formElementMap);
    var parser = expressionGrammarDefinition.build();

    for (var expressionValue in formElementExpressions) {
      if (expressionValue is StringExpressionProperty) {
        expressionValue.buildExpression(parser);
      }
    }

    var label2 = formElementMap["label2"] as Label;
    var resultValue = label2.value;

    expect(resultValue, "Welcome John Doe!");
  });

  test('json with single child element', () {
    var parserService = JsonFormParserService(_getDefaultParserList());

    var json = '''
    {
        "@name": "singleItemContainer",
        "id": "form1",
        "child":
        {
          "@name": "label",
          "id": "label1",
          "value": "John Doe"
        }       
    }''';

    var result = parserService.parse(json);

    var formElementMap = Map<String, FormElement>.fromIterable(
        getFormElementIterator<FormElement>(result),
        key: (x) => x.id,
        value: (x) => x);

    var label2 = formElementMap["label1"] as Label;
    var resultValue = label2.value;

    expect(resultValue, "John Doe");
  });
}
