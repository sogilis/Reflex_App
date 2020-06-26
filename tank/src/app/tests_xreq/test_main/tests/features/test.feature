Feature: Application tests

Background:
Given Application is initialized

  Scenario: state
    Given State is Init_State

    When End_Filling_P1 is FALSE
    And  End_Filling_P2 is FALSE
    And  End_Mixing is FALSE
    And  End_Emptying is FALSE

    Then New_state is Filling_P1_State
    And  Filling_P1_Order is TRUE
    And  Filling_P2_Order is FALSE
    And  Mixing_Order is FALSE
    And  Emptying_Order is FALSE
    And  End_Cycle is FALSE

    Given State is Filling_P1_State

    When End_Filling_P1 is FALSE
    And  End_Filling_P2 is FALSE
    And  End_Mixing is FALSE
    And  End_Emptying is FALSE
    And  Valves_Opened is FALSE
    And  Valves_Closed is FALSE
    And  Pumps_Started is FALSE
    And  Level_P is FALSE

    Then New_state is Openning_Valves_State
    And  Open_Valves is TRUE
    And  Start_Pumps is FALSE
    And  Close_Valves is FALSE

    Given State is Openning_Valves_State
    And State is Waiting_State

    When End_Filling_P1 is FALSE
    And  End_Filling_P2 is FALSE
    And  End_Mixing is FALSE
    And  End_Emptying is FALSE
    And  Valves_Opened is FALSE
    And  Valves_Closed is FALSE
    And  Pumps_Started is FALSE
    And  Level_P is FALSE
    And Close is FALSE
    And Opened is FALSE 
    And  Closed is FALSE

    Then New_state is Opening_State
    And Open_Order is TRUE
    And Close_Order is FALSE
