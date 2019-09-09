# expression_language

[![pub package](https://img.shields.io/pub/v/expression_language.svg)](https://pub.dev/packages/expression_language)

Dart library for parsing and evaluating expressions.

## Main goal

Main goal of this library is to be able to parse and evaluate expressions like: 
```dart
4 * 2.5 + 8.5 + 1.5 / 3.0
```
```dart
3* @control1.numberProperty1 < (length(@control2.stringProperty1 + "test string") - 42)
```
```dart
(!@control1.boolProperty1 && length(@control2.stringProperty1) == 21) ? "string1" : "string2"
```

## Features

Currently there are multiple supported data types and operations.

### Data types
* `String` -> maps directly to the Dart `String`
* `bool` -> maps directly to the Dart `bool`
* `Integer` -> wrapper around the Dart `int`
* `Decimal` -> Custom type
* `DateTime` -> maps directly to the Dart `DateTime`
* `Duration` -> maps directly to the Dart `Duration`

Note: To be able to easily work with financial data and not to lose precision we decided to use `Decimal` data type taken from [dart-decimal](https://github.com/a14n/dart-decimal) instead of `double`. To keep our expression definitions strongly typed and to have a common way to work with all number data types we introduced base `Number` data type class which is simmilar to Dart `num` class. Since we can't modify definition of the Dart `int` we have also introduced `Integer` data type which is a simple wrapper around the `int` and which also extends `Number`. There is a conversion expression from `Integer` to `int` and from `Decimal` to `double` so higher layers can hide those data types as an implementation detail.
To learn more about DateTime data type in expressions see this [merge request](https://github.com/OndrejKunc/flutter_dynamic_forms/pull/9).

### Operations
There are most of the standard operations working on the data types above. For example you can use most of the arithmetic operators like `+`,`-`, `*`, `/` , `~/`, `%` or the logical operators like `&&`, `||`, `!`, `<`, `>`, `<=`, `>=`, `==`.

There are also special functions like `length` which returns length of the string, `round` which rounds the `Decimal` number, `now` which returns current date time, `toString` which converts numeric value to the string.

To be able to reference another expression from the expression itself we use a construct `@element.propertyName`. The `element` can map to any type extending `ExpressionProviderElement`.

## Usage

```dart
//Create expression parser and pass a map of the types extending ExpressionProviderElement which can hold other expressions.
var expressionGrammarDefinition =
    ExpressionGrammarParser({"element": TestFormElement()});
var parser = expressionGrammarDefinition.build();

//Parse the expression.
var result = parser
    .parse("(1 + @element.value < 3*5) && false || (2 + 3*(4 + 21)) >= 15");

//The expression now contains strongly typed expression tree representing the expression above.
var expression = result.value as Expression<bool>;

//Evaluate the expression.
bool value = expression.evaluate();
```