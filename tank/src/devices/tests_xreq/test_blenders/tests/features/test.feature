Feature: Blenders tests

Background:
Given blender component is initialized

  Scenario Outline: state
    Given State is <State>

    When Run is <Run> 
    And  Speed_1 is <Speed_1> 
    And  Speed_2 is <Speed_2> 

    Then New_state is <New_State> 
    And  Run_Order is <Run_Order> 
    And  v1_Order is <v1_Order> 
    And  v2_Order is <v2_Order> 

    Examples:
      | State            | Run   | Speed_1 | Speed_2 | New_State        | Run_Order | v1_Order | v2_Order |
      | Init_State       | FALSE | FALSE   | FALSE   | Stop_State       | FALSE     | FALSE    | FALSE    |
      | Stop_State       | TRUE  | FALSE   | FALSE   | Starting_State   | TRUE      | FALSE    | FALSE    |
      | Starting_State   | TRUE  | TRUE    | FALSE   | Running_V1_State | TRUE      | TRUE     | FALSE    |
      | Running_V1_State | FALSE | TRUE    | FALSE   | Stopping_State   | FALSE     | FALSE    | FALSE    |
      | Running_V1_State | TRUE  | FALSE   | TRUE    | Running_V2_State | TRUE      | FALSE    | TRUE     | 
      | Running_V1_State | FALSE | TRUE    | FALSE   | Stopping_State   | FALSE     | FALSE    | FALSE    |
      | Running_V1_State | TRUE  | TRUE    | TRUE    | Running_V2_State | TRUE      | FALSE    | TRUE     |
      | Running_V2_State | TRUE  | TRUE    | FALSE   | Running_V1_State | TRUE      | TRUE     | FALSE    |
      | Stopping_State   | FALSE | FALSE   | FALSE   | Stop_State       | FALSE     | FALSE    | FALSE    |



