Feature: Pumps tests

Background:
Given Pump component is initialized

  Scenario Outline: state
    Given State is <State>

    When Run is <Run> 
    And  Running is <Running>

    Then New_state is <New_State> 
    And  Run_Order is <Run_Order> 

    Examples:
      | State         | Run    | Running |  New_State      | Run_Order  |
      | Stop_State    | FALSE  | FALSE   |  Stop_State     | FALSE      |
      | Stop_State    | TRUE   | FALSE   |  Run_State      | TRUE       |
      | Run_State     | TRUE   | TRUE    |  Running_State  | TRUE       |
      | Running_State | TRUE   | TRUE    |  Running_State  | TRUE       |
      | Running_State | FALSE  | TRUE    |  Stopping_State | FALSE      |
      | Stopping_State| FALSE  | FALSE   |  Stop_State     | FALSE      |
      

