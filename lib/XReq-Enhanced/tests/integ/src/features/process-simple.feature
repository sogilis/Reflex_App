Feature: The simplest works
  In order to use XReq
  As an AsaSpec user
  I want to be able to generate the ads and adb files for a test and the test
  suite

  Background:
    Given xreq is in the PATH
    And I am in the xreq directory
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

  @lang @lang-Ada
  Scenario: Test the generation of test packages
    When I run xreq --progress tmp/tmp-simplest.feature
    Then it should pass with
      """
      --> Compile: tmp/tmp-simplest.feature

      Load Ada steps in: tmp/step_definitions
      Compile: tmp/tmp-simplest.feature
      Generate: tmp/tests/feature_tmp_simplest.ads
      Generate: tmp/tests/feature_tmp_simplest.adb
      completed 1 out of 1


      """
    And  "tmp/tests/feature_tmp_simplest.ads" should exist
    And  "tmp/tests/feature_tmp_simplest.adb" should exist
    When I compile "feature_tmp_simplest" in tmp/tests
    Then it should pass


  @lang @lang-Ada
  Scenario: Test the generation of the test suite
    When  I run xreq --gnatcov -m -x simplest_test tmp/tmp-simplest.feature
    Then  it should pass
    And the output should contain
      """

      --> Success

      """
    And   "tmp/tests/feature_tmp_simplest.ads" should exist
    And   "tmp/tests/feature_tmp_simplest.adb" should exist
    And   "tmp/tests/simplest_test.adb" should exist
    And   "tmp/tests/simplest_test.gpr" should exist
    And   "tmp/tests/simplest_test" should exist

    When  I run the test suite "./simplest_test" in tmp/tests
    Then  it should pass with
      """
      Feature: Sample
        Description Line 1
        Description Line 2
        Description Line 3

        Background:
      This step works
          Given this step works loudly

        Scenario: Run a good step
      This step works
          Given this step works loudly

      1 scenario (1 passed)
      2 steps (2 passed)

      """

  @lang @lang-Ada
  Scenario: Test the generation of the test suite with a project file
    When  I run xreq --gnatcov -x suite tmp/tmp-simplest.feature
    Then  it should pass
    And   "tmp/tests/feature_tmp_simplest.ads" should exist
    And   "tmp/tests/feature_tmp_simplest.adb" should exist
    And   "tmp/tests/suite.adb" should exist
    And   "tmp/tests/suite.gpr" should exist
    When  I run "gnatmake -Psuite.gpr $GNAT_FLAGS" in tmp/tests
    Then  it should pass
    And   "tmp/tests/suite" should exist
    When  I run the test suite "./suite" in tmp/tests
    Then  it should pass with
      """
      Feature: Sample
        Description Line 1
        Description Line 2
        Description Line 3

        Background:
      This step works
          Given this step works loudly

        Scenario: Run a good step
      This step works
          Given this step works loudly

      1 scenario (1 passed)
      2 steps (2 passed)

      """

  @lang @lang-Ada
  Scenario:
    When I run GNAT_FLAGS="--non-existing-flag" xreq --gnatcov -m -x suite tmp/tmp-simplest.feature
    Then it should fail
    And the output should contain
      """
      --> Failure
      """
