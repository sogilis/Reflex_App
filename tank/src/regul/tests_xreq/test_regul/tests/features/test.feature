Feature: test-state Feature

Background:

  Scenario Outline: regul
    Given Gradient is <Gradient>
    And Tmax is <Tmax>

    When T_sensor is <T_sensor>
    And Set_Point is <Set_Point>

    Then T_Adjusted is <T_Adjusted>

    Examples:
      | Gradient | Tmax | T_sensor | Set_Point | T_Adjusted   | 
      | 60       | 80   |  20      | 40        | 5.25000E+01  |



