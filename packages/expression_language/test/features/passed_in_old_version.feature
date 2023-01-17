Feature: Expression
  Tests an expression

  Scenario: Negate Nullable bool
    Given form element is provided
    When expression "!@testElement.nullableBoolValue!" is evaluated
    Then bool expression result is "false"
