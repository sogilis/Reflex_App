Feature: Filling_2 test

Background:
Given Filling app is initialized

  Scenario: Filling
    Given State is Init_State

    When Start_Filling is TRUE 
    And  Valves_Opened is FALSE 
    And  Valves_Closed is FALSE 
    And  Pumps_Started is FALSE 
    And  Level_P is FALSE

    Then New_state is Openning_Valves_State 
    And  Open_Valves is TRUE 
    And  Start_Pumps is FALSE 
    And  Close_Valves is FALSE 
    And  Close_Valves is FALSE 
    And  End_Filling is FALSE 

    Given State is Openning_Valves_State

    When Start_Filling is TRUE 
    And  Valves_Opened is TRUE 
    And  Valves_Closed is FALSE 
    And  Pumps_Started is FALSE 
    And  Level_P is FALSE

    Then New_state is Running_Pumps_State 
    And  Open_Valves is FALSE 
    And  Start_Pumps is TRUE 
    And  Close_Valves is FALSE 
    And  End_Filling is FALSE 

    Given State is Running_Pumps_State

    When Start_Filling is TRUE 
    And  Valves_Opened is FALSE 
    And  Valves_Closed is FALSE 
    And  Pumps_Started is TRUE 
    And  Level_P is FALSE

    Then New_state is Filling_emptying_State 
    And  Open_Valves is FALSE 
    And  Start_Pumps is TRUE 
    And  Close_Valves is FALSE 
    And  End_Filling is FALSE 

    Given State is Filling_emptying_State

    When Start_Filling is TRUE 
    And  Valves_Opened is FALSE 
    And  Valves_Closed is FALSE 
    And  Pumps_Started is TRUE 
    And  Level_P is TRUE

    Then New_state is Stopping_Pumps_State 
    And  Open_Valves is FALSE 
    And  Start_Pumps is FALSE 
    And  Close_Valves is FALSE 
    And  End_Filling is FALSE 

    Given State is Stopping_Pumps_State

    When Start_Filling is TRUE 
    And  Valves_Opened is FALSE 
    And  Valves_Closed is FALSE 
    And  Pumps_Started is FALSE 
    And  Level_P is FALSE

    Then New_state is Closing_Valves_State 
    And  Open_Valves is FALSE 
    And  Start_Pumps is FALSE 
    And  Close_Valves is TRUE 
    And  End_Filling is FALSE 


    Given State is Closing_Valves_State

    When Start_Filling is TRUE 
    And  Valves_Opened is FALSE 
    And  Valves_Closed is TRUE 
    And  Pumps_Started is FALSE 
    And  Level_P is FALSE

    Then New_state is End_Filling_State 
    And  Open_Valves is FALSE 
    And  Start_Pumps is FALSE 
    And  Close_Valves is FALSE 
    And  End_Filling is TRUE 


    Given State is End_Filling_State

    When Start_Filling is FALSE 
    And  Valves_Opened is FALSE 
    And  Valves_Closed is FALSE 
    And  Pumps_Started is FALSE 
    And  Level_P is FALSE

    Then New_state is Init_State 
    And  Open_Valves is FALSE 
    And  Start_Pumps is FALSE 
    And  Close_Valves is FALSE 
    And  End_Filling is FALSE 

