Feature: Scenario Strictly Greater For Integers 
  In order to write scenarios that can check if the actual value is strictly greater than the expected
  As a feature writer
  I want xreq to support strictly greater checks in steps

  Background:
    Given xreq is in the PATH
    And I am in the xreq directory

  Scenario: Actual is strictly greater than expected 
    Given a file "features/data/tmp-strictly-greater-int.feature":
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left |
            | 12    | 5   | >6   |

      """
    When I run xreq -m -x suite features/data/tmp-strictly-greater-int.feature
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
            | 12    | 5   | >6   |

      1 scenario (1 passed)
      3 steps (3 passed)

      """

  Scenario: Actual equals expected 
    Given a file "features/data/tmp-strictly-greater-int1.feature":
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left |
            | 12    | 5   | >7   |

      """
    When I run xreq -m -x suite features/data/tmp-strictly-greater-int1.feature
    Then it should pass
    When I run the test suite "./suite" in features/data/tests
    Then it should fail 

  Scenario: Actual strictly smaller than expected 
    Given a file "features/data/tmp-strictly-greater-int2.feature":
      """
      Feature: eating

        Scenario Outline: eating
          Given there are <start> cucumbers
          When I eat <eat> cucumbers
          Then I should have <left> cucumbers

          Examples:
            | start | eat | left |
            | 12    | 5   | >8   |

      """
    When I run xreq -m -x suite features/data/tmp-strictly-greater-int2.feature
    Then it should pass
    When I run the test suite "./suite" in features/data/tests
    Then it should fail 
