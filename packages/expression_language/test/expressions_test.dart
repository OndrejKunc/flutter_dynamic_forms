import 'dart:async';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'supporting_files/hooks/hook_example.dart';
import 'supporting_files/steps/when_then_expression_num.dart';

void main() async {
  final config = TestConfiguration()
    ..features = [Glob(r"test/features/**.feature")]
    ..exitAfterTestRun = false
    ..reporters = [
      StdoutReporter(MessageLevel.error),
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: 'test/report.json')
    ]
    ..hooks = [HookExample()]
    ..createWorld = (TestConfiguration config) {
      return Future.value(ExpressionWorld());
    }
    ..stepDefinitions = [
      GivenFormElementIsProvided(),
      WhenExpressionIsEvaluated(),
      ThenIntExpressionResult(),
      ThenStringExpressionResult(),
      ThenDecimalExpressionResult(),
      ThenBoolExpressionResult(),
      ThenExceptionThrownResult(),
      ThenDateTimeExpressionResult(),
    ];

  var runner = GherkinRunner();
  await runner.execute(config);
}
