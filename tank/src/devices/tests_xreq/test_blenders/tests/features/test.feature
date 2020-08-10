Feature: Blenders tests

Background:
Given blender component is initialized

  Scenario Outline: state
    Given State is <State>

    When Run is <Run> 
    And  Speed_2 is <Speed_2> 

    Then New_state is <New_State> 
    And  Run_Order is <Run_Order> 
    And  v2_Order is <v2_Order> 

    Examples:
      | State            | Run   | Speed_2 | New_State        | Run_Order | v2_Order |
      | Init_State       | FALSE | FALSE   | Stop_State       | FALSE     | FALSE    |
      | Stop_State       | TRUE  | FALSE   | Running_V1_State | TRUE      | FALSE    | 
      | Running_V1_State | FALSE | FALSE   | Stop_State       | FALSE     | FALSE    | 
      | Running_V1_State | TRUE  | TRUE    | Running_V2_State | TRUE      | TRUE     |
      | Running_V2_State | TRUE  | FALSE   | Running_V1_State | TRUE      | FALSE    |
      | Running_V2_State | FALSE | TRUE    | Stop_State       | FALSE     | FALSE    |



