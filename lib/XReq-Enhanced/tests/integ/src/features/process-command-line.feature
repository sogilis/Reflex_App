Feature: xreq commandline
  In order to execute xreq
  As an xreq user
  I want to have a command line interface

  Background:
    Given xreq is in the PATH
    And   I am in the xreq directory
    And a file "tmp/tmp-simplest.feature":
      """
      Feature: Sample
      Description Line 1
      Description Line 2
      Description Line 3

      Background:
        Given this step works loudly

      Scenario: Run a good step
        Given this step works loudly

      """
    When  I run "rm -f features/tests/*"
    When  I run "rm -f data/tests/*"

  Scenario: Help message
    When I run xreq -h
    Then it should pass
    And the output should contain
      """
      SYNOPSIS

          xreq [OPTIONS] FEATURE ...

      """

  Scenario: Choose a step directory
    When I run xreq -otmp --step tmp tmp/tmp-simplest.feature
    Then it should fail
    And the output should contain
      """
      Missing step definition
      """

  Scenario: Run xreq with no features but specify output
    When I run xreq -o tmp
    Then it should fail
    And the output should contain
      """
      Missing feature
      """

  Scenario: Run xreq with no features but specify steps
    When I run xreq --step=tmp
    Then it should fail
    And the output should contain
      """
      Missing feature
      """

  Scenario: Specify a wrong language
    When I run xreq --lang toto tmp/tmp-simplest.feature
    Then it should fail
    And the output should contain
      """
      Unknown language toto
      """

  Scenario: Specify a wrong language (environment variable)
    When I run XREQ_LANG="toto" xreq tmp/tmp-simplest.feature
    Then it should fail
    And the output should contain
      """
      Unknown language toto
      """

  Scenario: Don't specify an argument to a command line switch
    When I run xreq --step
    Then it should fail
    And the output should contain
      """
      Missing parameter for switch --step
      """

  Scenario: Specify an unknown command line switch
    When I run xreq --toto
    Then it should fail
    And the output should contain
      """
      Invalid switch
      """

  Scenario: Specify a custom option
    When I run xreq -ctoto=tata tmp/tmp-simplest.feature
    Then it should pass

  Scenario: Specify a custom option without value
    When I run xreq -ctoto tmp/tmp-simplest.feature
    Then it should fail
    And the output should contain
      """
      Invalid configuration
      """
