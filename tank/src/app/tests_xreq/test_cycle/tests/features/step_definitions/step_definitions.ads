with XReqLib.Args;

use XReqLib.Args;

package step_definitions is

   procedure Set_Up (Feature_File : in String);

   procedure Tear_Down (Feature_File : in String);

   --  @given ^Cycle is initialized$
   procedure Given_Cycle_is_initialized (Args : in out Arg_Type);

   --  @given ^State is (Init_State|Filling_P1_State|Filling_P2_State|Mixing_State|Emptying_State|End_Cycle_State)$
   procedure Given_State_N(Args : in out Arg_Type);

   --  @when ^End_Filling_P1 is (TRUE|FALSE) $
   procedure When_End_Filling_P1_is_N (Args : in out Arg_Type);

   --  @when ^End_Filling_P2 is (TRUE|FALSE) $
   procedure When_End_Filling_P2_is_N (Args : in out Arg_Type);

   --  @when ^End_Mixing is (TRUE|FALSE) $
   procedure When_End_Mixing_is_N (Args : in out Arg_Type);

   --  @when ^End_Emptying is (TRUE|FALSE)$
   procedure When_End_Emptying_is_N (Args : in out Arg_Type);

   --  @then ^New_state is (Init_State|Filling_P1_State|Filling_P2_State|Mixing_State|Emptying_State|End_Cycle_State) $
   procedure Then_New_state_N (Args : in out Arg_Type);

   --  @then ^Filling_P1_Order is (TRUE|FALSE) $
   procedure Then_Filling_P1_Order_is_N (Args : in out Arg_Type);

   --  @then ^Filling_P2_Order is (TRUE|FALSE) $
   procedure Then_Filling_P2_Order_is_N (Args : in out Arg_Type);

   --  @then ^Mixing_Order is (TRUE|FALSE) $
   procedure Then_Mixing_Order_is_N (Args : in out Arg_Type);

   --  @then ^Emptying_Order is (TRUE|FALSE)  $
   procedure Then_Emptying_Order_is_N (Args : in out Arg_Type);

   --  @then ^End_Cycle is (TRUE|FALSE)$
   procedure Then_End_Cycle_is_N (Args : in out Arg_Type);

end step_definitions;
