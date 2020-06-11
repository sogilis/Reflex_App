

with XReqLib.Args;

use XReqLib.Args;

package step_definitions is

   procedure Set_Up (Feature_File : in String);

   procedure Tear_Down (Feature_File : in String);

   --  @given ^blender component is initialized$
   procedure Given_blender_component_is_initialized (Args : in out Arg_Type);

   --  @given ^State is (Init_State|Stop_State|Starting_State|Running_V1_State|Running_V2_State|Stopping_State)$
   procedure Given_State_N(Args : in out Arg_Type);

   --  @when ^Run is (FALSE|TRUE) $
   procedure When_Run_is_N (Args : in out Arg_Type);

   --  @when ^Speed_1 is (FALSE|TRUE) $
   procedure When_Speed_1_is_N (Args : in out Arg_Type);

   --  @when ^Speed_2 is (FALSE|TRUE) $
   procedure When_Speed_2_is_N (Args : in out Arg_Type);

   --  @then ^New_state is (Init_State|Stop_State|Starting_State|Running_V1_State|Running_V2_State|Stopping_State) $
   procedure Then_New_state_is_N (Args : in out Arg_Type);

   --  @then ^Run_Order is (FALSE|TRUE) $
   procedure Then_Run_Order_is_N (Args : in out Arg_Type);

   --  @then ^v1_Order is (FALSE|TRUE) $
   procedure Then_v1_Order_is_N (Args : in out Arg_Type);

   --  @then ^v2_Order is (FALSE|TRUE) $
   procedure Then_v2_Order_is_N (Args : in out Arg_Type);

end step_definitions;
