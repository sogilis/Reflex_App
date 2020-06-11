Feature: variables
  The library should have variables and be able to replace them in matches
  
  
  Background:
    Given xreq is in the PATH
    And I am in the xreq directory


  Scenario: run feature with variables
    And a file "features/data/tmp-lib-variables-1.feature":
      """
      Feature: eating

        Background:
          Given a variable o="o"
          Given a variable t="t"
          Given a variable to="To"
          Given a variable ta="Ta"
          Given a variable toto="ToTo"

        Scenario: clear variables
          Given all variables are cleared
          When I set test="${to}"
          Then the variable test should contain ""

        Scenario: single variable
          When I set test="${to}"
          Then the variable test should contain "To"

        Scenario: multiple variables
          When I set test="${t}${o}${t}${o}"
          Then the variable test should contain "toto"

        Scenario: variables in variable names
          When I set tata="Ta${${t}${o}${t}${o}}Ta"
          Then the variable tata should contain "TaTo${to}${ta}"
      """
    
    When I run xreq -m -x suite features/data/tmp-lib-variables-1.feature
    Then it should pass

    When I run the test suite "./suite -d" in features/data/tests
    Then it should pass
