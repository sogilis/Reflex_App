Feature: Variables in comparison
  The library should have variables and be able to replace them in matches
  It shall also be able to use variables in comparisons
  
  Background:
    Given xreq is in the PATH
    And I am in the xreq directory


  Scenario: run feature with variables
    And a file "features/data/tmp-lib-variables-comp-1.feature":
      """
       Feature: eating
  
        Background:
          Given a variable X=3
          Given a variable Eps=2

          Scenario Outline: eating
            Given there are <start> cucumbers
            When I eat <eat> cucumbers
            Then I should have <left> cucumbers
  
           Examples:
              | start | eat | left         |
              |  ${X} |  0  | ${X}~${Eps}  |
              |  ${X} |  0  | ${X}~${Eps}% |
              |  ${X} |  1  | <${X}        |
              |  ${X} |  1  | <=${X}       |
              |  ${X} | -1  | >${X}        |
              |  ${X} | -1  | >=${X}       |
  
        """
    
    When I run xreq -m -x suite features/data/tmp-lib-variables-comp-1.feature
    Then it should pass

    When I run the test suite "./suite -d" in features/data/tests
    Then it should pass

  Scenario: run feature with variables
    And a file "features/data/tmp-lib-variables-comp-2.feature":
      """
      Feature: eating

        Background:
          Given a variable Pi=3.14
          Given a variable Eps=0.1

          Scenario Outline: eating
            Given temperature is <start> degrees
            When I heat for <heat> degrees
            Then the temperature shall be <end> degrees
  
            Examples:
              | start  | heat  | end           |
              | ${Pi}  | 0.05  | ${Pi}~${Eps}  |
              | ${Pi}  | 0.0   | ${Pi}~${Eps}% |
              | ${Pi}  | 0.05  | >${Pi}        |
              | ${Pi}  | 0.05  | >=${Pi}       |
              | ${Pi}  | -0.05 | <${Pi}        |
              | ${Pi}  | -0.05 | <=${Pi}       |


      """
    
    When I run xreq -m -x suite features/data/tmp-lib-variables-comp-2.feature
    Then it should pass

    When I run the test suite "./suite -d" in features/data/tests
    Then it should pass
  
