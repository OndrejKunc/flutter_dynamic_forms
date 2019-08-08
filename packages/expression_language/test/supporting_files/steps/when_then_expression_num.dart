import 'package:expression_language/src/expressions/expression_provider.dart';
import 'package:expression_language/src/expressions/expressions.dart';
import 'package:expression_language/src/number_type/decimal.dart';
import 'package:expression_language/src/number_type/integer.dart';
import 'package:expression_language/src/parser/expression_grammar_parser.dart';
import 'package:gherkin/gherkin.dart';
import 'package:petitparser/petitparser.dart';

class GivenFormElementIsProvided extends GivenWithWorld<ExpressionWorld> {
  @override
  Future<void> executeStep() async {
    world.buildGrammarParser({"testElement": TestElement()});
  }

  @override
  RegExp get pattern => RegExp(r"form element is provided");
}

class WhenExpressionIsEvaluated
    extends When1WithWorld<String, ExpressionWorld> {
  @override
  Future<void> executeStep(String expression) async {
    try {
      var result = world.parser.parse(expression);
      var expressionValue = result.value as Expression;
      var value = expressionValue.evaluate();
      world.result = value;
    } catch (exception) {
      world.result = exception;
    }
  }

  RegExp get pattern => RegExp(r"expression {string} is evaluated");
}

class ThenIntExpressionResult extends Then1WithWorld<String, ExpressionWorld> {
  @override
  Future<void> executeStep(String result) async {
    expectMatch(world.result, Integer.parse(result));
  }

  RegExp get pattern => RegExp(r"int expression result is {string}");
}

class ThenStringExpressionResult
    extends Then1WithWorld<String, ExpressionWorld> {
  @override
  Future<void> executeStep(String result) async {
    expectMatch(world.result, result);
  }

  RegExp get pattern => RegExp(r"string expression result is {string}");
}

class ThenDecimalExpressionResult
    extends Then1WithWorld<String, ExpressionWorld> {
  @override
  Future<void> executeStep(String result) async {
    expectMatch(world.result, Decimal.parse(result));
  }

  RegExp get pattern => RegExp(r"decimal expression result is {string}");
}

class ThenDateTimeExpressionResult
    extends Then1WithWorld<String, ExpressionWorld> {
  @override
  Future<void> executeStep(String result) async {
    expectMatch(world.result, DateTime.parse(result));
  }

  RegExp get pattern => RegExp(r"DateTime expression result is {string}");
}

class ThenBoolExpressionResult extends Then1WithWorld<String, ExpressionWorld> {
  @override
  Future<void> executeStep(String result) async {
    expectMatch(world.result, result == "true");
  }

  RegExp get pattern => RegExp(r"bool expression result is {string}");
}

class ThenExceptionThrownResult
    extends Then1WithWorld<String, ExpressionWorld> {
  @override
  Future<void> executeStep(String result) async {
    expectMatch(world.result.runtimeType.toString(), result);
  }

  RegExp get pattern => RegExp(r"{string} exception is thrown");
}

class ExpressionWorld extends World {
  ExpressionGrammarParser grammarParser;
  Object result;
  Parser parser;

  ExpressionWorld() {
    grammarParser = ExpressionGrammarParser({});
    parser = grammarParser.build();
  }

  void buildGrammarParser(
      Map<String, ExpressionProviderElement> expressionProviderElementMap) {
    grammarParser = ExpressionGrammarParser(expressionProviderElementMap);
    parser = grammarParser.build();
  }
}

class TestElement extends ExpressionProviderElement {
  Map<String, ExpressionProvider> properties = {
    "value": ConstantExpressionProvider<Integer>(Integer(27)),
    "label": ConstantExpressionProvider<String>("LabelText"),
    "intValue": ConstantExpressionProvider<int>(14),
    "doubleValue": ConstantExpressionProvider<double>(6.5),
  };

  @override
  ExpressionProvider getExpressionProvider([String propertyName]) {
    if (propertyName == null || propertyName == "") {
      propertyName = "value";
    }
    return properties[propertyName];
  }

  @override
  ExpressionProviderElement clone(
      ExpressionProvider<ExpressionProviderElement> parent) {
    //Nothing to do
    return null;
  }
}

class ConstantExpressionProvider<T> extends ExpressionProvider<T> {
  final T value;

  ConstantExpressionProvider(this.value);

  @override
  Expression<T> getExpression() {
    return ConstantExpression(value);
  }
}
