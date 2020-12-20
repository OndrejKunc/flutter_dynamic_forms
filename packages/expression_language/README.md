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

To be able to reference another expression from the expression itself we use a construct `@element.propertyName`. The `element` can map to any type extending `ExpressionProviderElement`.

There are also special functions like `length` which returns length of the string. Each function paramter can also come from an expression. 
Here is the complete list:

| Function | Description | Sample |
| --- | --- | --- |
| bool contains(String value, String searchValue) | Returns true if value constains searchValue | contains("abcd", "bc") |
| String toString&lt;T>(&lt;T> value) | Returns .toString of the value | toString(5) |
| int durationInDays(Duration value) | Returns duration in days of a given duration value | durationInDays(duration("P5D1H")) |
| int durationInHours(Duration value) | Returns duration in hours of a given duration value | durationInHours(duration("P5D1H")) |
| int durationInMinutes(Duration value) | Returns duration in minutes of a given duration value | durationInMinutes(duration("P5D1H")) |
| int durationInSeconds(Duration value) | Returns duration in seconds of a given duration value | durationInSeconds(duration("P5D1H")) |
| bool startsWith(String value, String searchValue) | Returns true if value starts with searchValue | startsWith("Hello", "He") |
| bool endsWith(String value, String searchValue) | Returns true if value ends with searchValue | startsWith("Hello", "lo") |
| bool isNullOrEmpty(String value) | Returns true if value is null or empty String | isNullOrEmpty("") |
| bool isNull(String value) | Returns true if value is null String | isNull("") |
| bool matches(String value, String regex) | Returns true if value fully matches regex expression | matches("test@email.com","^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$") |
| int length(String value) | length of the string | length("Hi") |
| int length(String value) | length of the string | length("Hi") |
| int count&lt;T>(List&lt;T> value) | length of the string | count(@element.array) |
| DateTime dateTime(String value) | Try to parse value into DateTime, throws InvalidParameterException if it fails | dateTime("1978-03-20 00:00:00.000") |
| DateTime now() | Returns DateTime.now() | now() |
| DateTime nowInUtc() | Returns DateTime.now().toUtc() | nowInUtc() |
| Duration diffDateTime(DateTime left, DateTime right) | Returns difference between two dates - value is always positive |  diff(dateTime("1978-03-20"), dateTime("1976-03-20"))
| Duration duration(String value) | Returns duration from Iso8601 String, thows InvalidParameterException if it fails | duration("P5D1H") |
| num round(num value, int precision, int roundingMode) | Rounds the value with given precision and rounding mode as an int (described below) | round(1.5, 2, 0) |
| num round(num value, int precision, String roundingMode) | Rounds the value with given precision and rounding mode as a String (described below) | round(13.5, 0, "nearestEven") |


Table of the `roundingModes` used in the `round` function:
| Name | Integer representation | Description
| --- | --- | --- |
| nearestEven | 0 | Rounds to the nearest value; if the number falls midway, it is rounded to the nearest value with an even least significant digit |
  nearestOdd | 1 | Rounds to the nearest value; if the number falls midway, it is rounded to the nearest value with an odd least significant digit |
  nearestFromZero| 2 | Rounds to the nearest value; if the number falls midway, it is rounded to the value which is the farthest from zero |
  nearestToZero | 3 | Rounds to the nearest value; if the number falls midway, it is rounded to the value which is the closest to zero |
  nearestDownward |4 | Rounds to the nearest value; if the number falls midway, it rounds down |
  nearestUpward | 5 | Rounds to the nearest value; if the number falls midway, it rounds down |
  towardsZero | 6 | Directed rounding towards zero |
  fromZero | 7 | Directed rounding from zero |
  up | 8 | Directed rounding towards positive infinity |
  down | 9 | Directed rounding towards negative infinity |

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

## Writing custom expressions

You can write your custom expressions simmilar to the ones in the list above.
First you need to extend the `Expression<T>` class, where T is the return value of the Expression. Here is the example of String concatenation expression (in case you don't want to use already implemented + operator):

```dart
import 'package:expression_language/expression_language.dart';

class StringConcatenationExpression extends Expression<String> {
  final Expression<String> left;
  final Expression<String> right;

  StringConcatenationExpression(this.left, this.right);

  @override
  String evaluate() {
    return left.evaluate() + right.evaluate();
  }

  @override
  Expression<String> clone(Map<String, ExpressionProviderElement> elementMap) {
    return StringConcatenationExpression(left.clone(elementMap), right.clone(elementMap));
  }

  @override
  List<Expression> getChildren() {
    return [left, right];
  }
}
```

Now you just need to tell the parser how to create this expression. 
To do this you need to pass subclass of `FunctionExpressionFactory<T>` to the `ExpressionGrammarParser` constructor - there is a `customFunctionExpressionFactories` parameter which takes `List<FunctionExpressionFactory>`.
In case of a simple expressions you can use already existing subclass `ExplicitFunctionExpressionFactory<T>` which takes all the parameters in the constructor so you can avoid subclassing.

This is the registration code for `StringConcatenationExpression`:
```dart
var expressionGrammarDefinition =
    ExpressionGrammarParser({}, 
        customFunctionExpressionFactories: [
            ExplicitFunctionExpressionFactory(
                name: 'concat',
                createFunctionExpression: (parameters) =>
                    StringConcatenationExpression(parameters[0], parameters[1]),
                parametersLength: 2),
        ],
    );
```