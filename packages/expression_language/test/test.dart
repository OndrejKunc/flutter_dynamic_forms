import 'dart:async';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'supporting_files/hooks/hook_example.dart';
import 'supporting_files/steps/when_then_expression_num.dart';

Future<void> main() {
  final config = TestConfiguration()
    ..features = [Glob(r"features/**.feature")]
    ..reporters = [
      StdoutReporter(MessageLevel.error),
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json')
    ]
    ..hooks = [HookExample()]
   
    ..createWorld = (TestConfiguration config) {
      return Future.value(ExpressionWorld());
    }
    ..stepDefinitions = [
      GivenFormElementIsProvided(),
      WhenExpressionIsEvaluated(),
      ThenIntExpressionResult(),
      ThenDecimalExpressionResult(),
      ThenBoolExpressionResult(), 
      ThenExceptionThrownResult()
    ]
    ..exitAfterTestRun = true;

  return GherkinRunner().execute(config);
}
