Feature: Filling tests

Background:
Given Filling app is initialized

  Scenario Outline: state
    Given State is <State>

    When Start_Filling is <Start_Filling> 
    And  Valves_Opened is <Valves_Opened> 
    And  Valves_Closed is <Valves_Closed> 
    And  Pumps_Started is <Pumps_Started> 
    And  Level_P is <Level_P>

    Then New_state is <New_State> 
    And  Open_Valves is <Open_Valves> 
    And  Start_Pumps is <Start_Pumps> 
    And  Close_Valves is <Close_Valves> 

    Examples:
      | State                  | Start_Filling | Valves_Opened | Valves_Closed | Pumps_Started | Level_P | New_State              | Open_Valves | Start_Pumps | Close_Valves |
      | Init_State             | TRUE          | FALSE         | FALSE         | FALSE         | FALSE   | Openning_Valves_State  | TRUE        | FALSE       | FALSE        |
      | Openning_Valves_State  | TRUE          | TRUE          | FALSE         | FALSE         | FALSE   | Running_Pumps_State    | FALSE       | TRUE        | FALSE        |
      | Running_Pumps_State    | TRUE          | FALSE         | FALSE         | TRUE          | FALSE   | Filling_emptying_State | FALSE       | TRUE        | FALSE        |
      | Filling_emptying_State | TRUE          | FALSE         | FALSE         | TRUE          | TRUE    | Stopping_Pumps_State   | FALSE       | FALSE       | FALSE        |
      | Stopping_Pumps_State   | TRUE          | FALSE         | FALSE         | FALSE         | FALSE   | Closing_Valves_State   | FALSE       | FALSE       | TRUE         |
      | Closing_Valves_State   | TRUE          | FALSE         | TRUE          | FALSE         | FALSE   | Waiting_State          | FALSE       | FALSE       | FALSE        |
      | Waiting_State          | FALSE         | FALSE         | FALSE         | FALSE         | FALSE   | Init_State             | FALSE       | FALSE       | FALSE        |


