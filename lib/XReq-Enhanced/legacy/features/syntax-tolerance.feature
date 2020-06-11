Feature: Scenario Tolerance 
  In order to write scenarios that accept tolerances
  As a feature writer
  I want xreq to support tolerance in steps

  Background:
    Given xreq is in the PATH
    And I am in the xreq directory

  Scenario: Successfull Integer Comparison - Positive Expected
    Given a file "features/data/tmp-tolerance.feature":
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left |
            |  12   |  5  | 7~1  |
            |  12   |  6  | 7~1  |
            |  12   |  4  | 7~1  |

      """
    When I run xreq -m -x suite features/data/tmp-tolerance.feature
    Then it should pass
    When I run the test suite "./suite" in features/data/tests
    Then it should pass with
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left |
            | 12    | 5   | 7~1  |
            | 12    | 6   | 7~1  |
            | 12    | 4   | 7~1  |

      3 scenarios (3 passed)
      9 steps (9 passed)

      """

  Scenario: Successfull Integer Comparison - Negative Expected
    Given a file "features/data/tmp-tolerance1.feature":
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start   | eat  | left    |
            |  3      |  5   | -2~1    |
            |  3      |  6   | -2~1    |
            |  3      |  4   | -2~1    |
      """
    When I run xreq -m -x suite features/data/tmp-tolerance1.feature
    Then it should pass
    When I run the test suite "./suite" in features/data/tests
    Then it should pass with
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left |
            | 3     | 5   | -2~1 |
            | 3     | 6   | -2~1 |
            | 3     | 4   | -2~1 |

      3 scenarios (3 passed)
      9 steps (9 passed)

      """

  Scenario: Successfull Integer Comparison - Zero Expected
    Given a file "features/data/tmp-tolerance2.feature":
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left |
            | 12    | 11  | 0~1  |
            | 12    | 12  | 0~1  |
            | 12    | 13  | 0~1  |
      """
    When I run xreq -m -x suite features/data/tmp-tolerance2.feature
    Then it should pass
    When I run the test suite "./suite" in features/data/tests
    Then it should pass with
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left |
            | 12    | 11  | 0~1  |
            | 12    | 12  | 0~1  |
            | 12    | 13  | 0~1  |

      3 scenarios (3 passed)
      9 steps (9 passed)

      """

  Scenario: Successfull Integer Comparison - Maximum and Minimum Expected 
    Given a file "features/data/tmp-tolerance3.feature":
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start       | eat  | left          |
            | 2147483647  |  0   |  2147483647~1 |
            | -2147483648 |  0   | -2147483648~1 |

      """
    When I run xreq -m -x suite features/data/tmp-tolerance3.feature
    Then it should pass
    When I run the test suite "./suite" in features/data/tests
    Then it should pass with
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start       | eat | left          |
            | 2147483647  | 0   | 2147483647~1  |
            | -2147483648 | 0   | -2147483648~1 |

      2 scenarios (2 passed)
      6 steps (6 passed)

      """

  Scenario: Successfull Integer Comparison - Max Tolerance 
    Given a file "features/data/tmp-tolerance4.feature":
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left         |
            | 12    | 11  | 0~2147483647 |
            | 12    | 12  | 0~2147483647 |
            | 12    | 13  | 0~2147483647 |

      """
    When I run xreq -m -x suite features/data/tmp-tolerance4.feature
    Then it should pass
    When I run the test suite "./suite" in features/data/tests
    Then it should pass with
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left         |
            | 12    | 11  | 0~2147483647 |
            | 12    | 12  | 0~2147483647 |
            | 12    | 13  | 0~2147483647 |

      3 scenarios (3 passed)
      9 steps (9 passed)

      """

  Scenario: Successfull Integer Comparison - Null Tolerance 
    Given a file "features/data/tmp-tolerance5.feature":
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left |
            |  12   |  5  | 7~0  |
            |  12   |  6  | 6~0  |
            |  12   |  4  | 8~0  |

      """
    When I run xreq -m -x suite features/data/tmp-tolerance5.feature
    Then it should pass
    When I run the test suite "./suite" in features/data/tests
    Then it should pass with
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left |
            | 12    | 5   | 7~0  |
            | 12    | 6   | 6~0  |
            | 12    | 4   | 8~0  |

      3 scenarios (3 passed)
      9 steps (9 passed)

      """

  Scenario: Failed Integer Comparison - Smaller than lower bound 
    Given a file "features/data/tmp-tolerance6.feature":
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left |
            |  12   |  7  | 7~1  |

      """
    When I run xreq -m -x suite features/data/tmp-tolerance6.feature
    Then it should pass
    When I run the test suite "./suite" in features/data/tests
    Then it should fail 

  Scenario: Failed Integer Comparison - Greater than upper bound 
    Given a file "features/data/tmp-tolerance7.feature":
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left |
            |  12   |  3  | 7~1  |

      """
    When I run xreq -m -x suite features/data/tmp-tolerance7.feature
    Then it should pass
    When I run the test suite "./suite" in features/data/tests
    Then it should fail 

  Scenario: Failed Integer Comparison - Tolerance is negative 
    Given a file "features/data/tmp-tolerance8.feature":
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left |
            |  12   |  3  | 7~-1 |

      """
    When I run xreq -m -x suite features/data/tmp-tolerance8.feature
    Then it should pass
    When I run the test suite "./suite" in features/data/tests
    Then it should fail 

  Scenario: Failed Integer Comparison - Tolerance is Integer'First 
    Given a file "features/data/tmp-tolerance9.feature":
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left          |
            |  12   |  3  | 7~-2147483648 |

      """
    When I run xreq -m -x suite features/data/tmp-tolerance9.feature
    Then it should pass
    When I run the test suite "./suite" in features/data/tests
    Then it should fail 

