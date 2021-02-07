import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';
import 'package:test/test.dart';

void main() {
  test('expression with string and double addition', () {
    var parser = ExpressionParser({});
    var expression = parser.parse('\"Hello \" +  42.7');

    var value = expression.evaluate();
    expect(value, 'Hello 42.7');
  });

  test('expression double with integer value', () {
    var parser = ExpressionParser({});
    var expression = parser.parse('(5.2 + 8)*8');

    var value = expression.evaluate() as Decimal;
    expect(value.toString(), '105.6');
  });

  test('expression only strings, type test', () {
    var parser = ExpressionParser({});
    var expression = parser.parse('\"hi\" + \"how\" + \"are\" + \"you\"');

    expect(expression.getType(), String);
  });

  test('expression strings with integers, type test', () {
    var parser = ExpressionParser({});
    var expression = parser.parse('\"hi\" + 2 + \"are\" + 5');

    expect(expression.getType(), String);
  });

  test('expression strings with double and integers, type test', () {
    var parser = ExpressionParser({});
    var expression = parser.parse('\"hi\" + 2.0 + \"are\" + 5');

    expect(expression.getType(), String);
  });

  test('expression double with integer, type test', () {
    var parser = ExpressionParser({});
    var expression = parser.parse('(5.0 + 8)*8');

    expect(expression.getType(), Decimal);
  });

  test('expression only integers, type test', () {
    var parser = ExpressionParser({});
    var expression = parser.parse('(5 + 8)*8 - 5');

    expect(expression.getType(), Integer);
  });

  test('conditional expression, type test', () {
    var parser = ExpressionParser({});
    var expression = parser.parse('true ? 1 : 2');

    expect(expression.getType(), Integer);
  });

  test('expression number value', () {
    var parser = ExpressionParser({});
    var expression = parser.parse('3 +  7 * (2 + 3*(4+21))');

    var value = expression.evaluate() as Integer;
    expect(value.toInt(), 542);
  });

  test('expression string value', () {
    var parser = ExpressionParser({});
    var expression = parser.parse('\"Hello \" +  \"World\"');

    var value = expression.evaluate();
    expect(value, 'Hello World');
  });

  test('expression unary minus', () {
    var parser = ExpressionParser({});
    var expression = parser.parse('- (2 + 3)');

    var value = expression.evaluate() as Integer;
    expect(value.toInt(), -5);
  });

  test('expression negate bool', () {
    var parser = ExpressionParser({});
    var expression = parser.parse('!(3<5)');

    var value = expression.evaluate();
    expect(value, false);
  });

  test('expression with string and int addition', () {
    var parser = ExpressionParser({});
    var expression = parser.parse('\"Hello \" +  42');

    var value = expression.evaluate();
    expect(value, 'Hello 42');
  });

  test('expression conditional', () {
    var parser = ExpressionParser({});
    var expression = parser.parse('false ? 1 : 0');

    var value = expression.evaluate() as Integer;
    expect(value.toInt(), 0);
  });

  test('expression with reference', () {
    var parser = ExpressionParser({'formId1': TestFormElement()});
    var expression = parser
        .parse('(1 + @formId1.value < 3*5) && false || (2 + 3*(4+21)) >= 15');

    var value = expression.evaluate();
    expect(value, true);
  });

  test('expression with reference with property', () {
    var parser = ExpressionParser({'formId1': TestFormElement()});
    var expression = parser.parse('@formId1.label');

    var value = expression.evaluate();
    expect(value, 'LabelText');
  });

  test('int expression element value', () {
    var parser = ExpressionParser({});
    var testFormElement = TestFormElement();
    var stringExpression = testFormElement.getProperties()['intExpression']
        as StringExpressionProperty<int>;
    stringExpression.buildExpression(parser);
    var value = stringExpression.evaluate();
    expect(value, 12);
  });

  test('integer expression element value', () {
    var parser = ExpressionParser({});
    var testFormElement = TestFormElement();
    var stringExpression = testFormElement.getProperties()['integerExpression']
        as StringExpressionProperty<Integer>;
    stringExpression.buildExpression(parser);
    var value = stringExpression.evaluate();
    expect(value.toInt(), 11);
  });

  test('double expression element value', () {
    var parser = ExpressionParser({});
    var testFormElement = TestFormElement();
    var stringExpression = testFormElement.getProperties()['doubleExpression']
        as StringExpressionProperty<double>;
    stringExpression.buildExpression(parser);
    var value = stringExpression.evaluate();
    expect(value, 9.5);
  });

  test('decimal expression element value', () {
    var parser = ExpressionParser({});
    var testFormElement = TestFormElement();
    var stringExpression = testFormElement.getProperties()['decimalExpression']
        as StringExpressionProperty<Decimal>;
    stringExpression.buildExpression(parser);
    var value = stringExpression.evaluate();
    expect(value.toDouble(), 8.5);
  });

  test('function test', () {
    var parser = ExpressionParser({'formId1': TestFormElement()});
    var expression = parser.parse('length(\"Hello \" +  \"World\")');

    var value = expression.evaluate() as Integer;
    expect(value.toInt(), 11);
  });
}

class TestFormElement extends FormElement {
  final Map<String, Property> _properties = {
    'value': MutableProperty<Integer>(Integer(27)),
    'label': MutableProperty<String>('LabelText'),
    'intExpression': StringExpressionProperty<int>('5 + 7'),
    'integerExpression': StringExpressionProperty<Integer>('5 + 6'),
    'doubleExpression': StringExpressionProperty<double>('5.4 + 4.1'),
    'decimalExpression': StringExpressionProperty<Decimal>('5.3 + 3.2'),
  };

  @override
  Map<String, Property> get properties => _properties;

  @override
  ExpressionProviderElement clone(
      ExpressionProvider<ExpressionProviderElement>? parent) {
    return this;
  }

  @override
  FormElement getInstance() {
    return this;
  }
}
