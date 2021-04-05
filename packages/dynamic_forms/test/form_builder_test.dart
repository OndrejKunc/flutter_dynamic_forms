import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:test/test.dart';

import 'test_components/container/container_parser.dart';
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
  test('expression builder exception test', () {
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
              "expression": "\\"Welcome \\" + @label3 + \\"!\\""
            }
          }
        ]
    }''';

    var formBuilder = FormBuilder(parserService);

    expect(() => formBuilder.build(json),
        throwsA(TypeMatcher<ExpressionBuilderException>()));
  });
}
