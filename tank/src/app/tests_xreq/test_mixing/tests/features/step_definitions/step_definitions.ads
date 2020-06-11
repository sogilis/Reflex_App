

with XReqLib.Args;

use XReqLib.Args;

package step_definitions is

   procedure Set_Up (Feature_File : in String);

   procedure Tear_Down (Feature_File : in String);


   --  @given ^blender component is initialized$
   procedure Given_blender_component_is_initialized (Args : in out Arg_Type);

   --  @given ^State is State$
   procedure Given_State_is_State (Args : in out Arg_Type);

   --  @then ^New_state is New_State $
   procedure Then_New_state_is_New_State (Args : in out Arg_Type);

   --  @when ^Transition is Run And Transition is Speed_1 And Transition is Speed_2 $
   procedure When_Transition_is_Run_And_Transition_is_Speed_1_And_Transition_is_Speed_2 (Args : in out Arg_Type);

   --  @given ^State is Init_State$
   procedure Given_State_is_Init_State (Args : in out Arg_Type);

   --  @when ^Start_Mixing is TRUE And Blender_Started is FALSE And Mixing_Duration is 2 $
   procedure When_Start_Mixing_is_TRUE_And_Blender_Started_is_FALSE_And_Mixing_Duration_is_2 (Args : in out Arg_Type);

   --  @then ^New_state is Mix_State And Start_Blender is FALSE And Start_Resistance is FALSE And End_Mixing is FALSE$
   procedure Then_New_state_is_Mix_State_And_Start_Blender_is_FALSE_And_Start_Resistance_is_FALSE_And_End_Mixing_is_FALSE (Args : in out Arg_Type);

end step_definitions;
