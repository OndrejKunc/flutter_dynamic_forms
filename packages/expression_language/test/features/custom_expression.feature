Feature: Custom Expression
  Tests Cusotm expression

  Scenario: Custom Expression Test
    Given custom expression is provided
    When expression ""ab" + testExpression("cd","ef")" is evaluated
    Then string expression result is "abcdef"