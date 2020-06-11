

with XReqLib.Args;

use XReqLib.Args;

package step_definitions is

   procedure Set_Up (Feature_File : in String);

   procedure Tear_Down (Feature_File : in String);

   --  @given ^valve component is initialized$
   procedure Given_valve_component_is_initialized (Args : in out Arg_Type);

   --  @given ^State is (Init_State|Closed_State|Closing_State|Opened_State|Opening_State|Waiting_State)$
   procedure Given_State_N(Args : in out Arg_Type);
   --  @then ^New_State is (Init_State|Closed_State|Closing_State|Opened_State|Opening_State|Waiting_State) $
   procedure Then_New_state_N(Args : in out Arg_Type);

   --  @then ^Close_Order is (TRUE|FALSE) $
   procedure Then_Close_Order_is_N (Args : in out Arg_Type);

   --  @when ^Opened is (TRUE|FALSE) $
   procedure When_Opened_is_N(Args : in out Arg_Type);

   --  @when ^Close is (TRUE|FALSE) $
   procedure When_Close_is_N (Args : in out Arg_Type);

   --  @then ^Open_Order is (TRUE|FALSE) $
   procedure Then_Open_Order_is_N (Args : in out Arg_Type);

   --  @when ^Open is (TRUE|FALSE) $
   procedure When_Open_is_N (Args : in out Arg_Type);

   --  @when ^Closed is (TRUE|FALSE)$
   procedure When_Closed_is_N (Args : in out Arg_Type);


end step_definitions;
