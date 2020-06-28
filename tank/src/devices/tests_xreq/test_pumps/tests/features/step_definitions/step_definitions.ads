
with XReqLib.Args;

use XReqLib.Args;

package step_definitions is

   procedure Set_Up (Feature_File : in String);

   procedure Tear_Down (Feature_File : in String);

   --  @given ^Pump component is initialized$
   procedure Given_Pump_component_is_initialized (Args : in out Arg_Type);

   --  @given ^State is (Stop_State|Run_State|Running_State|Stopping_State)$
   procedure Given_State_N(Args : in out Arg_Type);

   --  @when ^Run is (TRUE|FALSE) $
   procedure When_Run_is_N (Args : in out Arg_Type);

   --  @when ^Running is (TRUE|FALSE)$
   procedure When_Running_is_N (Args : in out Arg_Type);

   --  @then ^New_state is (Stop_State|Run_State|Running_State|Stopping_State) $
   procedure Then_New_state_is_N (Args : in out Arg_Type);

   --  @then ^Run_Order is (TRUE|FALSE) $
   procedure Then_Run_Order_is_N (Args : in out Arg_Type);


end step_definitions;
