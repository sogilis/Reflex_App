Feature: test-state Feature

Background:

  Scenario Outline: regul
    Given second is <Second> Gradient is <Gradient> Tmax is <Tmax>
    When T_sensor is <T_sensor> And Set_Point is <Set_Point> 
    Then T_Adjusted is <T_Adjusted>  

    Examples:
      | Second | Gradient | Tmax | T_sensor | Set_Point | T_Adjusted | 
      | TRUE   | 60       | 80   |  20      | 40        |  52,5      |



