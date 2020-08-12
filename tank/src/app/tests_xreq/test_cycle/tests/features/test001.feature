Feature: Cycle_1 tests

Background:
Given Cycle is initialized

  Scenario Outline: state
    Given State is <State>

    When Start_cycle is <Start_cycle>
    And End_Filling_P1 is <End_Filling_P1>
    And End_Filling_P2 is <End_Filling_P2>
    And End_Mixing is <End_Mixing>
    And End_Emptying is <End_Emptying>

    Then New_state is <New_State>
    And Filling_P1_Order is <Filling_P1_Order>
    And Filling_P2_Order is <Filling_P2_Order>
    And Mixing_Order is <Mixing_Order>
    And Emptying_Order is <Emptying_Order>
    And End_Cycle is <End_Cycle>

    Examples:
      | State              | Start_cycle |End_Filling_P1 | End_Filling_P2 | End_Mixing | End_Emptying | New_State        | Filling_P1_Order | Filling_P2_Order | Mixing_Order | Emptying_Order | End_Cycle |
      | Init_State         |TRUE         | FALSE         | FALSE          | FALSE      | FALSE        | Filling_P1_State | TRUE             | FALSE            | FALSE        | FALSE          | FALSE     |
      | Filling_P1_State   |FALSE        |TRUE           | FALSE          | FALSE      | FALSE        | Filling_P2_State | FALSE            | TRUE             | FALSE        | FALSE          | FALSE     |
      | Filling_P2_State   |FALSE        |FALSE          | TRUE           | FALSE      | FALSE        | Mixing_State     | FALSE            | FALSE            | TRUE         | FALSE          | FALSE     |
      | Mixing_State       |FALSE        |FALSE          | FALSE          | TRUE       | FALSE        | Emptying_State   | FALSE            | FALSE            | FALSE        | TRUE           | FALSE     |
      | Emptying_State     |FALSE        |FALSE          | FALSE          | FALSE      | TRUE         | End_Cycle_State  | FALSE            | FALSE            | FALSE        | FALSE          | TRUE      |
      | End_Cycle_State    |FALSE        |FALSE          | FALSE          | FALSE      | FALSE        | Init_State       | FALSE            | FALSE            | FALSE        | FALSE          | FALSE     |
      | End_Cycle_State    |FALSE        |TRUE           | TRUE           | TRUE       | TRUE         | Init_State       | FALSE            | FALSE            | FALSE        | FALSE          | FALSE     |
      | End_Cycle_State    |FALSE        |TRUE           | FALSE          | FALSE      | TRUE         | Init_State       | FALSE            | FALSE            | FALSE        | FALSE          | FALSE     |

