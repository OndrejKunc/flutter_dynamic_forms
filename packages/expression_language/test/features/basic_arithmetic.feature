Feature: Basic Arithmetic
    Tests using basic arithmetic operations

    Scenario Outline: Evaluate int expression
        When expression "<expression>" is evaluated
        Then int expression result is "<result>"
        Examples:
            | expression                         | result |
            | 9 % 2                              | 1      |
            | 5.0 ~/ 2                           | 2      |
            | 50/10                              | 5      |
            | 12        -  8                     | 4      |
            | 10+9                               | 19     |
            | 10*9                               | 90     |
            | 9*10                               | 90     |
            | (1+(2-(3+(5*9-6))*2)-1)            | -82    |
            | 2 + ( -3)                          | -1     |
            | 2 * 3                              | 6      |
            | 89                                 | 89     |
            | 9*10                               | 90     |
            | 2 -4 +6 -1 -1- 0 +8                | 10     |
            | 1 -1   + 2   - 2   +  4 - 4 +    6 | 6      |
            | (2)                                | 2      |
            | (((((5)))))                        | 5      |
            | (( ((2)) + 4))*((5))               | 30     |
            | (2) + (17*2-30) * (5)+2 - (8/2)*4  | 8      |
            | 2*3 - 4*5 + 6/3                    | -12    |

    Scenario Outline: Evaluate decimal expression
        When expression "<expression>" is evaluated
        Then decimal expression result is "<result>"
        Examples:
            | expression                                                           | result                  |
            | 2.5                                                                  | 2.5                     |
            | 10.5 % 3                                                             | 1.5                     |
            | 10 % 3.5                                                             | 3.0                     |
            | 5/2                                                                  | 2.5                     |
            | 10 % 3.5                                                             | 3.0                     |
            | 4*2.5 + 8.5+1.5 / 3.0                                                | 19                      |
            | 5.0005 + 0.0095                                                      | 5.01                    |
            | 2.000000000005 + 3.00000000000008                                    | 5.00000000000508        |
            | (3575.200041414144000092 + 125.350341415036689 - 1235.3023056544141) | 2465.248077174766589092 |
