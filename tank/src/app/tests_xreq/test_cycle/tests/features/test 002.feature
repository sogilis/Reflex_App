Feature: Cycle_2 tests

Background:
Given Cycle is initialized

  Scenario: state
    Given State is Init_State

    When Start_cycle is TRUE
    And End_Filling_P1 is FALSE
    And End_Filling_P2 is FALSE
    And End_Mixing is FALSE
    And End_Emptying is FALSE

    Then New_state is Filling_P1_State
    And Filling_P1_Order is TRUE
    And Filling_P2_Order is FALSE
    And Mixing_Order is FALSE
    And Emptying_Order is FALSE
    And End_Cycle is FALSE

    Given State is Filling_P1_State

    When Start_cycle is FALSE
    And End_Filling_P1 is TRUE
    And End_Filling_P2 is FALSE
    And End_Mixing is FALSE
    And End_Emptying is FALSE

    Then New_state is Filling_P2_State
    And Filling_P1_Order is FALSE
    And Filling_P2_Order is TRUE
    And Mixing_Order is FALSE
    And Emptying_Order is FALSE
    And End_Cycle is FALSE

    Given State is Filling_P2_State

    When Start_cycle is FALSE
    And End_Filling_P1 is FALSE
    And End_Filling_P2 is TRUE
    And End_Mixing is FALSE
    And End_Emptying is FALSE

    Then New_state is Mixing_State
    And Filling_P1_Order is FALSE
    And Filling_P2_Order is FALSE
    And Mixing_Order is TRUE
    And Emptying_Order is FALSE
    And End_Cycle is FALSE

    Given State is Mixing_State

    When Start_cycle is FALSE
    And End_Filling_P1 is FALSE
    And End_Filling_P2 is FALSE
    And End_Mixing is TRUE
    And End_Emptying is FALSE

    Then New_state is Emptying_State
    And Filling_P1_Order is FALSE
    And Filling_P2_Order is FALSE
    And Mixing_Order is FALSE
    And Emptying_Order is TRUE
    And End_Cycle is FALSE

    Given State is Emptying_State

    When Start_cycle is FALSE
    And End_Filling_P1 is FALSE
    And End_Filling_P2 is FALSE
    And End_Mixing is FALSE
    And End_Emptying is TRUE

    Then New_state is End_Cycle_State
    And Filling_P1_Order is FALSE
    And Filling_P2_Order is FALSE
    And Mixing_Order is FALSE
    And Emptying_Order is FALSE
    And End_Cycle is TRUE

    Given State is End_Cycle_State

    When Start_cycle is FALSE
    And End_Filling_P1 is TRUE
    And End_Filling_P2 is TRUE
    And End_Mixing is TRUE
    And End_Emptying is TRUE

    Then New_state is Init_State
    And Filling_P1_Order is FALSE
    And Filling_P2_Order is FALSE
    And Mixing_Order is FALSE
    And Emptying_Order is FALSE
    And End_Cycle is FALSE

    Given State is End_Cycle_State

    When Start_cycle is FALSE
    And End_Filling_P1 is FALSE
    And End_Filling_P2 is FALSE
    And End_Mixing is FALSE
    And End_Emptying is FALSE

    Then New_state is Init_State
    And Filling_P1_Order is FALSE
    And Filling_P2_Order is FALSE
    And Mixing_Order is FALSE
    And Emptying_Order is FALSE
    And End_Cycle is FALSE


