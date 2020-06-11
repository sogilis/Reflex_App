

with XReqLib.Args;

use XReqLib.Args;

package step_definitions is

   procedure Set_Up (Feature_File : in String);

   procedure Tear_Down (Feature_File : in String);

   --  @given ^filling component is initialized$
   procedure Given_filling_component_is_initialized (Args : in out Arg_Type);

   --  @given ^State is (Init_State|Openning_Valves_State|Running_Pumps_State|Filling_emptying_State|Closing_Valves_State|Stopping_Pumps_State|Waiting_State)$
   procedure Given_State_N (Args : in out Arg_Type);

   --  @when ^Start_Filling is (TRUE|FALSE) $
   procedure When_Start_Filling_is_N (Args : in out Arg_Type);

   --  @when ^Valves_Opened is (TRUE|FALSE) $
   procedure When_Valves_Opened_is_N(Args : in out Arg_Type);

   --  @when ^Valves_Closed is (TRUE|FALSE) $
   procedure When_Valves_Closed_is_N (Args : in out Arg_Type);

   --  @when ^Pumps_Started is (TRUE|FALSE) $
   procedure When_Pumps_Started_is_N (Args : in out Arg_Type);

   --  @when ^Level_P is (TRUE|FALSE)$
   procedure When_Level_P_is_N (Args : in out Arg_Type);

   --  @then ^New_state is (Init_State|Openning_Valves_State|Running_Pumps_State|Filling_emptying_State|Closing_Valves_State|Stopping_Pumps_State|Waiting_State) $
   procedure Then_New_state_is_N (Args : in out Arg_Type);

   --  @then ^Open_Valves is (TRUE|FALSE) $
   procedure Then_Open_Valves_is_N (Args : in out Arg_Type);

   --  @then ^Start_Pumps is (TRUE|FALSE) $
   procedure Then_Start_Pumps_is_N (Args : in out Arg_Type);

   --  @then ^Close_Valves is (TRUE|FALSE) $
   procedure Then_Close_Valves_is_N (Args : in out Arg_Type);

end step_definitions;
