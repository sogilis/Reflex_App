

with XReqLib.Args;

use XReqLib.Args;

package step_definitions is

   procedure Set_Up (Feature_File : in String);

   procedure Tear_Down (Feature_File : in String);

   --  @given ^Mixing app is initialized$
   procedure Given_Mixing_app_is_initialized (Args : in out Arg_Type);

   --  @given ^State is (Init_State|Mix_State|It_Mixes_State|End_Mixing_State)$
   procedure Given_State_is_N (Args : in out Arg_Type);

   --  @when ^Blender_Started is (TRUE|FALSE) $
   procedure When_Blender_Started_is_N (Args : in out Arg_Type);

   --  @when ^Start_Mixing is (TRUE|FALSE) $
   procedure When_Start_Mixing_is_N (Args : in out Arg_Type);

   --  @then ^End_Mixing is (TRUE|FALSE)$
   procedure Then_End_Mixing_is_N (Args : in out Arg_Type);

   --  @then ^New_state is (Init_State|Mix_State|It_Mixes_State|End_Mixing_State)$
   procedure Then_New_state_is_N (Args : in out Arg_Type);

   --  @then ^Start_Resistance is (TRUE|FALSE)$
   procedure Then_Start_Resistance_is_N (Args : in out Arg_Type);

   --  @then ^Start_Blender is (TRUE|FALSE) $
   procedure Then_Start_Blender_is_N (Args : in out Arg_Type);

end step_definitions;
