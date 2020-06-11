Feature: The empty feature works
  In order to use XReq
  As an AsaSpec user
  I want to be able to generate the ads and adb files for a test and the test
  suite for an empty scenario

  Background:
    Given xreq is in the PATH
    And I am in the xreq directory
    And a file "tmp/tmp-empty.feature":
      """
      Feature: Empty

      Scenario: Empty
        # empty

      """

  @lang @lang-Ada
  Scenario: Test the generation of test packages
    When I run xreq --progress tmp/tmp-empty.feature
    Then it should pass with
      """
      --> Compile: tmp/tmp-empty.feature

      Load Ada steps in: tmp/step_definitions
      Compile: tmp/tmp-empty.feature
      Generate: tmp/tests/feature_tmp_empty.ads
      Generate: tmp/tests/feature_tmp_empty.adb
      completed 1 out of 1


      """
    And  "tmp/tests/feature_tmp_empty.ads" should exist
    And  "tmp/tests/feature_tmp_empty.adb" should exist
    When I compile "feature_tmp_empty" in tmp/tests
    Then it should pass


  @lang @lang-Ada
  Scenario: Test the generation of the test suite
    When  I run xreq --gnatcov -m -x empty_test tmp/tmp-empty.feature
    Then  it should pass
    And   "tmp/tests/feature_tmp_empty.ads" should exist
    And   "tmp/tests/feature_tmp_empty.adb" should exist
    And   "tmp/tests/empty_test.adb" should exist
    And   "tmp/tests/empty_test.gpr" should exist
    And   "tmp/tests/empty_test" should exist
    When  I run the test suite "./empty_test" in tmp/tests
    Then  it should pass with
      """
      Feature: Empty

        Scenario: Empty

      1 scenario (1 passed)
      0 steps

      """

  @lang @lang-Ada
  Scenario: Test the generation of the test suite with a project file
    When  I run xreq --gnatcov -x empty_suite tmp/tmp-empty.feature
    Then  it should pass
    And   "tmp/tests/feature_tmp_empty.ads" should exist
    And   "tmp/tests/feature_tmp_empty.adb" should exist
    And   "tmp/tests/empty_suite.adb" should exist
    And   "tmp/tests/empty_suite.gpr" should exist
    When  I run "gnatmake -Pempty_suite.gpr $GNAT_FLAGS" in tmp/tests
    Then  it should pass
    And   "tmp/tests/empty_suite" should exist
    When  I run the test suite "./empty_suite" in tmp/tests
    Then  it should pass with
      """
      Feature: Empty

        Scenario: Empty

      1 scenario (1 passed)
      0 steps

      """
