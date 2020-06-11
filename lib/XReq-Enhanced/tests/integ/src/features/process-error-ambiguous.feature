Feature: ambiguous step definition error reporting
  In order to avoid writing ambiguous step definitions
  As an xreq user
  I want to be notified whenever the step definitions regular expressions are
  ambiguous for a given step

  Background:
    Given xreq is in the PATH
    And I am in the xreq directory
    And a file "tmp/tmp-ambiguous.feature":
      """
      Feature: Sample

        Background: B
          Given this step is ambiguous

        Scenario: Run a bad step
          Given this step is too ambiguous
          Given this step is ambiguous

        Scenario: Run a good step
          Given this step is ambiguous

      """
    And a file "tmp/tmp-ambiguous2.feature":
      """
      Feature: Sample

        Scenario: Run an ambiguous step
          Given this is ambiguous too

      """

  Scenario: Ambiguity within the same step package
    When I run xreq tmp/tmp-ambiguous.feature
    Then it should fail
    And the output should contain
      """
      tmp/tmp-ambiguous.feature:4: ERROR: Ambiguous match for: Given this step is ambiguous
      tmp/tmp-ambiguous.feature:4: ERROR: with: tmp/step_definitions/simple_steps.ads:6: Simple_Steps.Given_this_step_works
      tmp/tmp-ambiguous.feature:4: ERROR: and:  tmp/step_definitions/simple_steps.ads:7: Simple_Steps.Given_this_step_works

      """
    And the output should contain
      """
      tmp/tmp-ambiguous.feature:8: ERROR: Ambiguous match for: Given this step is ambiguous
      tmp/tmp-ambiguous.feature:8: ERROR: with: tmp/step_definitions/simple_steps.ads:6: Simple_Steps.Given_this_step_works
      tmp/tmp-ambiguous.feature:8: ERROR: and:  tmp/step_definitions/simple_steps.ads:7: Simple_Steps.Given_this_step_works

      """
    And the output should contain
      """
      tmp/tmp-ambiguous.feature:11: ERROR: Ambiguous match for: Given this step is ambiguous
      tmp/tmp-ambiguous.feature:11: ERROR: with: tmp/step_definitions/simple_steps.ads:6: Simple_Steps.Given_this_step_works
      tmp/tmp-ambiguous.feature:11: ERROR: and:  tmp/step_definitions/simple_steps.ads:7: Simple_Steps.Given_this_step_works

      """

  Scenario: Ambiguity in two different packages
    When I run xreq tmp/tmp-ambiguous2.feature
    Then it should fail
    And the output should contain
      """
      tmp/tmp-ambiguous2.feature:4: ERROR: Ambiguous match for: Given this is ambiguous too
      tmp/tmp-ambiguous2.feature:4: ERROR: with: tmp/step_definitions/ambiguous_steps.ads:6:
      tmp/tmp-ambiguous2.feature:4: ERROR: and:  tmp/step_definitions/simple_steps.ads:8: Simple_Steps.Given_this_step_works

      """

  Scenario: Ambiguity in two different packages - Quiet mode
    When I run xreq -q tmp/tmp-ambiguous2.feature
    Then it should fail
    And the output should contain
      """
      tmp/tmp-ambiguous2.feature:4: ERROR: Ambiguous match for: Given this is ambiguous too

      """
