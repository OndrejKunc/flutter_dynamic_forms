Feature: Expression
  Tests an expression

  Scenario: DurationInDays function test 1
    When expression "durationInDays(duration("P5D1H"))" is evaluated
    Then int expression result is "5"

  Scenario: DurationInDays function test 2
    When expression "durationInDays(duration("P3H"))" is evaluated
    Then int expression result is "0"

  Scenario: DurationInDays function test 3
    When expression "durationInDays(duration("P25H"))" is evaluated
    Then int expression result is "1"

  Scenario: DurationInHours function test 1
    When expression "durationInHours(duration("P5D1H"))" is evaluated
    Then int expression result is "121"

  Scenario: DurationInHours function test 2
    When expression "durationInHours(duration("P3H"))" is evaluated
    Then int expression result is "3"

  Scenario: DurationInHours function test 3
    When expression "durationInHours(duration("P8S"))" is evaluated
    Then int expression result is "0"

  Scenario: DurationInMinutes function test 1
    When expression "durationInMinutes(duration("P5H61S"))" is evaluated
    Then int expression result is "301"

  Scenario: DurationInMinutes function test 2
    When expression "durationInMinutes(duration("P3H"))" is evaluated
    Then int expression result is "180"

  Scenario: DurationInMinutes function test 3
    When expression "durationInMinutes(duration("P8S"))" is evaluated
    Then int expression result is "0"

  Scenario: DurationInSeconds function test 1
    When expression "durationInSeconds(duration("P5H61S"))" is evaluated
    Then int expression result is "18061"

  Scenario: DurationInSeconds function test 2
    When expression "durationInSeconds(duration("P3H"))" is evaluated
    Then int expression result is "10800"

  Scenario: DurationInSeconds function test 3
    When expression "durationInSeconds(duration("P8S"))" is evaluated
    Then int expression result is "8"

  Scenario: it should add Duration to DateTime
    When expression "dateTime("1997-07-16T19:20") + duration("P5D1H")" is evaluated
    Then DateTime expression result is "1997-07-21T20:20"

  Scenario: it should subtract Duration from DateTime
    When expression "dateTime("1997-07-16T19:20") - duration("P5D1H")" is evaluated
    Then DateTime expression result is "1997-07-11T18:20"

  Scenario: it should add Duration to Duration
    When expression "dateTime("1997-07-16T19:20") + (duration("P5D") + duration("P1D"))" is evaluated
    Then DateTime expression result is "1997-07-22T19:20"

  Scenario: it should subtract Duration from Duration
    When expression "dateTime("1997-07-16T19:20") + (duration("P5D") - duration("P1D"))" is evaluated
    Then DateTime expression result is "1997-07-20T19:20"

  Scenario: it should multiply Duration with Integer
    When expression "dateTime("1997-07-16T19:20") + (duration("P5D") * 2)" is evaluated
    Then DateTime expression result is "1997-07-26T19:20"

  Scenario: it should multiply Duration by Integer
    When expression "dateTime("1997-07-16T19:20") + (duration("P6D") / 3)" is evaluated
    Then DateTime expression result is "1997-07-18T19:20"

  Scenario: it should compare DateTimes - test 1
    When expression "dateTime("1997-07-16T19:20") < now()" is evaluated
    Then bool expression result is "true"

  Scenario: it should compare DateTimes - test 2
    When expression "dateTime("1997-07-16T19:20") > now()" is evaluated
    Then bool expression result is "false"

  Scenario: it should compare DateTimes - complex - test 4
    When expression "dateTime("1997-07-16T19:20") == (dateTime("1997-07-16T19:20") + duration("P1S"))" is evaluated
    Then bool expression result is "false"

  Scenario: it should compare DateTimes - complex - test 5
    When expression "dateTime("1997-07-16T19:20") <= (dateTime("1997-07-16T19:20") + duration("P1S"))" is evaluated
    Then bool expression result is "true"

  Scenario: it should compare Durations - test 1
    When expression "duration("P5D1H3S") > duration("P5D1H")" is evaluated
    Then bool expression result is "true"

  Scenario: it should compare Durations - test 2
    When expression "duration("P5D1H3S") == duration("P5D1H3S")" is evaluated
    Then bool expression result is "true"

  Scenario: it should compare Durations - test 3
    When expression "duration("P5D1H3S") == duration("P5D1H2S") + duration("P1S")" is evaluated
    Then bool expression result is "true"

  Scenario: it should compare Durations - test 4
    When expression "duration("P5D1H3S") >= duration("P5D1H3S") - duration("P1S")" is evaluated
    Then bool expression result is "true"

  Scenario: Not equal operator
    When expression "3 != 2" is evaluated
    Then bool expression result is "true"

  Scenario: DateTime constructor test
    When expression "dateTime("1997-07-16T19:20")" is evaluated
    Then DateTime expression result is "1997-07-16T19:20"

  Scenario: rounding test 1 - string rounding mode
    When expression "round(13.5,0,"nearestEven")" is evaluated
    Then decimal expression result is "14"

  Scenario: rounding test 2 - string rounding mode
    When expression "round(13.5,0,"nearestFromZero")" is evaluated
    Then decimal expression result is "14"

  Scenario: rounding test 3 - string rounding mode
    When expression "round(13.5,0,"towardsZero")" is evaluated
    Then decimal expression result is "13"

  Scenario: rounding test 4 - string rounding mode
    When expression "round(13.5,0,"fromZero")" is evaluated
    Then decimal expression result is "14"

  Scenario: rounding test 5 - string rounding mode
    When expression "round(13.5,0,"up")" is evaluated
    Then decimal expression result is "14"

  Scenario: rounding test 6 - string rounding mode
    When expression "round(13.5,0,"down")" is evaluated
    Then decimal expression result is "13"

  Scenario: rounding test - no rounding mode
    When expression "round(13.5,0)" is evaluated
    Then decimal expression result is "14"

  Scenario: rounding test - negative precision
    When expression "round(13235.5,-2)" is evaluated
    Then int expression result is "13200"

  Scenario: rounding test - negative precision - tie
    When expression "round(-13250.5,-2)" is evaluated
    Then int expression result is "-13300"

  Scenario: rounding test - negative precision - tie
    When expression "round(13250.5,-2)" is evaluated
    Then int expression result is "13300"

  Scenario: rounding test 1 - rounding to nearest, ties to even
    When expression "round(11.5,0,"nearestEven")" is evaluated
    Then decimal expression result is "12"

  Scenario: rounding test 2 - rounding to nearest, ties to even
    When expression "round(12.5,0,"nearestEven")" is evaluated
    Then decimal expression result is "12"

  Scenario: rounding test 3 - rounding to nearest, ties to even
    When expression "round(-11.5,0,"nearestEven")" is evaluated
    Then decimal expression result is "-12"

  Scenario: rounding test 4 - rounding to nearest, ties to even
    When expression "round(-12.5,0,"nearestEven")" is evaluated
    Then decimal expression result is "-12"

  Scenario: rounding test 5 - rounding to nearest, ties to even - higher precision
    When expression "round(-12.54855,4,"nearestEven")" is evaluated
    Then decimal expression result is "-12.5486"

  Scenario: rounding test 6 - rounding to nearest, ties to even - higher precision
    When expression "round(-12.54865,4,"nearestEven")" is evaluated
    Then decimal expression result is "-12.5486"

  Scenario: rounding test 7 - rounding to nearest, ties to even - higher precision
    When expression "round(12.54855,4,"nearestEven")" is evaluated
    Then decimal expression result is "12.5486"

  Scenario: rounding test 8 - rounding to nearest, ties to even - higher precision
    When expression "round(12.54855,4,"nearestEven")" is evaluated
    Then decimal expression result is "12.5486"

  Scenario: rounding test 1 - rounding to nearest, ties to odd
    When expression "round(11.5,0,"nearestOdd")" is evaluated
    Then decimal expression result is "11"

  Scenario: rounding test 2 - rounding to nearest, ties to odd
    When expression "round(12.5,0,"nearestOdd")" is evaluated
    Then decimal expression result is "13"

  Scenario: rounding test 3 - rounding to nearest, ties to odd
    When expression "round(-11.5,0,"nearestOdd")" is evaluated
    Then decimal expression result is "-11"

  Scenario: rounding test 4 - rounding to nearest, ties to odd
    When expression "round(-12.5,0,"nearestOdd")" is evaluated
    Then decimal expression result is "-13"

  Scenario: rounding test 5 - rounding to nearest, ties to odd - higher precision
    When expression "round(-12.54855,4,"nearestOdd")" is evaluated
    Then decimal expression result is "-12.5485"

  Scenario: rounding test 6 - rounding to nearest, ties to odd - higher precision
    When expression "round(-12.54865,4,"nearestOdd")" is evaluated
    Then decimal expression result is "-12.5487"

  Scenario: rounding test 7 - rounding to nearest, ties to odd - higher precision
    When expression "round(12.54855,4,"nearestOdd")" is evaluated
    Then decimal expression result is "12.5485"

  Scenario: rounding test 8 - rounding to nearest, ties to odd - higher precision
    When expression "round(12.54855,4,"nearestOdd")" is evaluated
    Then decimal expression result is "12.5485"

  Scenario: rounding test 1 - rounding to nearest, ties away from zero
    When expression "round(11.5,0,"nearestFromZero")" is evaluated
    Then decimal expression result is "12"

  Scenario: rounding test 2 - rounding to nearest, ties away from zero
    When expression "round(12.5,0,"nearestFromZero")" is evaluated
    Then decimal expression result is "13"

  Scenario: rounding test 3 - rounding to nearest, ties away from zero
    When expression "round(-11.5,0,"nearestFromZero")" is evaluated
    Then decimal expression result is "-12"

  Scenario: rounding test 4 - rounding to nearest, ties away from zero
    When expression "round(-12.5,0,"nearestFromZero")" is evaluated
    Then decimal expression result is "-13"

  Scenario: rounding test 5 - rounding to nearest, ties away from zero - higher precision
    When expression "round(-12.54855,4,"nearestFromZero")" is evaluated
    Then decimal expression result is "-12.5486"

  Scenario: rounding test 6 - rounding to nearest, ties away from zero - higher precision
    When expression "round(-12.54865,4,"nearestFromZero")" is evaluated
    Then decimal expression result is "-12.5487"

  Scenario: rounding test 7 - rounding to nearest, ties away from zero - higher precision
    When expression "round(12.54855,4,"nearestFromZero")" is evaluated
    Then decimal expression result is "12.5486"

  Scenario: rounding test 8 - rounding to nearest, ties away from zero - higher precision
    When expression "round(12.54865,4,"nearestFromZero")" is evaluated
    Then decimal expression result is "12.5487"

  Scenario: rounding test 1 - rounding nearest downward
    When expression "round(11.5,0,"nearestDownward")" is evaluated
    Then decimal expression result is "11"

  Scenario: rounding test 2 - rounding nearest downward
    When expression "round(12.5,0,"nearestDownward")" is evaluated
    Then decimal expression result is "12"

  Scenario: rounding test 3 - rounding nearest downward
    When expression "round(-11.5,0,"nearestDownward")" is evaluated
    Then decimal expression result is "-12"

  Scenario: rounding test 4 - rounding nearest downward
    When expression "round(-12.5,0,"nearestDownward")" is evaluated
    Then decimal expression result is "-13"

  Scenario: rounding test 5 - rounding nearest downward - higher precision
    When expression "round(-12.54855,4,"nearestDownward")" is evaluated
    Then decimal expression result is "-12.5486"

  Scenario: rounding test 6 - rounding nearest downward - higher precision
    When expression "round(-12.54865,4,"nearestDownward")" is evaluated
    Then decimal expression result is "-12.5487"

  Scenario: rounding test 7 - rounding nearest downward - higher precision
    When expression "round(12.54855,4,"nearestDownward")" is evaluated
    Then decimal expression result is "12.5485"

  Scenario: rounding test 8 - rounding nearest downward - higher precision
    When expression "round(12.54865,4,"nearestDownward")" is evaluated
    Then decimal expression result is "12.5486"

  Scenario: rounding test 1 - rounding nearest upward
    When expression "round(11.5,0,"nearestUpward")" is evaluated
    Then decimal expression result is "12"

  Scenario: rounding test 2 - rounding nearest upward
    When expression "round(12.5,0,"nearestUpward")" is evaluated
    Then decimal expression result is "13"

  Scenario: rounding test 3 - rounding nearest upward
    When expression "round(-11.5,0,"nearestUpward")" is evaluated
    Then decimal expression result is "-11"

  Scenario: rounding test 4 - rounding nearest upward
    When expression "round(-12.5,0,"nearestUpward")" is evaluated
    Then decimal expression result is "-12"

  Scenario: rounding test 5 - rounding nearest upward - higher precision
    When expression "round(-12.54855,4,"nearestUpward")" is evaluated
    Then decimal expression result is "-12.5485"

  Scenario: rounding test 6 - rounding nearest upward - higher precision
    When expression "round(-12.54865,4,"nearestUpward")" is evaluated
    Then decimal expression result is "-12.5486"

  Scenario: rounding test 7 - rounding nearest upward - higher precision
    When expression "round(12.54855,4,"nearestUpward")" is evaluated
    Then decimal expression result is "12.5486"

  Scenario: rounding test 8 - rounding nearest upward - higher precision
    When expression "round(12.54865,4,"nearestUpward")" is evaluated
    Then decimal expression result is "12.5487"

  Scenario: rounding test 1 - rounding nearest to zero
    When expression "round(11.5,0,"nearestToZero")" is evaluated
    Then decimal expression result is "11"

  Scenario: rounding test 2 - rounding nearest to zero
    When expression "round(12.5,0,"nearestToZero")" is evaluated
    Then decimal expression result is "12"

  Scenario: rounding test 3 - rounding nearest to zero
    When expression "round(-11.5,0,"nearestToZero")" is evaluated
    Then decimal expression result is "-11"

  Scenario: rounding test 4 - rounding nearest to zero
    When expression "round(-12.5,0,"nearestToZero")" is evaluated
    Then decimal expression result is "-12"

  Scenario: rounding test 5 - rounding nearest to zero - higher precision
    When expression "round(-12.54855,4,"nearestToZero")" is evaluated
    Then decimal expression result is "-12.5485"

  Scenario: rounding test 6 - rounding nearest to zero - higher precision
    When expression "round(-12.54865,4,"nearestToZero")" is evaluated
    Then decimal expression result is "-12.5486"

  Scenario: rounding test 7 - rounding nearest to zero - higher precision
    When expression "round(12.54855,4,"nearestToZero")" is evaluated
    Then decimal expression result is "12.5485"

  Scenario: rounding test 8 - rounding nearest to zero - higher precision
    When expression "round(12.54865,4,"nearestToZero")" is evaluated
    Then decimal expression result is "12.5486"

  Scenario: rounding test 1 - rounding towards zero
    When expression "round(11.5,0,"towardsZero")" is evaluated
    Then decimal expression result is "11"

  Scenario: rounding test 2 - rounding towards zero
    When expression "round(12.5,0,"towardsZero")" is evaluated
    Then decimal expression result is "12"

  Scenario: rounding test 3 - rounding towards zero
    When expression "round(-11.5,0,"towardsZero")" is evaluated
    Then decimal expression result is "-11"

  Scenario: rounding test 4 - rounding towards zero
    When expression "round(-12.5,0,"towardsZero")" is evaluated
    Then decimal expression result is "-12"

  Scenario: rounding test 5 - rounding towards zero - higher precision
    When expression "round(-12.54855,4,"towardsZero")" is evaluated
    Then decimal expression result is "-12.5485"

  Scenario: rounding test 6 - rounding towards zero - higher precision
    When expression "round(-12.54865,4,"towardsZero")" is evaluated
    Then decimal expression result is "-12.5486"

  Scenario: rounding test 7 - rounding towards zero - higher precision
    When expression "round(12.54855,4,"towardsZero")" is evaluated
    Then decimal expression result is "12.5485"

  Scenario: rounding test 8 - rounding towards zero - higher precision
    When expression "round(12.54855,4,"towardsZero")" is evaluated
    Then decimal expression result is "12.5485"

  Scenario: rounding test 1 - rounding from zero
    When expression "round(11.5,0,"fromZero")" is evaluated
    Then decimal expression result is "12"

  Scenario: rounding test 2 - rounding from zero
    When expression "round(12.5,0,"fromZero")" is evaluated
    Then decimal expression result is "13"

  Scenario: rounding test 3 - rounding from zero
    When expression "round(-11.5,0,"fromZero")" is evaluated
    Then decimal expression result is "-12"

  Scenario: rounding test 4 - rounding from zero
    When expression "round(-12.5,0,"fromZero")" is evaluated
    Then decimal expression result is "-13"

  Scenario: rounding test 5 - rounding from zero - higher precision
    When expression "round(-12.54855,4,"fromZero")" is evaluated
    Then decimal expression result is "-12.5486"

  Scenario: rounding test 6 - rounding from zero - higher precision
    When expression "round(-12.54865,4,"fromZero")" is evaluated
    Then decimal expression result is "-12.5487"

  Scenario: rounding test 7 - rounding from zero - higher precision
    When expression "round(12.54855,4,"fromZero")" is evaluated
    Then decimal expression result is "12.5486"

  Scenario: rounding test 8 - rounding from zero - higher precision
    When expression "round(12.54855,4,"fromZero")" is evaluated
    Then decimal expression result is "12.5486"

  Scenario: rounding test 1 - rounding up
    When expression "round(11.5,0,"up")" is evaluated
    Then decimal expression result is "12"

  Scenario: rounding test 2 - rounding up
    When expression "round(12.5,0,"up")" is evaluated
    Then decimal expression result is "13"

  Scenario: rounding test 3 - rounding up
    When expression "round(-11.5,0,"up")" is evaluated
    Then decimal expression result is "-11"

  Scenario: rounding test 4 - rounding up
    When expression "round(-12.5,0,"up")" is evaluated
    Then decimal expression result is "-12"

  Scenario: rounding test 5 - rounding up - higher precision
    When expression "round(-12.54855,4,"up")" is evaluated
    Then decimal expression result is "-12.5485"

  Scenario: rounding test 6 - rounding up - higher precision
    When expression "round(-12.54865,4,"up")" is evaluated
    Then decimal expression result is "-12.5486"

  Scenario: rounding test 7 - rounding up - higher precision
    When expression "round(12.54855,4,"up")" is evaluated
    Then decimal expression result is "12.5486"

  Scenario: rounding test 8 - rounding up - higher precision
    When expression "round(12.54855,4,"up")" is evaluated
    Then decimal expression result is "12.5486"

  Scenario: rounding test 1 - rounding down
    When expression "round(11.5,0,"down")" is evaluated
    Then decimal expression result is "11"

  Scenario: rounding test 2 - rounding down
    When expression "round(12.5,0,"down")" is evaluated
    Then decimal expression result is "12"

  Scenario: rounding test 3 - rounding down
    When expression "round(-11.5,0,"down")" is evaluated
    Then decimal expression result is "-12"

  Scenario: rounding test 4 - rounding down
    When expression "round(-12.5,0,"down")" is evaluated
    Then decimal expression result is "-13"

  Scenario: rounding test 5 - rounding down - higher precision
    When expression "round(-12.54855,4,"down")" is evaluated
    Then decimal expression result is "-12.5486"

  Scenario: rounding test 6 - rounding down - higher precision
    When expression "round(-12.54865,4,"down")" is evaluated
    Then decimal expression result is "-12.5487"

  Scenario: rounding test 7 - rounding down - higher precision
    When expression "round(12.54855,4,"down")" is evaluated
    Then decimal expression result is "12.5485"

  Scenario: rounding test 8 - rounding down - higher precision
    When expression "round(12.54855,4,"down")" is evaluated
    Then decimal expression result is "12.5485"

  Scenario: it should solve an mixed expression
    When expression "5.00000000000001 > 5 && 4.00 <= 4" is evaluated
    Then bool expression result is "true"

  Scenario: it should treat dot separated floating point numbers as a valid input
    When expression "5.0005 + 0.0095" is evaluated
    Then decimal expression result is "5.01"

  Scenario: it should treat dot separated floating point numbers as a valid input
    When expression "5.005 + 0.095" is evaluated
    Then decimal expression result is "5.1"

  Scenario: it should compute expressions with many subexpressions enclosed in parenthesis
    When expression "(5*7/5) + (23) - 5 * (98-4)/(6*7-42)" is evaluated
    Then "DivideByZeroException" exception is thrown

  Scenario: it should raise an error on unbalanced parenthesis
    When expression "2 + (5 * 2" is evaluated
    Then "InvalidSyntaxException" exception is thrown

  Scenario: it should raise an error on unbalanced parenthesis
    When expression "(((((4))))" is evaluated
    Then "InvalidSyntaxException" exception is thrown

  Scenario: it should raise an error on unbalanced parenthesis
    When expression "((2)) * ((3" is evaluated
    Then "InvalidSyntaxException" exception is thrown

  Scenario: it should raise an error on unbalanced parenthesis
    When expression "((9)) * ((1)" is evaluated
    Then "InvalidSyntaxException" exception is thrown

  Scenario: it should throw InvalidSyntaxException on wrong syntax
    When expression "  %" is evaluated
    Then "InvalidSyntaxException" exception is thrown

  Scenario: it should throw InvalidSyntaxException on wrong syntax
    When expression " 5 + + 6" is evaluated
    Then "InvalidSyntaxException" exception is thrown

  Scenario: it should throw DivideByZeroException when a number is divided by zero
    When expression "3 + 8*(2*(7/(5-5)))" is evaluated
    Then "DivideByZeroException" exception is thrown

  Scenario: it should throw InvalidSyntaxException on wrong syntax
    When expression "7 & 2" is evaluated
    Then "InvalidSyntaxException" exception is thrown

  Scenario: it should throw InvalidSyntaxException on unbalanced parenthesis
    When expression "7 + (3*2-(2+8)" is evaluated
    Then "InvalidSyntaxException" exception is thrown

  Scenario: resolve dependency @testElement.value - default
    Given form element is provided
    When expression "@testElement + 5" is evaluated
    Then int expression result is "32"

  Scenario: resolve dependency @testElement.value
    Given form element is provided
    When expression "@testElement.value + 5" is evaluated
    Then int expression result is "32"

  Scenario: resolve dependency
    Given form element is provided
    When expression "length(@testElement.label) + 5" is evaluated
    Then int expression result is "14"

  Scenario: resolve dependency
    Given form element is provided
    When expression "length(@testElement.label) - 5" is evaluated
    Then int expression result is "4"

  Scenario: resolve dependency with null
    Given form element is provided
    When expression "isNull(@testElement.nullLabel)" is evaluated
    Then bool expression result is "true"

  Scenario: resolve dependency with isNullOrEmpty null check
    Given form element is provided
    When expression "isNullOrEmpty(@testElement.nullLabel)" is evaluated
    Then bool expression result is "true"

  Scenario: resolve dependency with isNullOrEmpty empty check
    Given form element is provided
    When expression "isNullOrEmpty(@testElement.emptyLabel)" is evaluated
    Then bool expression result is "true"

  Scenario: resolve int dependency
    Given form element is provided
    When expression "@testElement.intValue - 5" is evaluated
    Then int expression result is "9"

  Scenario: resolve dateTime dependency
    Given form element is provided
    When expression "!isNull(@testElement.dateValue)" is evaluated
    Then bool expression result is "true"

  Scenario: resolve double dependency
    Given form element is provided
    When expression "1.5 + @testElement.doubleValue" is evaluated
    Then decimal expression result is "8"

  Scenario: it should match string with dot
    When expression ""a \."" is evaluated
    Then string expression result is "a \."

  Scenario: it should match string with special characters
    When expression ""a @ \\ \@ . \."" is evaluated
    Then string expression result is "a @ \\ \@ . \."

  Scenario: it should calculate correct simple regular expression
    When expression "matches("test@email.com","test@email.com")" is evaluated
    Then bool expression result is "true"

  Scenario: it should calculate wrong simple regular expression
    When expression "matches("test@email.com","test@email2.com")" is evaluated
    Then bool expression result is "false"

  Scenario: it should match simple string
    When expression ""abcdef 123"" is evaluated
    Then string expression result is "abcdef 123"

  Scenario: it should calculate complex regular expression
    When expression "matches("test@email.com","^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$")" is evaluated
    Then bool expression result is "true"

  Scenario: it should match valid contains
    When expression "contains("first second third", "second t")" is evaluated
    Then bool expression result is "true"

  Scenario: it should not match invalid contains
    When expression "contains("first second third", "fourth")" is evaluated
    Then bool expression result is "false"

  Scenario: it should match valid startsWith
    When expression "startsWith("first second third", "first")" is evaluated
    Then bool expression result is "true"

  Scenario: it should not match invalid startsWith
    When expression "startsWith("first second third", "second")" is evaluated
    Then bool expression result is "false"

  Scenario: it should match valid endsWith
    When expression "endsWith("first second third", "third")" is evaluated
    Then bool expression result is "true"

  Scenario: it should not match invalid endsWith
    When expression "endsWith("first second third", "second")" is evaluated
    Then bool expression result is "false"

  Scenario: String concatenation
    When expression ""ab" + "cd"" is evaluated
    Then string expression result is "abcd"

  Scenario: Nullable int
    Given form element is provided
    When expression "@testElement.nullableIntValue! - 5" is evaluated
    Then int expression result is "9"

  Scenario: Nullable integer
    Given form element is provided
    When expression "@testElement.nullableIntegerValue! - 5" is evaluated
    Then int expression result is "22"

  Scenario: Nullable bool
    Given form element is provided
    When expression "@testElement.nullableBoolValue!" is evaluated
    Then bool expression result is "true"

  Scenario: Nullable double
    Given form element is provided
    When expression "@testElement.nullableDoubleValue! + 3" is evaluated
    Then decimal expression result is "9.5"

  Scenario: Negate Nullable bool
    Given form element is provided
    When expression "!@testElement.nullableBoolValue!" is evaluated
    Then bool expression result is "false"

  Scenario: Nullable Decimal
    Given form element is provided
    When expression "@testElement.nullableDecimalValue! + 3" is evaluated
    Then decimal expression result is "9.5"

  Scenario: Nullable DateTime
    Given form element is provided
    When expression "!isNull(@testElement.nullableDateValue!)" is evaluated
    Then bool expression result is "true"

  Scenario: Null integer
    Given form element is provided
    When expression "isNull(@testElement.nullIntegerValue)" is evaluated
    Then bool expression result is "true"

  Scenario: Null reference exception
    Given form element is provided
    When expression "@testElement.nullIntegerValue! + 5" is evaluated
    Then "NullReferenceException" exception is thrown

  Scenario: Resolve underscore reference
    Given form element is provided
    When expression "@testElement.underscore_name + 5" is evaluated
    Then int expression result is "15"
    
  Scenario: Resolve underscore identifier
    Given form element is provided
    When expression "@underscore_test_element.underscore_name + 5" is evaluated
    Then int expression result is "15"