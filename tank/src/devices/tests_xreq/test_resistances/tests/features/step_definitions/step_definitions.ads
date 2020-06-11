

with XReqLib.Args;

use XReqLib.Args;

package step_definitions is

   procedure Set_Up (Feature_File : in String);

   procedure Tear_Down (Feature_File : in String);

   --  @given ^resistance component is initialized$
   procedure Given_resistance_component_is_initialized (Args : in out Arg_Type);

   --  @given ^State is (Init_State|Waiting_State|Running_State) $
   procedure Given_State_is_N(Args : in out Arg_Type);

   --  @when ^Run is (TRUE|FALSE) $
   procedure When_Run_is_N (Args : in out Arg_Type);

   --  @when ^T_Regul is ([0-9]+|\${\S+}) $
   procedure When_T_Regul_is_N (Args : in out Arg_Type);

   --  @when ^Set_Point is ([0-9]+|\${\S+})$
   procedure When_Set_Point_is_N (Args : in out Arg_Type);

   --  @then ^New_state is (Init_State|Waiting_State|Running_State) $
   procedure Then_New_state_N(Args : in out Arg_Type);




end step_definitions;
