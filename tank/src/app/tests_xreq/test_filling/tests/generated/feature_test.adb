with step_definitions; use step_definitions;

pragma Style_Checks (Off);
with Ada.Strings.Unbounded;
with XReqLib.Args;
with XReqLib.Register;
use  XReqLib.Args;
use  XReqLib.Register;
package body feature_test is

   Str_Feature    : constant String := "Feature:";
   Str_Scenario   : constant String := "Scenario:";
   Str_Outline    : constant String := "Scenario Outline:";
   Str_Examples   : constant String := "Examples:";

   procedure Background (Format     : in     Format_Ptr;
                         Report     : in out Report_Type;
                         Stop       : in out Boolean;
                         Count_Mode : in     Boolean := False)

   is
      Fail : Boolean := Stop;

   begin
      Fail := Stop;
      if Count_Mode then
         Report.Num_Steps := Report.Num_Steps + 1;
      else
         Format.Start_Background ("", "./features/test.feature:3");
         Format.Begin_Background;
         Format.Put_Background;
         --
         -- Given filling component is initialized
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "filling component is initialized";
            Pos    : constant String    := "./features/test.feature:4";
         begin
            Make (Args, "filling component is initialized");
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Given_filling_component_is_initialized (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         Format.End_Background;
         --------------------
         --  Finalization  --
         --------------------
         Stop := Fail;
         Format.Stop_Background;
      end if;
   end Background;


   procedure Scenario_state_TC_1 (Format     : in     Format_Ptr;
                                  Report     : in out Report_Type;
                                  Stop       : in out Boolean;
                                  Tags       : in XReqLib.Format.Tag_Array_Type;
                                  Fail       : in out Boolean;
                                  Count_Mode : in     Boolean := False)

   is
   begin
      if Count_Mode then
         Background (Format, Report, Stop, True);
         Report.Num_Steps := Report.Num_Steps + 10;
      else
         Format.Start_Scenario ("state (1/7)", "./features/test.feature:6", Tags);
         Format.Enter_Scenario;
         Call_Hook (Hook_Begin, Hook_Scenario);

         --------------
         --  Set_Up  --
         --------------

         Set_Up ("./features/test.feature");
         Fail := Stop;

         ------------------
         --  Background  --
         ------------------

         Background (Format, Report, Stop, Count_Mode);
         Fail := Stop;

         ----------------
         --  Scenario  --
         ----------------

         Format.Begin_Scenario;
         --
         -- Given State is Init_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "State is Init_State";
            Pos    : constant String    := "./features/test.feature:7";
         begin
            Make (Args, "State is Init_State");
            Add_Match (Args, 10, 19);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Given_State_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Start_Filling is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Start_Filling is TRUE ";
            Pos    : constant String    := "./features/test.feature:9";
         begin
            Make (Args, "Start_Filling is TRUE ");
            Add_Match (Args, 18, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Start_Filling_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Valves_Opened is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Valves_Opened is FALSE ";
            Pos    : constant String    := "./features/test.feature:10";
         begin
            Make (Args, "Valves_Opened is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Valves_Opened_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Valves_Closed is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Valves_Closed is FALSE ";
            Pos    : constant String    := "./features/test.feature:11";
         begin
            Make (Args, "Valves_Closed is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Valves_Closed_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Pumps_Started is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Pumps_Started is FALSE ";
            Pos    : constant String    := "./features/test.feature:12";
         begin
            Make (Args, "Pumps_Started is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Pumps_Started_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Level_P is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Level_P is FALSE";
            Pos    : constant String    := "./features/test.feature:13";
         begin
            Make (Args, "Level_P is FALSE");
            Add_Match (Args, 12, 16);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Level_P_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then New_state is Openning_Valves_State 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "New_state is Openning_Valves_State ";
            Pos    : constant String    := "./features/test.feature:15";
         begin
            Make (Args, "New_state is Openning_Valves_State ");
            Add_Match (Args, 14, 34);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_New_state_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then Open_Valves is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Open_Valves is TRUE ";
            Pos    : constant String    := "./features/test.feature:16";
         begin
            Make (Args, "Open_Valves is TRUE ");
            Add_Match (Args, 16, 19);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Open_Valves_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then Start_Pumps is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Start_Pumps is FALSE ";
            Pos    : constant String    := "./features/test.feature:17";
         begin
            Make (Args, "Start_Pumps is FALSE ");
            Add_Match (Args, 16, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Start_Pumps_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then Close_Valves is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Close_Valves is FALSE ";
            Pos    : constant String    := "./features/test.feature:18";
         begin
            Make (Args, "Close_Valves is FALSE ");
            Add_Match (Args, 17, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Close_Valves_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;

         --------------------
         --  Finalization  --
         --------------------

         Call_Hook (Hook_End, Hook_Scenario);
         if Fail then
            Report.Count_Scenario_Failed := Report.Count_Scenario_Failed + 1;
         Format.End_Scenario (Status_Failed);
         else
            Report.Count_Scenario_Passed := Report.Count_Scenario_Passed + 1;
         Format.End_Scenario (Status_Passed);
         end if;

         -----------------
         --  Tear_Down  --
         -----------------

         Tear_Down ("./features/test.feature");
         Fail := Stop;
         Format.Stop_Scenario;
      end if;
   end Scenario_state_TC_1;

   procedure Scenario_state_TC_2 (Format     : in     Format_Ptr;
                                  Report     : in out Report_Type;
                                  Stop       : in out Boolean;
                                  Tags       : in XReqLib.Format.Tag_Array_Type;
                                  Fail       : in out Boolean;
                                  Count_Mode : in     Boolean := False)

   is
   begin
      if Count_Mode then
         Background (Format, Report, Stop, True);
         Report.Num_Steps := Report.Num_Steps + 10;
      else
         Format.Start_Scenario ("state (2/7)", "./features/test.feature:6", Tags);
         Format.Enter_Scenario;
         Call_Hook (Hook_Begin, Hook_Scenario);

         --------------
         --  Set_Up  --
         --------------

         Set_Up ("./features/test.feature");
         Fail := Stop;

         ------------------
         --  Background  --
         ------------------

         Background (Format, Report, Stop, Count_Mode);
         Fail := Stop;

         ----------------
         --  Scenario  --
         ----------------

         Format.Begin_Scenario;
         --
         -- Given State is Openning_Valves_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "State is Openning_Valves_State";
            Pos    : constant String    := "./features/test.feature:7";
         begin
            Make (Args, "State is Openning_Valves_State");
            Add_Match (Args, 10, 30);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Given_State_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Start_Filling is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Start_Filling is TRUE ";
            Pos    : constant String    := "./features/test.feature:9";
         begin
            Make (Args, "Start_Filling is TRUE ");
            Add_Match (Args, 18, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Start_Filling_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Valves_Opened is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Valves_Opened is TRUE ";
            Pos    : constant String    := "./features/test.feature:10";
         begin
            Make (Args, "Valves_Opened is TRUE ");
            Add_Match (Args, 18, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Valves_Opened_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Valves_Closed is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Valves_Closed is FALSE ";
            Pos    : constant String    := "./features/test.feature:11";
         begin
            Make (Args, "Valves_Closed is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Valves_Closed_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Pumps_Started is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Pumps_Started is FALSE ";
            Pos    : constant String    := "./features/test.feature:12";
         begin
            Make (Args, "Pumps_Started is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Pumps_Started_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Level_P is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Level_P is FALSE";
            Pos    : constant String    := "./features/test.feature:13";
         begin
            Make (Args, "Level_P is FALSE");
            Add_Match (Args, 12, 16);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Level_P_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then New_state is Running_Pumps_State 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "New_state is Running_Pumps_State ";
            Pos    : constant String    := "./features/test.feature:15";
         begin
            Make (Args, "New_state is Running_Pumps_State ");
            Add_Match (Args, 14, 32);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_New_state_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then Open_Valves is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Open_Valves is FALSE ";
            Pos    : constant String    := "./features/test.feature:16";
         begin
            Make (Args, "Open_Valves is FALSE ");
            Add_Match (Args, 16, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Open_Valves_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then Start_Pumps is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Start_Pumps is TRUE ";
            Pos    : constant String    := "./features/test.feature:17";
         begin
            Make (Args, "Start_Pumps is TRUE ");
            Add_Match (Args, 16, 19);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Start_Pumps_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then Close_Valves is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Close_Valves is FALSE ";
            Pos    : constant String    := "./features/test.feature:18";
         begin
            Make (Args, "Close_Valves is FALSE ");
            Add_Match (Args, 17, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Close_Valves_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;

         --------------------
         --  Finalization  --
         --------------------

         Call_Hook (Hook_End, Hook_Scenario);
         if Fail then
            Report.Count_Scenario_Failed := Report.Count_Scenario_Failed + 1;
         Format.End_Scenario (Status_Failed);
         else
            Report.Count_Scenario_Passed := Report.Count_Scenario_Passed + 1;
         Format.End_Scenario (Status_Passed);
         end if;

         -----------------
         --  Tear_Down  --
         -----------------

         Tear_Down ("./features/test.feature");
         Fail := Stop;
         Format.Stop_Scenario;
      end if;
   end Scenario_state_TC_2;

   procedure Scenario_state_TC_3 (Format     : in     Format_Ptr;
                                  Report     : in out Report_Type;
                                  Stop       : in out Boolean;
                                  Tags       : in XReqLib.Format.Tag_Array_Type;
                                  Fail       : in out Boolean;
                                  Count_Mode : in     Boolean := False)

   is
   begin
      if Count_Mode then
         Background (Format, Report, Stop, True);
         Report.Num_Steps := Report.Num_Steps + 10;
      else
         Format.Start_Scenario ("state (3/7)", "./features/test.feature:6", Tags);
         Format.Enter_Scenario;
         Call_Hook (Hook_Begin, Hook_Scenario);

         --------------
         --  Set_Up  --
         --------------

         Set_Up ("./features/test.feature");
         Fail := Stop;

         ------------------
         --  Background  --
         ------------------

         Background (Format, Report, Stop, Count_Mode);
         Fail := Stop;

         ----------------
         --  Scenario  --
         ----------------

         Format.Begin_Scenario;
         --
         -- Given State is Running_Pumps_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "State is Running_Pumps_State";
            Pos    : constant String    := "./features/test.feature:7";
         begin
            Make (Args, "State is Running_Pumps_State");
            Add_Match (Args, 10, 28);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Given_State_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Start_Filling is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Start_Filling is TRUE ";
            Pos    : constant String    := "./features/test.feature:9";
         begin
            Make (Args, "Start_Filling is TRUE ");
            Add_Match (Args, 18, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Start_Filling_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Valves_Opened is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Valves_Opened is FALSE ";
            Pos    : constant String    := "./features/test.feature:10";
         begin
            Make (Args, "Valves_Opened is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Valves_Opened_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Valves_Closed is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Valves_Closed is FALSE ";
            Pos    : constant String    := "./features/test.feature:11";
         begin
            Make (Args, "Valves_Closed is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Valves_Closed_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Pumps_Started is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Pumps_Started is TRUE ";
            Pos    : constant String    := "./features/test.feature:12";
         begin
            Make (Args, "Pumps_Started is TRUE ");
            Add_Match (Args, 18, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Pumps_Started_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Level_P is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Level_P is FALSE";
            Pos    : constant String    := "./features/test.feature:13";
         begin
            Make (Args, "Level_P is FALSE");
            Add_Match (Args, 12, 16);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Level_P_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then New_state is Filling_emptying_State 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "New_state is Filling_emptying_State ";
            Pos    : constant String    := "./features/test.feature:15";
         begin
            Make (Args, "New_state is Filling_emptying_State ");
            Add_Match (Args, 14, 35);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_New_state_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then Open_Valves is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Open_Valves is FALSE ";
            Pos    : constant String    := "./features/test.feature:16";
         begin
            Make (Args, "Open_Valves is FALSE ");
            Add_Match (Args, 16, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Open_Valves_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then Start_Pumps is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Start_Pumps is TRUE ";
            Pos    : constant String    := "./features/test.feature:17";
         begin
            Make (Args, "Start_Pumps is TRUE ");
            Add_Match (Args, 16, 19);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Start_Pumps_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then Close_Valves is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Close_Valves is FALSE ";
            Pos    : constant String    := "./features/test.feature:18";
         begin
            Make (Args, "Close_Valves is FALSE ");
            Add_Match (Args, 17, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Close_Valves_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;

         --------------------
         --  Finalization  --
         --------------------

         Call_Hook (Hook_End, Hook_Scenario);
         if Fail then
            Report.Count_Scenario_Failed := Report.Count_Scenario_Failed + 1;
         Format.End_Scenario (Status_Failed);
         else
            Report.Count_Scenario_Passed := Report.Count_Scenario_Passed + 1;
         Format.End_Scenario (Status_Passed);
         end if;

         -----------------
         --  Tear_Down  --
         -----------------

         Tear_Down ("./features/test.feature");
         Fail := Stop;
         Format.Stop_Scenario;
      end if;
   end Scenario_state_TC_3;

   procedure Scenario_state_TC_4 (Format     : in     Format_Ptr;
                                  Report     : in out Report_Type;
                                  Stop       : in out Boolean;
                                  Tags       : in XReqLib.Format.Tag_Array_Type;
                                  Fail       : in out Boolean;
                                  Count_Mode : in     Boolean := False)

   is
   begin
      if Count_Mode then
         Background (Format, Report, Stop, True);
         Report.Num_Steps := Report.Num_Steps + 10;
      else
         Format.Start_Scenario ("state (4/7)", "./features/test.feature:6", Tags);
         Format.Enter_Scenario;
         Call_Hook (Hook_Begin, Hook_Scenario);

         --------------
         --  Set_Up  --
         --------------

         Set_Up ("./features/test.feature");
         Fail := Stop;

         ------------------
         --  Background  --
         ------------------

         Background (Format, Report, Stop, Count_Mode);
         Fail := Stop;

         ----------------
         --  Scenario  --
         ----------------

         Format.Begin_Scenario;
         --
         -- Given State is Filling_emptying_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "State is Filling_emptying_State";
            Pos    : constant String    := "./features/test.feature:7";
         begin
            Make (Args, "State is Filling_emptying_State");
            Add_Match (Args, 10, 31);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Given_State_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Start_Filling is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Start_Filling is TRUE ";
            Pos    : constant String    := "./features/test.feature:9";
         begin
            Make (Args, "Start_Filling is TRUE ");
            Add_Match (Args, 18, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Start_Filling_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Valves_Opened is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Valves_Opened is FALSE ";
            Pos    : constant String    := "./features/test.feature:10";
         begin
            Make (Args, "Valves_Opened is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Valves_Opened_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Valves_Closed is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Valves_Closed is FALSE ";
            Pos    : constant String    := "./features/test.feature:11";
         begin
            Make (Args, "Valves_Closed is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Valves_Closed_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Pumps_Started is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Pumps_Started is TRUE ";
            Pos    : constant String    := "./features/test.feature:12";
         begin
            Make (Args, "Pumps_Started is TRUE ");
            Add_Match (Args, 18, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Pumps_Started_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Level_P is TRUE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Level_P is TRUE";
            Pos    : constant String    := "./features/test.feature:13";
         begin
            Make (Args, "Level_P is TRUE");
            Add_Match (Args, 12, 15);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Level_P_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then New_state is Stopping_Pumps_State 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "New_state is Stopping_Pumps_State ";
            Pos    : constant String    := "./features/test.feature:15";
         begin
            Make (Args, "New_state is Stopping_Pumps_State ");
            Add_Match (Args, 14, 33);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_New_state_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then Open_Valves is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Open_Valves is FALSE ";
            Pos    : constant String    := "./features/test.feature:16";
         begin
            Make (Args, "Open_Valves is FALSE ");
            Add_Match (Args, 16, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Open_Valves_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then Start_Pumps is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Start_Pumps is FALSE ";
            Pos    : constant String    := "./features/test.feature:17";
         begin
            Make (Args, "Start_Pumps is FALSE ");
            Add_Match (Args, 16, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Start_Pumps_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then Close_Valves is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Close_Valves is FALSE ";
            Pos    : constant String    := "./features/test.feature:18";
         begin
            Make (Args, "Close_Valves is FALSE ");
            Add_Match (Args, 17, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Close_Valves_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;

         --------------------
         --  Finalization  --
         --------------------

         Call_Hook (Hook_End, Hook_Scenario);
         if Fail then
            Report.Count_Scenario_Failed := Report.Count_Scenario_Failed + 1;
         Format.End_Scenario (Status_Failed);
         else
            Report.Count_Scenario_Passed := Report.Count_Scenario_Passed + 1;
         Format.End_Scenario (Status_Passed);
         end if;

         -----------------
         --  Tear_Down  --
         -----------------

         Tear_Down ("./features/test.feature");
         Fail := Stop;
         Format.Stop_Scenario;
      end if;
   end Scenario_state_TC_4;

   procedure Scenario_state_TC_5 (Format     : in     Format_Ptr;
                                  Report     : in out Report_Type;
                                  Stop       : in out Boolean;
                                  Tags       : in XReqLib.Format.Tag_Array_Type;
                                  Fail       : in out Boolean;
                                  Count_Mode : in     Boolean := False)

   is
   begin
      if Count_Mode then
         Background (Format, Report, Stop, True);
         Report.Num_Steps := Report.Num_Steps + 10;
      else
         Format.Start_Scenario ("state (5/7)", "./features/test.feature:6", Tags);
         Format.Enter_Scenario;
         Call_Hook (Hook_Begin, Hook_Scenario);

         --------------
         --  Set_Up  --
         --------------

         Set_Up ("./features/test.feature");
         Fail := Stop;

         ------------------
         --  Background  --
         ------------------

         Background (Format, Report, Stop, Count_Mode);
         Fail := Stop;

         ----------------
         --  Scenario  --
         ----------------

         Format.Begin_Scenario;
         --
         -- Given State is Stopping_Pumps_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "State is Stopping_Pumps_State";
            Pos    : constant String    := "./features/test.feature:7";
         begin
            Make (Args, "State is Stopping_Pumps_State");
            Add_Match (Args, 10, 29);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Given_State_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Start_Filling is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Start_Filling is TRUE ";
            Pos    : constant String    := "./features/test.feature:9";
         begin
            Make (Args, "Start_Filling is TRUE ");
            Add_Match (Args, 18, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Start_Filling_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Valves_Opened is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Valves_Opened is FALSE ";
            Pos    : constant String    := "./features/test.feature:10";
         begin
            Make (Args, "Valves_Opened is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Valves_Opened_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Valves_Closed is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Valves_Closed is FALSE ";
            Pos    : constant String    := "./features/test.feature:11";
         begin
            Make (Args, "Valves_Closed is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Valves_Closed_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Pumps_Started is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Pumps_Started is FALSE ";
            Pos    : constant String    := "./features/test.feature:12";
         begin
            Make (Args, "Pumps_Started is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Pumps_Started_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Level_P is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Level_P is FALSE";
            Pos    : constant String    := "./features/test.feature:13";
         begin
            Make (Args, "Level_P is FALSE");
            Add_Match (Args, 12, 16);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Level_P_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then New_state is Closing_Valves_State 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "New_state is Closing_Valves_State ";
            Pos    : constant String    := "./features/test.feature:15";
         begin
            Make (Args, "New_state is Closing_Valves_State ");
            Add_Match (Args, 14, 33);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_New_state_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then Open_Valves is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Open_Valves is FALSE ";
            Pos    : constant String    := "./features/test.feature:16";
         begin
            Make (Args, "Open_Valves is FALSE ");
            Add_Match (Args, 16, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Open_Valves_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then Start_Pumps is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Start_Pumps is FALSE ";
            Pos    : constant String    := "./features/test.feature:17";
         begin
            Make (Args, "Start_Pumps is FALSE ");
            Add_Match (Args, 16, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Start_Pumps_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then Close_Valves is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Close_Valves is TRUE ";
            Pos    : constant String    := "./features/test.feature:18";
         begin
            Make (Args, "Close_Valves is TRUE ");
            Add_Match (Args, 17, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Close_Valves_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;

         --------------------
         --  Finalization  --
         --------------------

         Call_Hook (Hook_End, Hook_Scenario);
         if Fail then
            Report.Count_Scenario_Failed := Report.Count_Scenario_Failed + 1;
         Format.End_Scenario (Status_Failed);
         else
            Report.Count_Scenario_Passed := Report.Count_Scenario_Passed + 1;
         Format.End_Scenario (Status_Passed);
         end if;

         -----------------
         --  Tear_Down  --
         -----------------

         Tear_Down ("./features/test.feature");
         Fail := Stop;
         Format.Stop_Scenario;
      end if;
   end Scenario_state_TC_5;

   procedure Scenario_state_TC_6 (Format     : in     Format_Ptr;
                                  Report     : in out Report_Type;
                                  Stop       : in out Boolean;
                                  Tags       : in XReqLib.Format.Tag_Array_Type;
                                  Fail       : in out Boolean;
                                  Count_Mode : in     Boolean := False)

   is
   begin
      if Count_Mode then
         Background (Format, Report, Stop, True);
         Report.Num_Steps := Report.Num_Steps + 10;
      else
         Format.Start_Scenario ("state (6/7)", "./features/test.feature:6", Tags);
         Format.Enter_Scenario;
         Call_Hook (Hook_Begin, Hook_Scenario);

         --------------
         --  Set_Up  --
         --------------

         Set_Up ("./features/test.feature");
         Fail := Stop;

         ------------------
         --  Background  --
         ------------------

         Background (Format, Report, Stop, Count_Mode);
         Fail := Stop;

         ----------------
         --  Scenario  --
         ----------------

         Format.Begin_Scenario;
         --
         -- Given State is Closing_Valves_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "State is Closing_Valves_State";
            Pos    : constant String    := "./features/test.feature:7";
         begin
            Make (Args, "State is Closing_Valves_State");
            Add_Match (Args, 10, 29);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Given_State_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Start_Filling is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Start_Filling is TRUE ";
            Pos    : constant String    := "./features/test.feature:9";
         begin
            Make (Args, "Start_Filling is TRUE ");
            Add_Match (Args, 18, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Start_Filling_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Valves_Opened is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Valves_Opened is FALSE ";
            Pos    : constant String    := "./features/test.feature:10";
         begin
            Make (Args, "Valves_Opened is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Valves_Opened_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Valves_Closed is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Valves_Closed is TRUE ";
            Pos    : constant String    := "./features/test.feature:11";
         begin
            Make (Args, "Valves_Closed is TRUE ");
            Add_Match (Args, 18, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Valves_Closed_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Pumps_Started is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Pumps_Started is FALSE ";
            Pos    : constant String    := "./features/test.feature:12";
         begin
            Make (Args, "Pumps_Started is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Pumps_Started_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Level_P is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Level_P is FALSE";
            Pos    : constant String    := "./features/test.feature:13";
         begin
            Make (Args, "Level_P is FALSE");
            Add_Match (Args, 12, 16);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Level_P_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then New_state is Waiting_State 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "New_state is Waiting_State ";
            Pos    : constant String    := "./features/test.feature:15";
         begin
            Make (Args, "New_state is Waiting_State ");
            Add_Match (Args, 14, 26);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_New_state_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then Open_Valves is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Open_Valves is FALSE ";
            Pos    : constant String    := "./features/test.feature:16";
         begin
            Make (Args, "Open_Valves is FALSE ");
            Add_Match (Args, 16, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Open_Valves_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then Start_Pumps is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Start_Pumps is FALSE ";
            Pos    : constant String    := "./features/test.feature:17";
         begin
            Make (Args, "Start_Pumps is FALSE ");
            Add_Match (Args, 16, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Start_Pumps_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then Close_Valves is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Close_Valves is FALSE ";
            Pos    : constant String    := "./features/test.feature:18";
         begin
            Make (Args, "Close_Valves is FALSE ");
            Add_Match (Args, 17, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Close_Valves_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;

         --------------------
         --  Finalization  --
         --------------------

         Call_Hook (Hook_End, Hook_Scenario);
         if Fail then
            Report.Count_Scenario_Failed := Report.Count_Scenario_Failed + 1;
         Format.End_Scenario (Status_Failed);
         else
            Report.Count_Scenario_Passed := Report.Count_Scenario_Passed + 1;
         Format.End_Scenario (Status_Passed);
         end if;

         -----------------
         --  Tear_Down  --
         -----------------

         Tear_Down ("./features/test.feature");
         Fail := Stop;
         Format.Stop_Scenario;
      end if;
   end Scenario_state_TC_6;

   procedure Scenario_state_TC_7 (Format     : in     Format_Ptr;
                                  Report     : in out Report_Type;
                                  Stop       : in out Boolean;
                                  Tags       : in XReqLib.Format.Tag_Array_Type;
                                  Fail       : in out Boolean;
                                  Count_Mode : in     Boolean := False)

   is
   begin
      if Count_Mode then
         Background (Format, Report, Stop, True);
         Report.Num_Steps := Report.Num_Steps + 10;
      else
         Format.Start_Scenario ("state (7/7)", "./features/test.feature:6", Tags);
         Format.Enter_Scenario;
         Call_Hook (Hook_Begin, Hook_Scenario);

         --------------
         --  Set_Up  --
         --------------

         Set_Up ("./features/test.feature");
         Fail := Stop;

         ------------------
         --  Background  --
         ------------------

         Background (Format, Report, Stop, Count_Mode);
         Fail := Stop;

         ----------------
         --  Scenario  --
         ----------------

         Format.Begin_Scenario;
         --
         -- Given State is Waiting_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "State is Waiting_State";
            Pos    : constant String    := "./features/test.feature:7";
         begin
            Make (Args, "State is Waiting_State");
            Add_Match (Args, 10, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Given_State_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Start_Filling is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Start_Filling is FALSE ";
            Pos    : constant String    := "./features/test.feature:9";
         begin
            Make (Args, "Start_Filling is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Start_Filling_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Valves_Opened is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Valves_Opened is FALSE ";
            Pos    : constant String    := "./features/test.feature:10";
         begin
            Make (Args, "Valves_Opened is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Valves_Opened_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Valves_Closed is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Valves_Closed is FALSE ";
            Pos    : constant String    := "./features/test.feature:11";
         begin
            Make (Args, "Valves_Closed is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Valves_Closed_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Pumps_Started is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Pumps_Started is FALSE ";
            Pos    : constant String    := "./features/test.feature:12";
         begin
            Make (Args, "Pumps_Started is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Pumps_Started_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- When Level_P is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Level_P is FALSE";
            Pos    : constant String    := "./features/test.feature:13";
         begin
            Make (Args, "Level_P is FALSE");
            Add_Match (Args, 12, 16);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Level_P_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then New_state is Init_State 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "New_state is Init_State ";
            Pos    : constant String    := "./features/test.feature:15";
         begin
            Make (Args, "New_state is Init_State ");
            Add_Match (Args, 14, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_New_state_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then Open_Valves is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Open_Valves is FALSE ";
            Pos    : constant String    := "./features/test.feature:16";
         begin
            Make (Args, "Open_Valves is FALSE ");
            Add_Match (Args, 16, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Open_Valves_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then Start_Pumps is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Start_Pumps is FALSE ";
            Pos    : constant String    := "./features/test.feature:17";
         begin
            Make (Args, "Start_Pumps is FALSE ");
            Add_Match (Args, 16, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Start_Pumps_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
         --
         -- Then Close_Valves is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Close_Valves is FALSE ";
            Pos    : constant String    := "./features/test.feature:18";
         begin
            Make (Args, "Close_Valves is FALSE ");
            Add_Match (Args, 17, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Close_Valves_is_N (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;

         --------------------
         --  Finalization  --
         --------------------

         Call_Hook (Hook_End, Hook_Scenario);
         if Fail then
            Report.Count_Scenario_Failed := Report.Count_Scenario_Failed + 1;
         Format.End_Scenario (Status_Failed);
         else
            Report.Count_Scenario_Passed := Report.Count_Scenario_Passed + 1;
         Format.End_Scenario (Status_Passed);
         end if;

         -----------------
         --  Tear_Down  --
         -----------------

         Tear_Down ("./features/test.feature");
         Fail := Stop;
         Format.Stop_Scenario;
      end if;
   end Scenario_state_TC_7;

   procedure Scenario_state (Format     : in     Format_Ptr;
                             Report     : in out Report_Type;
                             Cond       : in     Conditional_Type;
                             Stop       : in out Boolean;
                             Count_Mode : in     Boolean := False;
                             TC_Num     : in     Integer := -1)

   is
      Num_Scenario  : constant Natural := 1;
      Fail : Boolean := Stop;
      Tags : constant XReqLib.Format.Tag_Array_Type (1 .. 0) :=
            (others => Ada.Strings.Unbounded.Null_Unbounded_String);
   begin
      if Cond.Eval (Tags) and then Cond.Eval ("./features/test.feature", 6, Num_Scenario) then
         --------------------
         --  Test Case 1
         --------------------
         if TC_Num = -1 or TC_Num = 1 then
            Scenario_state_TC_1 (Format     => Format,
                                 Report     => Report,
                                 Stop       => Stop,
                                 Fail       => Fail,
                                 Tags       => Tags,
                                 Count_Mode => Count_Mode);
         end if;
         --------------------
         --  Test Case 2
         --------------------
         if TC_Num = -1 or TC_Num = 2 then
            Scenario_state_TC_2 (Format     => Format,
                                 Report     => Report,
                                 Stop       => Stop,
                                 Fail       => Fail,
                                 Tags       => Tags,
                                 Count_Mode => Count_Mode);
         end if;
         --------------------
         --  Test Case 3
         --------------------
         if TC_Num = -1 or TC_Num = 3 then
            Scenario_state_TC_3 (Format     => Format,
                                 Report     => Report,
                                 Stop       => Stop,
                                 Fail       => Fail,
                                 Tags       => Tags,
                                 Count_Mode => Count_Mode);
         end if;
         --------------------
         --  Test Case 4
         --------------------
         if TC_Num = -1 or TC_Num = 4 then
            Scenario_state_TC_4 (Format     => Format,
                                 Report     => Report,
                                 Stop       => Stop,
                                 Fail       => Fail,
                                 Tags       => Tags,
                                 Count_Mode => Count_Mode);
         end if;
         --------------------
         --  Test Case 5
         --------------------
         if TC_Num = -1 or TC_Num = 5 then
            Scenario_state_TC_5 (Format     => Format,
                                 Report     => Report,
                                 Stop       => Stop,
                                 Fail       => Fail,
                                 Tags       => Tags,
                                 Count_Mode => Count_Mode);
         end if;
         --------------------
         --  Test Case 6
         --------------------
         if TC_Num = -1 or TC_Num = 6 then
            Scenario_state_TC_6 (Format     => Format,
                                 Report     => Report,
                                 Stop       => Stop,
                                 Fail       => Fail,
                                 Tags       => Tags,
                                 Count_Mode => Count_Mode);
         end if;
         --------------------
         --  Test Case 7
         --------------------
         if TC_Num = -1 or TC_Num = 7 then
            Scenario_state_TC_7 (Format     => Format,
                                 Report     => Report,
                                 Stop       => Stop,
                                 Fail       => Fail,
                                 Tags       => Tags,
                                 Count_Mode => Count_Mode);
         end if;
      end if;
   end Scenario_state;

   procedure Run (Format     :        Format_Ptr;
                  Cond       :        Conditional_Type;
                  Report     : in out Report_Type;
                  List_Mode  :        Boolean := False;
                  Count_Mode :        Boolean := False;
                  TC_Num     :        Integer := -1) is
      Stop  : Boolean  := False;
   begin
      Format.S_Feature  (Str_Feature);
      Format.S_Scenario (Str_Scenario);
      Format.S_Outline  (Str_Outline);
      Format.S_Examples (Str_Examples);
      if List_Mode then
         Format.List_Feature ("test-state Feature");
         Format.List_Scenario ("state", "./features/test.feature", 6, 1);
      elsif Count_Mode then
         Scenario_state (Format, Report, Cond, Stop, Count_Mode, TC_Num);
      else
         Format.Start_Feature ("test-state Feature", "", "./features/test.feature:1");
         Format.Begin_Feature;
         Format.Put_Feature;
         Call_Hook (Hook_Begin, Hook_Feature);
         Scenario_state (Format, Report, Cond, Stop, Count_Mode, TC_Num);
         Call_Hook (Hook_End, Hook_Feature);
         Format.End_Feature;
         Format.Stop_Feature;
      end if;
   end Run;

begin

   Register_Feature (Run'Access);

end feature_test;
pragma Style_Checks (On);
