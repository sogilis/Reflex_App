with XReqLib.Args;

use XReqLib.Args;

package step_definitions is

   procedure Set_Up (Feature_File : in String);

   procedure Tear_Down (Feature_File : in String);

   --  @given ^Application is initialized$
   procedure Given_Application_is_initialized (Args : in out Arg_Type);

   --  @given ^State is Init_State$
   procedure Given_State_Init_State(Args : in out Arg_Type);

   --  @given ^State is (Filling_P1_State|Filling_P2_State|Mixing_State|Emptying_State|End_Cycle_State)$
   procedure Given_State_cycle_N(Args : in out Arg_Type);

   --  @when ^End_Filling_P1 is (TRUE|FALSE)$
   procedure When_End_Filling_P1_is_N (Args : in out Arg_Type);

   --  @when ^End_Filling_P2 is (TRUE|FALSE)$
   procedure When_End_Filling_P2_is_N (Args : in out Arg_Type);

   --  @when ^End_Mixing is (TRUE|FALSE)$
   procedure When_End_Mixing_is_N (Args : in out Arg_Type);

   --  @when ^End_Emptying is (TRUE|FALSE)$
   procedure When_End_Emptying_is_N (Args : in out Arg_Type);

   --  @then ^New_state is (Init_State|Filling_P1_State|Filling_P2_State|Mixing_State|Emptying_State|End_Cycle_State)$
   procedure Then_New_state_cycle_N (Args : in out Arg_Type);

   --  @then ^Filling_P1_Order is (TRUE|FALSE)$
   procedure Then_Filling_P1_Order_is_N (Args : in out Arg_Type);

   --  @then ^Filling_P2_Order is (TRUE|FALSE)$
   procedure Then_Filling_P2_Order_is_N (Args : in out Arg_Type);

   --  @then ^Mixing_Order is (TRUE|FALSE)$
   procedure Then_Mixing_Order_is_N (Args : in out Arg_Type);

   --  @then ^Emptying_Order is (TRUE|FALSE)$
   procedure Then_Emptying_Order_is_N (Args : in out Arg_Type);

   --  @then ^End_Cycle is (TRUE|FALSE)$
   procedure Then_End_Cycle_is_N (Args : in out Arg_Type);

   --  @then ^Start_Filling is (TRUE|FALSE)$
   procedure Then_Start_Filling_is_N (Args : in out Arg_Type);

   --  @then ^Close_Valves is (TRUE|FALSE)$
   procedure Then_Close_Valves_is_N (Args : in out Arg_Type);

   --  @then ^Open_Valves is (TRUE|FALSE)$
   procedure Then_Open_Valves_is_N (Args : in out Arg_Type);

   --  @when ^Level_P is (TRUE|FALSE)$
   procedure When_Level_P_is_N (Args : in out Arg_Type);

   --  @then ^Start_Pumps is (TRUE|FALSE)$
   procedure Then_Start_Pumps_is_N (Args : in out Arg_Type);

   --  @given ^State is (Openning_Valves_State|Running_Pumps_State|Filling_emptying_State|Closing_Valves_State|Stopping_Pumps_State)$
   procedure Given_State_filling_is_N (Args : in out Arg_Type);

   --  @then ^New_state is (Openning_Valves_State|Running_Pumps_State|Filling_emptying_State|Closing_Valves_State|Stopping_Pumps_State)$
   procedure Then_New_state_filling_is_N (Args : in out Arg_Type);

   --  @when ^Valves_Opened is (TRUE|FALSE)$
   procedure When_Valves_Opened_is_N (Args : in out Arg_Type);

   --  @when ^Pumps_Started is (TRUE|FALSE)$
   procedure When_Pumps_Started_is_N (Args : in out Arg_Type);

   --  @when ^Valves_Closed is (TRUE|FALSE)$
   procedure When_Valves_Closed_is_N (Args : in out Arg_Type);

   --  @given ^State is (Closed_State|Closing_State|Opened_State|Opening_State|Waiting_State)$
   procedure Given_State_valve_is_N (Args : in out Arg_Type);

   --  @when ^Opened is (TRUE|FALSE) $
   procedure When_Opened_is_N (Args : in out Arg_Type);

   --  @then ^New_state is (Closed_State|Closing_State|Opened_State|Opening_State|Waiting_State)$
   procedure Then_New_state_valve_is_N (Args : in out Arg_Type);

   --  @when ^Closed is (TRUE|FALSE)$
   procedure When_Closed_is_N (Args : in out Arg_Type);

   --  @when ^Close is (TRUE|FALSE)$
   procedure When_Close_is_N (Args : in out Arg_Type);


   --  @then ^Open_Order is (TRUE|FALSE)$
   procedure Then_Open_Order_is_N (Args : in out Arg_Type);

   --  @then ^Close_Order is (TRUE|FALSE)$
   procedure Then_Close_Order_is_N (Args : in out Arg_Type);

end step_definitions;
