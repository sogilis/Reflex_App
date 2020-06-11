Feature: Scenario Relative Tolerance 
  In order to write scenarios that accept relative tolerances for float
  As a feature writer
  I want xreq to support relative tolerance for float in steps

  Background:
    Given xreq is in the PATH
    And I am in the xreq directory

  Scenario: Successfull Float Comparison - Positive Expected
    Given a file "features/data/tmp-relative-tolerance-float.feature":
      """
      Feature: heating

        Scenario Outline: heating
          Given temperature is <start> degrees
          When I heat for <heat> degrees
          Then the temperature shall be <end> degrees

          Examples:
            | start     | heat      | end             |
            | 9.9443095 | 6.8752943 | 16.8196038~0.1% |
            | 9.9443095 | 6.8921139 | 16.8196038~0.1% |
            | 9.9443095 | 6.8584746 | 16.8196038~0.1% |

      """
    When I run xreq -m -x suite features/data/tmp-relative-tolerance-float.feature
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
            | start     | heat      | end             |
            | 9.9443095 | 6.8752943 | 16.8196038~0.1% |
            | 9.9443095 | 6.8921139 | 16.8196038~0.1% |
            | 9.9443095 | 6.8584746 | 16.8196038~0.1% |

      3 scenarios (3 passed)
      9 steps (9 passed)

      """

  Scenario: Successfull Float Comparison - Negative Expected
    Given a file "features/data/tmp-relative-tolerance-float1.feature":
      """
      Feature: heating

        Scenario Outline: heating
          Given temperature is <start> degrees
          When I heat for <heat> degrees
          Then the temperature shall be <end> degrees

          Examples:
            | start     | heat     | end            |
            | -9.944309 | 6.875294 | -3.069015~2.0% |
            | -9.944309 | 6.813914 | -3.069015~2.0% |
            | -9.944309 | 6.936674 | -3.069015~2.0% |

      """
    When I run xreq -m -x suite features/data/tmp-relative-tolerance-float1.feature
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
            | start     | heat     | end            |
            | -9.944309 | 6.875294 | -3.069015~2.0% |
            | -9.944309 | 6.813914 | -3.069015~2.0% |
            | -9.944309 | 6.936674 | -3.069015~2.0% |

      3 scenarios (3 passed)
      9 steps (9 passed)

      """

  Scenario: Successfull Float Comparison - Zero Expected
    Given a file "features/data/tmp-relative-tolerance-float2.feature":
      """
      Feature: heating

        Scenario Outline: heating
          Given temperature is <start> degrees
          When I heat for <heat> degrees
          Then the temperature shall be <end> degrees

          Examples:
            | start     | heat     | end      |
            | -9.944309 | 9.944309 | 0.0~6.1% |
      """
    When I run xreq -m -x suite features/data/tmp-relative-tolerance-float2.feature
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
            | start     | heat     | end      |
            | -9.944309 | 9.944309 | 0.0~6.1% |

      1 scenario (1 passed)
      3 steps (3 passed)

      """

  Scenario: Successfull Float Comparison - Maximum and Minimum Expected 
    Given a file "features/data/tmp-relative-tolerance-float3.feature":
      """
      Feature: heating

        Scenario Outline: heating
          Given temperature is <start> degrees
          When I heat for <heat> degrees
          Then the temperature shall be <end> degrees

          Examples:
            | start        | heat | end               |
            | -3.40282E+38 | 0.0  | -3.40282E+38~1.0% |
            | -3.40282E+38 | 0.0  | -3.40282E+38~1.0% |

      """
    When I run xreq -m -x suite features/data/tmp-relative-tolerance-float3.feature
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
            | start        | heat | end               |
            | -3.40282E+38 | 0.0  | -3.40282E+38~1.0% |
            | -3.40282E+38 | 0.0  | -3.40282E+38~1.0% |

      2 scenarios (2 passed)
      6 steps (6 passed)

      """

  Scenario: Successfull Float Comparison - Max Tolerance 
    Given a file "features/data/tmp-relative-tolerance-float4.feature":
      """
      Feature: heating

        Scenario Outline: heating
          Given temperature is <start> degrees
          When I heat for <heat> degrees
          Then the temperature shall be <end> degrees

          Examples:
            | start | heat       | end         |
            | 0.986 | 3.0        | 8.98~100.0% |
            | 0.986 | 65.0989870 | 67.9~100.0% |

      """
    When I run xreq -m -x suite features/data/tmp-relative-tolerance-float4.feature
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
            | start | heat       | end         |
            | 0.986 | 3.0        | 8.98~100.0% |
            | 0.986 | 65.0989870 | 67.9~100.0% |

      2 scenarios (2 passed)
      6 steps (6 passed)

      """

  Scenario: Successfull Float Comparison - Null Tolerance 
    Given a file "features/data/tmp-relative-tolerance-float5.feature":
      """
      Feature: heating

        Scenario Outline: heating
          Given temperature is <start> degrees
          When I heat for <heat> degrees
          Then the temperature shall be <end> degrees

          Examples:
            | start | heat | end        |
            | 0.986 | 0.0  | 0.986~0.0% |

      """
    When I run xreq -m -x suite features/data/tmp-relative-tolerance-float5.feature
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
            | start | heat | end        |
            | 0.986 | 0.0  | 0.986~0.0% |

      1 scenario (1 passed)
      3 steps (3 passed)

      """

  Scenario: Failed Float Comparison - Smaller than lower bound 
    Given a file "features/data/tmp-relative-tolerance-float6.feature":
      """
      Feature: heating

        Scenario Outline: heating
          Given temperature is <start> degrees
          When I heat for <heat> degrees
          Then the temperature shall be <end> degrees

          Examples:
            | start   | heat    | end           |
            | 9.94430 | 6.87529 | 16.80277~0.1% |

      """
    When I run xreq -m -x suite features/data/tmp-relative-tolerance-float6.feature
    Then it should pass
    When I run the test suite "./suite" in features/data/tests
    Then it should fail 

  Scenario: Failed Float Comparison - Greater than upper bound 
    Given a file "features/data/tmp-relative-tolerance-float7.feature":
      """
      Feature: heating

        Scenario Outline: heating
          Given temperature is <start> degrees
          When I heat for <heat> degrees
          Then the temperature shall be <end> degrees

          Examples:
            | start    | heat | end           |
            | 10.85329 | 6.0  | 16.83645~0.1% |

      """
    When I run xreq -m -x suite features/data/tmp-relative-tolerance-float7.feature
    Then it should pass
    When I run the test suite "./suite" in features/data/tests
    Then it should fail 

  Scenario: Failed Float Comparison - Tolerance is negative 
    Given a file "features/data/tmp-relative-tolerance-float8.feature":
      """
      Feature: heating

        Scenario Outline: heating
          Given temperature is <start> degrees
          When I heat for <heat> degrees
          Then the temperature shall be <end> degrees

          Examples:
            | start   | heat    | end             |
            | 9.94430 | 6.87529 | 16.81961~-0.01% |

      """
    When I run xreq -m -x suite features/data/tmp-relative-tolerance-float8.feature
    Then it should pass
    When I run the test suite "./suite" in features/data/tests
    Then it should fail 

  Scenario: Failed Float Comparison - Tolerance is greater than 100%
    Given a file "features/data/tmp-relative-tolerance-float9.feature":
      """
      Feature: heating

        Scenario Outline: heating
          Given temperature is <start> degrees
          When I heat for <heat> degrees
          Then the temperature shall be <end> degrees

          Examples:
            | start   | heat    | end               |
            | 9.94430 | 6.87529 | 16.81961~-100.01% |

      """
    When I run xreq -m -x suite features/data/tmp-relative-tolerance-float9.feature
    Then it should pass
    When I run the test suite "./suite" in features/data/tests
    Then it should fail 


