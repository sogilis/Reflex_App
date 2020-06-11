Feature: test-state Feature

Background:
Given valve component is initialized

  Scenario Outline: state

    Given State is <State>

    When Open is <Open> 
    And Close is <Close> 
    And Opened is <Opened> 
    And Closed is <Closed>

    Then New_State is <New_State> 
    And Open_Order is <Open_Order> 
    And Close_Order is <Close_Order> 

    Examples:
      | State         | Open  | Close | Opened | Closed | New_State     | Open_Order | Close_Order |
      | Init_State    | FALSE | FALSE | FALSE  | FALSE  | Waiting_State | FALSE      | FALSE       |
      | Waiting_State | TRUE  | FALSE | FALSE  | FALSE  | Opening_State | TRUE       | FALSE       |
      | Waiting_State | FALSE | TRUE  | FALSE  | FALSE  | Closing_State | FALSE      | TRUE        |
      | Opening_State | TRUE  | FALSE | TRUE   | FALSE  | Opened_State  | FALSE      | FALSE       |
      | Opening_State | FALSE | FALSE | TRUE   | FALSE  | Opened_State  | FALSE      | FALSE       |
      | Opened_State  | FALSE | TRUE  | FALSE  | FALSE  | Waiting_State | FALSE      | FALSE       |
      | Closing_State | FALSE | TRUE  | FALSE  | TRUE   | Closed_State  | FALSE      | FALSE       |
      | Closing_State | FALSE | FALSE | FALSE  | TRUE   | Closed_State  | FALSE      | FALSE       |
      | Closed_State  | TRUE  | FALSE | FALSE  | TRUE   | Waiting_State | FALSE      | FALSE       |


