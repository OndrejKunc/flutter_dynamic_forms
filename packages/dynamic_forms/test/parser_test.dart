import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_manager/form_manager_builder.dart';
import 'package:dynamic_forms/src/iterators/form_element_iterator.dart';
import 'package:dynamic_forms/src/iterators/form_element_value_iterator.dart';
import 'package:expression_language/expression_language.dart';
import 'package:test/test.dart';

void main() {
  test('expression with string and double addition', () {
    var expressionGrammarDefinition = ExpressionGrammarParser({});
    var parser = expressionGrammarDefinition.build();
    var result = parser.parse("\"Hello \" +  42.7");
    var expression = result.value as Expression;
    var value = expression.evaluate();
    expect(value, "Hello 42.7");
  });

  test('expression double with integer value', () {
    var expressionGrammarDefinition = ExpressionGrammarParser({});
    var parser = expressionGrammarDefinition.build();
    var result = parser.parse("(5.2 + 8)*8");
    var expression = result.value as Expression;
    var value = expression.evaluate() as Decimal;
    expect(value.toString(), "105.6");
  });

  test('expression only strings, type test', () {
    var expressionGrammarDefinition = ExpressionGrammarParser({});
    var parser = expressionGrammarDefinition.build();
    var result = parser.parse("\"hi\" + \"how\" + \"are\" + \"you\"");
    var expression = result.value as Expression;
    expect(expression.getType(), String);
  });

  test('expression strings with integers, type test', () {
    var expressionGrammarDefinition = ExpressionGrammarParser({});
    var parser = expressionGrammarDefinition.build();
    var result = parser.parse("\"hi\" + 2 + \"are\" + 5");
    var expression = result.value as Expression;
    expect(expression.getType(), String);
  });

  test('expression strings with double and integers, type test', () {
    var expressionGrammarDefinition = ExpressionGrammarParser({});
    var parser = expressionGrammarDefinition.build();
    var result = parser.parse("\"hi\" + 2.0 + \"are\" + 5");
    var expression = result.value as Expression;
    expect(expression.getType(), String);
  });

  test('expression double with integer, type test', () {
    var expressionGrammarDefinition = ExpressionGrammarParser({});
    var parser = expressionGrammarDefinition.build();
    var result = parser.parse("(5.0 + 8)*8");
    var expression = result.value as Expression;
    expect(expression.getType(), Decimal);
  });

  test('expression only integers, type test', () {
    var expressionGrammarDefinition = ExpressionGrammarParser({});
    var parser = expressionGrammarDefinition.build();
    var result = parser.parse("(5 + 8)*8 - 5");
    var expression = result.value as Expression;
    expect(expression.getType(), Integer);
  });

  test('conditional expression, type test', () {
    var expressionGrammarDefinition = ExpressionGrammarParser({});
    var parser = expressionGrammarDefinition.build();
    var result = parser.parse("true ? 1 : 2");
    var expression = result.value as Expression;
    expect(expression.getType(), Integer);
  });

  test('expression number value', () {
    var expressionGrammarDefinition = ExpressionGrammarParser({});
    var parser = expressionGrammarDefinition.build();
    var result = parser.parse("3 +  7 * (2 + 3*(4+21))");
    var expression = result.value as Expression;
    var value = expression.evaluate() as Integer;
    expect(value.toInt(), 542);
  });

  test('expression string value', () {
    var expressionGrammarDefinition = ExpressionGrammarParser({});
    var parser = expressionGrammarDefinition.build();
    var result = parser.parse("\"Hello \" +  \"World\"");
    var expression = result.value as Expression;
    var value = expression.evaluate();
    expect(value, "Hello World");
  });

  test('expression unary minus', () {
    var expressionGrammarDefinition = ExpressionGrammarParser({});
    var parser = expressionGrammarDefinition.build();
    var result = parser.parse("- (2 + 3)");
    var expression = result.value as Expression;
    var value = expression.evaluate() as Integer;
    expect(value.toInt(), -5);
  });

  test('expression negate bool', () {
    var expressionGrammarDefinition = ExpressionGrammarParser({});
    var parser = expressionGrammarDefinition.build();
    var result = parser.parse("!(3<5)");
    var expression = result.value as Expression;
    var value = expression.evaluate();
    expect(value, false);
  });

  test('expression with string and int addition', () {
    var expressionGrammarDefinition = ExpressionGrammarParser({});
    var parser = expressionGrammarDefinition.build();
    var result = parser.parse("\"Hello \" +  42");
    var expression = result.value as Expression;
    var value = expression.evaluate();
    expect(value, "Hello 42");
  });

  test('expression conditional', () {
    var expressionGrammarDefinition = ExpressionGrammarParser({});
    var parser = expressionGrammarDefinition.build();
    var result = parser.parse("false ? 1 : 0");
    var expression = result.value as Expression;
    var value = expression.evaluate() as Integer;
    expect(value.toInt(), 0);
  });

  test('expression with reference', () {
    var expressionGrammarDefinition =
        ExpressionGrammarParser({"formId1": TestFormElement()});
    var parser = expressionGrammarDefinition.build();
    var result = parser
        .parse("(1 + @formId1.value < 3*5) && false || (2 + 3*(4+21)) >= 15");
    var expression = result.value as Expression;
    var value = expression.evaluate();
    expect(value, true);
  });

  test('expression with reference with property', () {
    var expressionGrammarDefinition =
        ExpressionGrammarParser({"formId1": TestFormElement()});
    var parser = expressionGrammarDefinition.build();
    var result = parser.parse("@formId1.label");
    var expression = result.value as Expression;
    var value = expression.evaluate();
    expect(value, "LabelText");
  });

  test('function test', () {
    var expressionGrammarDefinition =
        ExpressionGrammarParser({"formId1": TestFormElement()});
    var parser = expressionGrammarDefinition.build();
    var result = parser.parse("length(\"Hello \" +  \"World\")");
    var expression = result.value as Expression;
    var value = expression.evaluate() as Integer;
    expect(value.toInt(), 11);
  });

  test('xml with expressions', () {
    var parserService = FormParserService(getDefaultParserList());

    var xml = '''<?xml version="1.0" encoding="UTF-8"?>
      <form id="form1">
          <formGroup id="formgroup1">
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
          </formGroup>
      </form>''';

    var result = parserService.parse(xml);

    var formElementMap = Map<String, FormElement>.fromIterable(
        getFormElementIterator<FormElement>(result),
        key: (x) => x.id,
        value: (x) => x);

    var formElementExpressions =
        getFormElementValueIterator<ExpressionElementValue>(result);

    var expressionGrammarDefinition = ExpressionGrammarParser(formElementMap);
    var parser = expressionGrammarDefinition.build();

    for (var expressionValue in formElementExpressions) {
      if (expressionValue is StringExpressionElementValue) {
        expressionValue.buildExpression(parser);
      }
    }

    var label2 = formElementMap["label2"] as Label;
    var resultValue = label2.value;

    expect(resultValue, "Welcome John Doe!");
  });

  test('xml with changing expressions', () {
    var parserService = FormParserService(getDefaultParserList());

    var xml = '''<?xml version="1.0" encoding="UTF-8"?>
      <form id="form1">
          <formGroup id="formgroup1">
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
          </formGroup>
      </form>''';

    var result = parserService.parse(xml);

    var formElementMap = Map<String, FormElement>.fromIterable(
        getFormElementIterator<FormElement>(result),
        key: (x) => x.id,
        value: (x) => x);

    var formElementExpressions =
        getFormElementValueIterator<ExpressionElementValue>(result);

    var expressionGrammarDefinition = ExpressionGrammarParser(formElementMap);
    var parser = expressionGrammarDefinition.build();

    for (var expressionValue in formElementExpressions) {
      if (expressionValue is StringExpressionElementValue) {
        expressionValue.buildExpression(parser);
      }
    }

    var formElementValues = getFormElementValueIterator<ElementValue>(result);

    for (var elementValue in formElementValues) {
      var elementsValuesCollectorVisitor = ExpressionProviderCollectorVisitor();
      elementValue.getExpression().accept(elementsValuesCollectorVisitor);
      for (var sourceElementValue
          in elementsValuesCollectorVisitor.expressionProviders) {
        (sourceElementValue as ElementValue).addSubscriber(elementValue);
      }
    }

    var label2 = formElementMap["label2"] as Label;

    expect(label2.value, "Welcome John Doe!");
  });

  test('form manager test', () {
    var xml = '''<?xml version="1.0" encoding="UTF-8"?>
      <form id="form1">
          <formGroup id="formgroup1">
              <text
                id="text1">
                <text.validations>
                  <validation
                  message="Name is too long">
                    <validation.isValid>
                        <expression>
                            <![CDATA[
                                length(@label1) < 15
                            ]]>
                        </expression>
                    </validation.isValid>
                </validation>
                </text.validations>
              </text>
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
          </formGroup>
      </form>''';

    var parserService = FormParserService(getDefaultParserList());

    var formManager = FormManagerBuilder(parserService).build(xml);
  });
}

class TestFormElement extends FormElement {
  @override
  Map<String, ElementValue> getProperties() => {
        "value": PrimitiveMutableElementValue<Integer>(Integer(27)),
        "label": PrimitiveMutableElementValue<String>("LabelText")
      };

  @override
  ExpressionProviderElement clone(
      ExpressionProvider<ExpressionProviderElement> parent) {
    //Nothing to do
    return null;
  }

  @override
  FormElement getInstance() {
    //Nothing to do
    return null;
  }
}
