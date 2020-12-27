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
  test('xml with expressions', () {
    var parserService = XmlFormParserService(_getDefaultParserList());

    var xml = '''<?xml version="1.0" encoding="UTF-8"?>
      <container id="form1">
        <label
            id="label1"
            value="John Doe" />
        <label
            id="label2">
            <label.value>
              <expression><![CDATA[
                      "Welcome " + @label1 + "!"
                  ]]></expression>
            </label.value>
        </label>
      </container>''';

    var result = parserService.parse(xml);

    var formElementMap = {
      for (var x in getFormElementIterator<FormElement>(result)) x.id: x
    };

    var formElementExpressions =
        getFormPropertyIterator<ExpressionProperty>(result);

    var parser = ExpressionParser(formElementMap);

    for (var expressionValue in formElementExpressions) {
      if (expressionValue is StringExpressionProperty) {
        expressionValue.buildExpression(parser);
      }
    }

    var label2 = formElementMap['label2'] as Label;
    var resultValue = label2.value;

    expect(resultValue, 'Welcome John Doe!');
  });

  test('xml with content property as explicit property', () {
    var parserService = XmlFormParserService(_getDefaultParserList());

    var xml = '''<?xml version="1.0" encoding="UTF-8"?>
      <container id="form1">
        <container.children>
          <label
            id="label1"
            value="John Doe" />
          <label
            id="label2"
            value="Hello World" />
        </container.children>
      </container>''';

    var result = parserService.parse(xml);

    var formElementMap = {
      for (var x in getFormElementIterator<FormElement>(result)) x.id: x
    };

    var label2 = formElementMap['label2'] as Label;
    var resultValue = label2.value;

    expect(resultValue, 'Hello World');
  });

  test('xml with non content property as explicit property', () {
    var parserService = XmlFormParserService(_getDefaultParserList());

    var xml = '''<?xml version="1.0" encoding="UTF-8"?>
      <container id="form1">
        <container.children2>
          <label
            id="label1"
            value="test1" />
          <label
            id="label2"
            value="test2" />
        </container.children2>
        <label
          id="label3"
          value="John Doe" />
        <label
          id="label4"
          value="Hello World" />
      </container>''';

    var result = parserService.parse(xml);

    var formElementMap = {
      for (var x in getFormElementIterator<FormElement>(result)) x.id: x
    };

    var label2 = formElementMap['label2'] as Label;
    var resultValue = label2.value;

    expect(resultValue, 'test2');
  });

  test('xml with single child element', () {
    var parserService = XmlFormParserService(_getDefaultParserList());

    var xml = '''<?xml version="1.0" encoding="UTF-8"?>
      <singleItemContainer id="form1">
        <label
            id="label1"
            value="John Doe" />       
      </singleItemContainer>''';

    var result = parserService.parse(xml);

    var formElementMap = {
      for (var x in getFormElementIterator<FormElement>(result)) x.id: x
    };

    var label1 = formElementMap['label1'] as Label;
    var resultValue = label1.value;

    expect(resultValue, 'John Doe');
  });

  test('xml with enum without dot', () {
    var parserService = XmlFormParserService(_getDefaultParserList());

    var xml = '''<?xml version="1.0" encoding="UTF-8"?>
      <label
          id="label1"
          value="John Doe"
          fontSize="large" />''';

    var result = parserService.parse(xml);

    var formElementMap = {
      for (var x in getFormElementIterator<FormElement>(result)) x.id: x
    };

    var label1 = formElementMap['label1'] as Label;
    var resultValue = label1.fontSize;

    expect(resultValue, FontSize.large);
  });

  test('xml with default value enum', () {
    var parserService = XmlFormParserService(_getDefaultParserList());

    var xml = '''<?xml version="1.0" encoding="UTF-8"?>
      <label
          id="label1"
          value="John Doe" />''';

    var result = parserService.parse(xml);

    var formElementMap = {
      for (var x in getFormElementIterator<FormElement>(result)) x.id: x
    };

    var label1 = formElementMap['label1'] as Label;
    var resultValue = label1.fontSize;

    expect(resultValue, FontSize.medium);
  });

  test('xml with enum with dot', () {
    var parserService = XmlFormParserService(_getDefaultParserList());

    var xml = '''<?xml version="1.0" encoding="UTF-8"?>
      <label
          id="label1"
          value="John Doe"
          fontSize="FontSize.small" />''';

    var result = parserService.parse(xml);

    var formElementMap = {
      for (var x in getFormElementIterator<FormElement>(result)) x.id: x
    };

    var label1 = formElementMap['label1'] as Label;
    var resultValue = label1.fontSize;

    expect(resultValue, FontSize.small);
  });

  test('xml with single child element in property', () {
    var parserService = XmlFormParserService(_getDefaultParserList());

    var xml = '''<?xml version="1.0" encoding="UTF-8"?>
      <singleItemContainer id="form1">
        <singleItemContainer.child>
          <label
              id="label1"
              value="John Doe" />      
        </singleItemContainer.child> 
      </singleItemContainer>''';

    var result = parserService.parse(xml);

    var formElementMap = {
      for (var x in getFormElementIterator<FormElement>(result)) x.id: x
    };

    var label1 = formElementMap['label1'] as Label;
    var resultValue = label1.value;

    expect(resultValue, 'John Doe');
  });

  test('xml with HTML value', () {
    var parserService = XmlFormParserService(_getDefaultParserList());

    var xml = '''<?xml version="1.0" encoding="UTF-8"?>
      <container id="form1">
        <label
          id="label1">
          <label.value>
            <![CDATA[
              <b>Html help action</b>
            ]]>
          </label.value>
        </label>
      </container>''';

    var result = parserService.parse(xml);

    var formElementMap = {
      for (var x in getFormElementIterator<FormElement>(result)) x.id: x
    };
    var label1 = formElementMap['label1'] as Label;
    var resultValue = label1.value;

    expect(resultValue, '<b>Html help action</b>');
  });

  test('xml with changing expressions', () {
    var parserService = XmlFormParserService(_getDefaultParserList());

    var xml = '''<?xml version="1.0" encoding="UTF-8"?>
      <container id="form1">
        <label
          id="label1"
          value="John Doe" />
        <label
          id="label2">
          <label.value>
            <expression><![CDATA[
                    "Welcome " + @label1 + "!"
                ]]></expression>
          </label.value>
        </label>
      </container>''';

    var result = parserService.parse(xml);

    var formElementMap = {
      for (var x in getFormElementIterator<FormElement>(result)) x.id: x
    };

    var formElementExpressions =
        getFormPropertyIterator<ExpressionProperty>(result);

    var parser = ExpressionParser(formElementMap);

    for (var expressionValue in formElementExpressions) {
      if (expressionValue is StringExpressionProperty) {
        expressionValue.buildExpression(parser);
      }
    }

    var formProperties = getFormPropertyIterator<Property>(result);

    for (var property in formProperties) {
      for (var sourceProperty
          in property.getExpression().getExpressionProviders()) {
        (sourceProperty as Property).addSubscriber(property);
      }
    }

    var label2 = formElementMap['label2'] as Label;

    expect(label2.value, 'Welcome John Doe!');
  });
}
