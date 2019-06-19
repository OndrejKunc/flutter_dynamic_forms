Feature: Expression
  Tests an expression

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

  Scenario: it should compute with high precision
    When expression "2.000000000005 + 3.00000000000008" is evaluated
    Then decimal expression result is "5.00000000000508"

  Scenario: it should compute with high precision
    When expression "(3575.200041414144000092 + 125.350341415036689 - 1235.3023056544141)" is evaluated
    Then decimal expression result is "2465.248077174766589092"

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

  Scenario: it should throw NullReferenceException when given 6 + c
    When expression "6 + c" is evaluated
    Then "NullReferenceException" exception is thrown

  Scenario: it should treat dot separated floating point numbers as a valid input
    When expression "2.5" is evaluated
    Then decimal expression result is "2.5"

  Scenario: it should compute 1 when given 9 % 2
    When expression "9 % 2" is evaluated
    Then int expression result is "1"

  Scenario: it should compute 1.5 when given 10.5 % 3
    When expression "10.5 % 3" is evaluated
    Then decimal expression result is "1.5"

  Scenario: it should compute 3 when given 10 % 3.5
    When expression "10 % 3.5" is evaluated
    Then decimal expression result is "3.0"

  Scenario: it should compute 5 when given 50/10
    When expression "50/10" is evaluated
    Then int expression result is "5"

  Scenario: it should compute 2.5 when given 5.0/2
    When expression "5.0/2" is evaluated
    Then decimal expression result is "2.5"
  
  Scenario: it should compute 3 when given 7/2
    When expression "7/2" is evaluated
    Then int expression result is "3"

  Scenario: it should omit white spaces
    When expression "   12        -  8   " is evaluated
    Then int expression result is "4"

  Scenario: it should omit white spaces
    When expression "142        -9   " is evaluated
    Then int expression result is "133"

  Scenario: it should compute 19 when given 10+9
    When expression "10+9" is evaluated
    Then int expression result is "19"

  Scenario: it should compute 90 when given 10*9
    When expression "10*9" is evaluated
    Then int expression result is "90"

  Scenario: it should compute 90 when given 9 * 10
    When expression "9 * 10" is evaluated
    Then int expression result is "90"

  Scenario: it should compute -82 when given (1+(2-(3+(5*9-6))*2)-1)
    When expression "(1+(2-(3+(5*9-6))*2)-1)" is evaluated
    Then int expression result is "-82"

  Scenario: it should compute -1 when given 2 + (-3)
    When expression "2 + ( -3)" is evaluated
    Then int expression result is "-1"

  Scenario: it should compute 6 when given 2 * 3
    When expression "2 * 3" is evaluated
    Then int expression result is "6"

  Scenario: it should compute 89 when given 89
    When expression "89" is evaluated
    Then int expression result is "89"

  Scenario: it should omit white spaces
    When expression "72+  15" is evaluated
    Then int expression result is "87"

  Scenario: it should handle tight expressions
    When expression "67+2" is evaluated
    Then int expression result is "69"

  Scenario: it should calculate long additive expressions from left to right
    When expression "2 -4 +6 -1 -1- 0 +8" is evaluated
    Then int expression result is "10"

  Scenario: it should calculate long additive expressions from left to right
    When expression "1 -1   + 2   - 2   +  4 - 4 +    6" is evaluated
    Then int expression result is "6"


  Scenario: it should calculate long multiplicative expressions from left to right
    When expression "2 -4 +6 -1 -1- 0 +8" is evaluated
    Then int expression result is "10"

  Scenario: it should calculate long multiplicative expressions from left to right
    When expression "1 -1   + 2   - 2   +  4 - 4 +    6" is evaluated
    Then int expression result is "6"


  Scenario: it should compute 2 when given (2)
    When expression "(2)" is evaluated
    Then int expression result is "2"

  Scenario: it should compute complex expressions enclosed in parenthesis
    When expression "(5 + 2*3 - 1 + 7 * 8)" is evaluated
    Then int expression result is "66"

  Scenario: it should compute complex expressions enclosed in parenthesis
    When expression "(67 + 2 * 3 - 67 + 2/1 - 7)" is evaluated
    Then int expression result is "1"

  Scenario: it should handle nested parenthesis
    When expression "(((((5)))))" is evaluated
    Then int expression result is "5"

  Scenario: it should handle nested parenthesis
    When expression "(( ((2)) + 4))*((5))" is evaluated
    Then int expression result is "30"

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

  Scenario: it should compute -3 when given -5 + 2
    When expression " -5 + 2" is evaluated
    Then int expression result is "-3"

  Scenario: it should treat dot separated floating point numbers as a valid input
    When expression "4*2.5 + 8.5+1.5 / 3.0" is evaluated
    Then decimal expression result is "19"

  Scenario: it should handle tight expressions
    When expression "5*7 " is evaluated
    Then int expression result is "35"

  Scenario: it should handle tight expressions, result is negative number
    When expression " 2-7" is evaluated
    Then int expression result is "-5"

  Scenario: it should handle tight expressions
    When expression "8/4" is evaluated
    Then int expression result is "2"

  Scenario: it should compute expressions with many subexpressions enclosed in parenthesis
    When expression "(2) + (17*2-30) * (5)+2 - (8/2)*4" is evaluated
    Then int expression result is "8"

  Scenario: it should calculate long, mixed additive and multiplicative expressions from left to right
    When expression " 2*3 - 4*5 + 6/3 " is evaluated
    Then int expression result is "-12"

  Scenario: it should treat dot separated floating point numbers as a valid input
    When expression "5.0005 + 0.0095" is evaluated
    Then decimal expression result is "5.01"

#Scenario: it should calculate long, mixed additive and multiplicative expressions from left to right
#  When expression "2*3*4/8 -   5/2*4 +  6 + 0/3   " is evaluated
#  Then int expression result is "-1"
#actual 1, problem with a divide operation KOYAL-103

#Scenario: it should return Infinity when attempt to divide by zero occurs
#  When expression " 2 - 1 + 14/0 + 7" is evaluated
#  Then int expression result is "be_infinite"

#Scenario: it should solve an expression
#  When expression "(1 + 20 < 3*5) && false || (2 + 3*(4+21))  >= 15" is evaluated
#  Then bool expression result is true

#Scenario: resolve dependency
#  Given form element is provided
#  When expression "@formElement.value + 5" is evaluated
#  Then int expression result is "32"

#Scenario: resolve dependency
#   Given form element "testElement" is provided with values "label1:'abc';number1:123;bool2:true"
#   When expression "@testElement.label1 + 5" is evaluated
#   Then int expression result is "32"

#Scenario: it should return float pointing numbers when division result is not an integer
#    When expression "10/4" is evaluated
#    Then int expression result is "2.5"

# Scenario: it should calculate long, mixed additive and multiplicative expressions from left to right
#   When expression "2*3*4/8 -   5/2*4 +  6 + 0/3   " is evaluated
#   Then int expression result is "-1"
# actual 1

# Scenario: it should raise an error when input is empty
#  When expression "" is evaluated
#  Then int expression result is "ERROR"

# Scenario: it should return float pointing numbers when division result is not an integer
#  When expression "5/3" is evaluated
#  Then decimal expression result is "1.66"

#Scenario: it should return float pointing numbers when division result is not an integer
#  When expression "3 + 8/5 -1 -2*5" is evaluated
#  Then int expression result is "be_close(-6.4, 0.01)"

#Scenario: it should return Infinity when attempt to divide by zero occurs
#  When expression "5/0" is evaluated
#  Then int expression result is "be_infinite"
