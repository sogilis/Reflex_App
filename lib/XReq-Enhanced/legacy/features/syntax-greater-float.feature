Feature: Scenario Greater For Float 
  In order to write scenarios that can check if the actual value is greater than the expected
  As a feature writer
  I want xreq to support greater checks in steps

  Background:
    Given xreq is in the PATH
    And I am in the xreq directory

  Scenario: Actual is strictly greater than expected 
    Given a file "features/data/tmp-greater-float.feature":
      """
      Feature: heating

        Scenario Outline: heating
          Given temperature is <start> degrees
          When I heat for <heat> degrees
          Then the temperature shall be <end> degrees

          Examples:
            | start     | heat      | end       |
            | 0.8382343 | 7.1516244 | >=7.50001 |

      """
    When I run xreq -m -x suite features/data/tmp-greater-float.feature
    Then it should pass
    When I run the test suite "./suite" in features/data/tests
    Then it should pass with
      """
      Feature: heating

        Scenario Outline: heating
          Given temperature is <start> degrees
          When I heat for <heat> degrees
          Then the temperature shall be <end> degrees

          Examples:
            | start     | heat      | end       |
            | 0.8382343 | 7.1516244 | >=7.50001 |

      1 scenario (1 passed)
      3 steps (3 passed)

      """

  Scenario: Actual equals expected 
    Given a file "features/data/tmp-greater-float1.feature":
      """
      Feature: heating

        Scenario Outline: heating
          Given temperature is <start> degrees
          When I heat for <heat> degrees
          Then the temperature shall be <end> degrees

          Examples:
            | start     | heat      | end         |
            | 0.8382343 | 7.1516244 | >=7.9898587 |

      """
    When I run xreq -m -x suite features/data/tmp-greater-float1.feature
    Then it should pass
    When I run the test suite "./suite" in features/data/tests
    Then it should pass with
      """
      Feature: heating

        Scenario Outline: heating
          Given temperature is <start> degrees
          When I heat for <heat> degrees
          Then the temperature shall be <end> degrees

          Examples:
            | start     | heat      | end         |
            | 0.8382343 | 7.1516244 | >=7.9898587 |

      1 scenario (1 passed)
      3 steps (3 passed)

      """

  Scenario: Actual strictly smaller than expected 
    Given a file "features/data/tmp-greater-float2.feature":
      """
      Feature: heating

        Scenario Outline: heating
          Given temperature is <start> degrees
          When I heat for <heat> degrees
          Then the temperature shall be <end> degrees

          Examples:
            | start     | heat      | end         |
            | 0.8382343 | 7.1516244 | >=8.0009832 |

      """
    When I run xreq -m -x suite features/data/tmp-greater-float2.feature
    Then it should pass
    When I run the test suite "./suite" in features/data/tests
    Then it should fail 
