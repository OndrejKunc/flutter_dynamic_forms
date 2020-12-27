import 'package:expression_language/expression_language.dart';
import 'package:expression_language/src/parser/function_expression_factory.dart';

import 'round_function_expression_factory.dart';

List<FunctionExpressionFactory> getDefaultFunctionExpressionFactories() {
  return [
    RoundFunctionExpressionFactory(),
    ExplicitFunctionExpressionFactory(
      name: 'length',
      parametersLength: 1,
      createFunctionExpression: (parameters) =>
          LengthFunctionExpression(parameters[0]),
    ),
    ExplicitFunctionExpressionFactory(
      name: 'toString',
      parametersLength: 1,
      createFunctionExpression: (parameters) =>
          ToStringFunctionExpression(parameters[0]),
    ),
    ExplicitFunctionExpressionFactory(
      name: 'isNull',
      parametersLength: 1,
      createFunctionExpression: (parameters) =>
          IsNullFunctionExpression(parameters[0]),
    ),
    ExplicitFunctionExpressionFactory(
      name: 'isNullOrEmpty',
      parametersLength: 1,
      createFunctionExpression: (parameters) =>
          IsNullOrEmptyFunctionExpression(parameters[0]),
    ),
    ExplicitFunctionExpressionFactory(
      name: 'count',
      parametersLength: 1,
      createFunctionExpression: (parameters) =>
          ListCountFunctionExpression(parameters[0]),
    ),
    ExplicitFunctionExpressionFactory(
      name: 'dateTime',
      parametersLength: 1,
      createFunctionExpression: (parameters) =>
          DateTimeFunctionExpression(parameters[0]),
    ),
    ExplicitFunctionExpressionFactory(
      name: 'duration',
      parametersLength: 1,
      createFunctionExpression: (parameters) =>
          DurationFunctionExpression(parameters[0]),
    ),
    ExplicitFunctionExpressionFactory(
      name: 'now',
      parametersLength: 0,
      createFunctionExpression: (parameters) => NowFunctionExpression(),
    ),
    ExplicitFunctionExpressionFactory(
      name: 'nowInUtc',
      parametersLength: 0,
      createFunctionExpression: (parameters) => NowInUtcFunctionExpression(),
    ),
    ExplicitFunctionExpressionFactory(
      name: 'diffDateTime',
      parametersLength: 2,
      createFunctionExpression: (parameters) =>
          DiffDateTimeFunctionExpression(parameters[0], parameters[1]),
    ),
    ExplicitFunctionExpressionFactory(
      name: 'durationInDays',
      parametersLength: 1,
      createFunctionExpression: (parameters) =>
          DurationInDaysFunctionExpression(parameters[0]),
    ),
    ExplicitFunctionExpressionFactory(
      name: 'durationInHours',
      parametersLength: 1,
      createFunctionExpression: (parameters) =>
          DurationInHoursFunctionExpression(parameters[0]),
    ),
    ExplicitFunctionExpressionFactory(
      name: 'durationInMinutes',
      parametersLength: 1,
      createFunctionExpression: (parameters) =>
          DurationInMinutesFunctionExpression(parameters[0]),
    ),
    ExplicitFunctionExpressionFactory(
      name: 'durationInSeconds',
      parametersLength: 1,
      createFunctionExpression: (parameters) =>
          DurationInSecondsFunctionExpression(parameters[0]),
    ),
    ExplicitFunctionExpressionFactory(
      name: 'matches',
      parametersLength: 2,
      createFunctionExpression: (parameters) =>
          MatchesFunctionExpression(parameters[0], parameters[1]),
    ),
    ExplicitFunctionExpressionFactory(
      name: 'contains',
      parametersLength: 2,
      createFunctionExpression: (parameters) =>
          ContainsFunctionExpression(parameters[0], parameters[1]),
    ),
    ExplicitFunctionExpressionFactory(
      name: 'startsWith',
      parametersLength: 2,
      createFunctionExpression: (parameters) =>
          StartsWithFunctionExpression(parameters[0], parameters[1]),
    ),
    ExplicitFunctionExpressionFactory(
      name: 'endsWith',
      parametersLength: 2,
      createFunctionExpression: (parameters) =>
          EndsWithFunctionExpression(parameters[0], parameters[1]),
    ),
  ];
}
