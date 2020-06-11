Feature: Scenario Relative Tolerance 
  In order to write scenarios that accept relative tolerances
  As a feature writer
  I want xreq to support relative tolerance in steps

  Background:
    Given xreq is in the PATH
    And I am in the xreq directory

  Scenario: Successfull Integer Comparison - Positive Expected
    Given a file "features/data/tmp-relative-tolerance.feature":
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left  |
            |  48   |  0  | 50~4% |
            |  49   |  0  | 50~4% |
            |  50   |  0  | 50~4% |
            |  51   |  0  | 50~4% |
            |  52   |  0  | 50~4% |

      """
    When I run xreq -m -x suite features/data/tmp-relative-tolerance.feature
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
            | start | eat | left  |
            | 48    | 0   | 50~4% |
            | 49    | 0   | 50~4% |
            | 50    | 0   | 50~4% |
            | 51    | 0   | 50~4% |
            | 52    | 0   | 50~4% |

      5 scenarios (5 passed)
      15 steps (15 passed)

      """

  Scenario: Successfull Integer Comparison - Negative Expected
    Given a file "features/data/tmp-relative-tolerance1.feature":
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left   |
            | -48   | 0   | -50~4% |
            | -49   | 0   | -50~4% |
            | -50   | 0   | -50~4% |
            | -51   | 0   | -50~4% |
            | -52   | 0   | -50~4% |
      """
    When I run xreq -m -x suite features/data/tmp-relative-tolerance1.feature
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
            | start | eat | left   |
            | -48   | 0   | -50~4% |
            | -49   | 0   | -50~4% |
            | -50   | 0   | -50~4% |
            | -51   | 0   | -50~4% |
            | -52   | 0   | -50~4% |

      5 scenarios (5 passed)
      15 steps (15 passed)

      """

  Scenario: Successfull Integer Comparison - Zero Expected
    Given a file "features/data/tmp-relative-tolerance2.feature":
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left |
            | 12    | 12  | 0~9% |
      """
    When I run xreq -m -x suite features/data/tmp-relative-tolerance2.feature
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
            | 12    | 12  | 0~9% |

      1 scenario (1 passed)
      3 steps (3 passed)

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
            | start       | eat  | left           |
            | 2147483647  |  0   | 2147483647~1%  |
            | -2147483648 |  0   | -2147483648~1% |

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
            | start       | eat | left           |
            | 2147483647  | 0   | 2147483647~1%  |
            | -2147483648 | 0   | -2147483648~1% |

      2 scenarios (2 passed)
      6 steps (6 passed)

      """

  Scenario: Successfull Integer Comparison - Max Tolerance 
    Given a file "features/data/tmp-relative-tolerance4.feature":
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left   |
            | 12    | 8   | 2~100% |
            | 12    | 9   | 2~100% |
            | 12    | 10  | 2~100% |
            | 12    | 11  | 2~100% |
            | 12    | 12  | 2~100% |

      """
    When I run xreq -m -x suite features/data/tmp-relative-tolerance4.feature
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
            | start | eat | left   |
            | 12    | 8   | 2~100% |
            | 12    | 9   | 2~100% |
            | 12    | 10  | 2~100% |
            | 12    | 11  | 2~100% |
            | 12    | 12  | 2~100% |

      5 scenarios (5 passed)
      15 steps (15 passed)

      """

  Scenario: Successfull Integer Comparison - Null Tolerance 
    Given a file "features/data/tmp-relative-tolerance5.feature":
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left |
            |  12   |  5  | 7~0% |
            |  12   |  6  | 6~0% |
            |  12   |  4  | 8~0% |

      """
    When I run xreq -m -x suite features/data/tmp-relative-tolerance5.feature
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
            | 12    | 5   | 7~0% |
            | 12    | 6   | 6~0% |
            | 12    | 4   | 8~0% |

      3 scenarios (3 passed)
      9 steps (9 passed)

      """

  Scenario: Failed Integer Comparison - Smaller than lower bound 
    Given a file "features/data/tmp-relative-tolerance6.feature":
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left  |
            |  12   |  7  | 3~20% |

      """
    When I run xreq -m -x suite features/data/tmp-relative-tolerance6.feature
    Then it should pass
    When I run the test suite "./suite" in features/data/tests
    Then it should fail 

  Scenario: Failed Integer Comparison - Greater than upper bound 
    Given a file "features/data/tmp-relative-tolerance7.feature":
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left  |
            |  12   |  7  | 3~20% |

      """
    When I run xreq -m -x suite features/data/tmp-relative-tolerance7.feature
    Then it should pass
    When I run the test suite "./suite" in features/data/tests
    Then it should fail 

  Scenario: Failed Integer Comparison - Tolerance is negative 
    Given a file "features/data/tmp-relative-tolerance8.feature":
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left  |
            |  12   |  3  | 7~-1% |

      """
    When I run xreq -m -x suite features/data/tmp-relative-tolerance8.feature
    Then it should pass
    When I run the test suite "./suite" in features/data/tests
    Then it should fail 

  Scenario: Failed Integer Comparison - Tolerance is greater than 100% 
    Given a file "features/data/tmp-relative-tolerance9.feature":
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left   |
            |  12   |  3  | 7~101% |

      """
    When I run xreq -m -x suite features/data/tmp-relative-tolerance9.feature
    Then it should pass
    When I run the test suite "./suite" in features/data/tests
    Then it should fail 

