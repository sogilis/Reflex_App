Feature: Resistances tests

Background:
Given resistance component is initialized

  Scenario Outline: state
    Given State is <State> 

    When Run is <Run> 
    And  T_Regul is <T_Regul> 
    And  Set_Point is <Set_Point>
 
    Then New_state is <New_State> 

    Examples:
      | State         | Run   | T_Regul | Set_Point | New_State     |
      | Init_State    | FALSE | 100     | 100       | Waiting_State | 
      | Init_State    | FALSE | 100     | 50        | Waiting_State |
      | Waiting_State | TRUE  | 100     | 50        | Running_State |
      | Waiting_State | TRUE  | 100     | 100       | Running_State | 
      | Running_State | TRUE  | 100     | 100       | Running_State |
      | Running_State | TRUE  | 100     | 50        | Running_State |
      | Running_State | FALSE | 100     | 100       | Init_State    |



