Feature: test-state Feature

Background:
Given blender component is initialized

  Scenario: Eating
    Given State is Init_State
    When Start_Mixing is TRUE And Blender_Started is FALSE And Mixing_Duration is 2 
    Then New_state is Mix_State And Start_Blender is FALSE And Start_Resistance is FALSE And End_Mixing is FALSE




