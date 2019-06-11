import 'package:gherkin/gherkin.dart';

class HookExample extends Hook {
  /// The priority to assign to this hook.
  /// Higher priority gets run first so a priority of 10 is run before a priority of 2
  @override
  int get priority => 1;

  /// Run before any scenario in a test run have executed
  @override
  Future<void> onBeforeRun(TestConfiguration config) async {
  }

  /// Run after all scenarios in a test run have completed
  @override
  Future<void> onAfterRun(TestConfiguration config) async {
  }

  /// Run before a scenario and it steps are executed
  @override
  Future<void> onBeforeScenario(
      TestConfiguration config, String scenario) async {
  }

  /// Run after a scenario has executed
  @override
  Future<void> onAfterScenario(
      TestConfiguration config, String scenario) async {
  }
}
