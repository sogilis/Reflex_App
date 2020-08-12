with step_definitions; use step_definitions;

pragma Style_Checks (Off);
with Ada.Strings.Unbounded;
with XReqLib.Args;
with XReqLib.Register;
use  XReqLib.Args;
use  XReqLib.Register;
package body feature_test001 is

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
         Format.Start_Background ("", "./features/test001.feature:3");
         Format.Begin_Background;
         Format.Put_Background;
         --
         -- Given Cycle is initialized
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "Cycle is initialized";
            Pos    : constant String    := "./features/test001.feature:4";
         begin
            Make (Args, "Cycle is initialized");
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Given_Cycle_is_initialized (Args);
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
         Report.Num_Steps := Report.Num_Steps + 12;
      else
         Format.Start_Scenario ("state (1/8)", "./features/test001.feature:6", Tags);
         Format.Enter_Scenario;
         Call_Hook (Hook_Begin, Hook_Scenario);

         --------------
         --  Set_Up  --
         --------------

         Set_Up ("./features/test001.feature");
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
            Pos    : constant String    := "./features/test001.feature:7";
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
         -- When Start_cycle is TRUE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Start_cycle is TRUE";
            Pos    : constant String    := "./features/test001.feature:9";
         begin
            Make (Args, "Start_cycle is TRUE");
            Add_Match (Args, 16, 19);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Start_cycle_is_N (Args);
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
         -- When End_Filling_P1 is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Filling_P1 is FALSE";
            Pos    : constant String    := "./features/test001.feature:10";
         begin
            Make (Args, "End_Filling_P1 is FALSE");
            Add_Match (Args, 19, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Filling_P1_is_N (Args);
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
         -- When End_Filling_P2 is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Filling_P2 is FALSE";
            Pos    : constant String    := "./features/test001.feature:11";
         begin
            Make (Args, "End_Filling_P2 is FALSE");
            Add_Match (Args, 19, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Filling_P2_is_N (Args);
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
         -- When End_Mixing is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Mixing is FALSE";
            Pos    : constant String    := "./features/test001.feature:12";
         begin
            Make (Args, "End_Mixing is FALSE");
            Add_Match (Args, 15, 19);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Mixing_is_N (Args);
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
         -- When End_Emptying is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Emptying is FALSE";
            Pos    : constant String    := "./features/test001.feature:13";
         begin
            Make (Args, "End_Emptying is FALSE");
            Add_Match (Args, 17, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Emptying_is_N (Args);
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
         -- Then New_state is Filling_P1_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "New_state is Filling_P1_State";
            Pos    : constant String    := "./features/test001.feature:15";
         begin
            Make (Args, "New_state is Filling_P1_State");
            Add_Match (Args, 14, 29);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_New_state_N (Args);
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
         -- Then Filling_P1_Order is TRUE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Filling_P1_Order is TRUE";
            Pos    : constant String    := "./features/test001.feature:16";
         begin
            Make (Args, "Filling_P1_Order is TRUE");
            Add_Match (Args, 21, 24);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Filling_P1_Order_is_N (Args);
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
         -- Then Filling_P2_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Filling_P2_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:17";
         begin
            Make (Args, "Filling_P2_Order is FALSE");
            Add_Match (Args, 21, 25);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Filling_P2_Order_is_N (Args);
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
         -- Then Mixing_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Mixing_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:18";
         begin
            Make (Args, "Mixing_Order is FALSE");
            Add_Match (Args, 17, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Mixing_Order_is_N (Args);
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
         -- Then Emptying_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Emptying_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:19";
         begin
            Make (Args, "Emptying_Order is FALSE");
            Add_Match (Args, 19, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Emptying_Order_is_N (Args);
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
         -- Then End_Cycle is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "End_Cycle is FALSE";
            Pos    : constant String    := "./features/test001.feature:20";
         begin
            Make (Args, "End_Cycle is FALSE");
            Add_Match (Args, 14, 18);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_End_Cycle_is_N (Args);
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

         Tear_Down ("./features/test001.feature");
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
         Report.Num_Steps := Report.Num_Steps + 12;
      else
         Format.Start_Scenario ("state (2/8)", "./features/test001.feature:6", Tags);
         Format.Enter_Scenario;
         Call_Hook (Hook_Begin, Hook_Scenario);

         --------------
         --  Set_Up  --
         --------------

         Set_Up ("./features/test001.feature");
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
         -- Given State is Filling_P1_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "State is Filling_P1_State";
            Pos    : constant String    := "./features/test001.feature:7";
         begin
            Make (Args, "State is Filling_P1_State");
            Add_Match (Args, 10, 25);
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
         -- When Start_cycle is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Start_cycle is FALSE";
            Pos    : constant String    := "./features/test001.feature:9";
         begin
            Make (Args, "Start_cycle is FALSE");
            Add_Match (Args, 16, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Start_cycle_is_N (Args);
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
         -- When End_Filling_P1 is TRUE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Filling_P1 is TRUE";
            Pos    : constant String    := "./features/test001.feature:10";
         begin
            Make (Args, "End_Filling_P1 is TRUE");
            Add_Match (Args, 19, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Filling_P1_is_N (Args);
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
         -- When End_Filling_P2 is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Filling_P2 is FALSE";
            Pos    : constant String    := "./features/test001.feature:11";
         begin
            Make (Args, "End_Filling_P2 is FALSE");
            Add_Match (Args, 19, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Filling_P2_is_N (Args);
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
         -- When End_Mixing is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Mixing is FALSE";
            Pos    : constant String    := "./features/test001.feature:12";
         begin
            Make (Args, "End_Mixing is FALSE");
            Add_Match (Args, 15, 19);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Mixing_is_N (Args);
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
         -- When End_Emptying is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Emptying is FALSE";
            Pos    : constant String    := "./features/test001.feature:13";
         begin
            Make (Args, "End_Emptying is FALSE");
            Add_Match (Args, 17, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Emptying_is_N (Args);
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
         -- Then New_state is Filling_P2_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "New_state is Filling_P2_State";
            Pos    : constant String    := "./features/test001.feature:15";
         begin
            Make (Args, "New_state is Filling_P2_State");
            Add_Match (Args, 14, 29);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_New_state_N (Args);
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
         -- Then Filling_P1_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Filling_P1_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:16";
         begin
            Make (Args, "Filling_P1_Order is FALSE");
            Add_Match (Args, 21, 25);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Filling_P1_Order_is_N (Args);
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
         -- Then Filling_P2_Order is TRUE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Filling_P2_Order is TRUE";
            Pos    : constant String    := "./features/test001.feature:17";
         begin
            Make (Args, "Filling_P2_Order is TRUE");
            Add_Match (Args, 21, 24);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Filling_P2_Order_is_N (Args);
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
         -- Then Mixing_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Mixing_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:18";
         begin
            Make (Args, "Mixing_Order is FALSE");
            Add_Match (Args, 17, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Mixing_Order_is_N (Args);
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
         -- Then Emptying_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Emptying_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:19";
         begin
            Make (Args, "Emptying_Order is FALSE");
            Add_Match (Args, 19, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Emptying_Order_is_N (Args);
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
         -- Then End_Cycle is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "End_Cycle is FALSE";
            Pos    : constant String    := "./features/test001.feature:20";
         begin
            Make (Args, "End_Cycle is FALSE");
            Add_Match (Args, 14, 18);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_End_Cycle_is_N (Args);
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

         Tear_Down ("./features/test001.feature");
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
         Report.Num_Steps := Report.Num_Steps + 12;
      else
         Format.Start_Scenario ("state (3/8)", "./features/test001.feature:6", Tags);
         Format.Enter_Scenario;
         Call_Hook (Hook_Begin, Hook_Scenario);

         --------------
         --  Set_Up  --
         --------------

         Set_Up ("./features/test001.feature");
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
         -- Given State is Filling_P2_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "State is Filling_P2_State";
            Pos    : constant String    := "./features/test001.feature:7";
         begin
            Make (Args, "State is Filling_P2_State");
            Add_Match (Args, 10, 25);
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
         -- When Start_cycle is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Start_cycle is FALSE";
            Pos    : constant String    := "./features/test001.feature:9";
         begin
            Make (Args, "Start_cycle is FALSE");
            Add_Match (Args, 16, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Start_cycle_is_N (Args);
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
         -- When End_Filling_P1 is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Filling_P1 is FALSE";
            Pos    : constant String    := "./features/test001.feature:10";
         begin
            Make (Args, "End_Filling_P1 is FALSE");
            Add_Match (Args, 19, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Filling_P1_is_N (Args);
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
         -- When End_Filling_P2 is TRUE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Filling_P2 is TRUE";
            Pos    : constant String    := "./features/test001.feature:11";
         begin
            Make (Args, "End_Filling_P2 is TRUE");
            Add_Match (Args, 19, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Filling_P2_is_N (Args);
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
         -- When End_Mixing is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Mixing is FALSE";
            Pos    : constant String    := "./features/test001.feature:12";
         begin
            Make (Args, "End_Mixing is FALSE");
            Add_Match (Args, 15, 19);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Mixing_is_N (Args);
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
         -- When End_Emptying is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Emptying is FALSE";
            Pos    : constant String    := "./features/test001.feature:13";
         begin
            Make (Args, "End_Emptying is FALSE");
            Add_Match (Args, 17, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Emptying_is_N (Args);
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
         -- Then New_state is Mixing_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "New_state is Mixing_State";
            Pos    : constant String    := "./features/test001.feature:15";
         begin
            Make (Args, "New_state is Mixing_State");
            Add_Match (Args, 14, 25);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_New_state_N (Args);
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
         -- Then Filling_P1_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Filling_P1_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:16";
         begin
            Make (Args, "Filling_P1_Order is FALSE");
            Add_Match (Args, 21, 25);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Filling_P1_Order_is_N (Args);
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
         -- Then Filling_P2_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Filling_P2_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:17";
         begin
            Make (Args, "Filling_P2_Order is FALSE");
            Add_Match (Args, 21, 25);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Filling_P2_Order_is_N (Args);
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
         -- Then Mixing_Order is TRUE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Mixing_Order is TRUE";
            Pos    : constant String    := "./features/test001.feature:18";
         begin
            Make (Args, "Mixing_Order is TRUE");
            Add_Match (Args, 17, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Mixing_Order_is_N (Args);
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
         -- Then Emptying_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Emptying_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:19";
         begin
            Make (Args, "Emptying_Order is FALSE");
            Add_Match (Args, 19, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Emptying_Order_is_N (Args);
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
         -- Then End_Cycle is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "End_Cycle is FALSE";
            Pos    : constant String    := "./features/test001.feature:20";
         begin
            Make (Args, "End_Cycle is FALSE");
            Add_Match (Args, 14, 18);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_End_Cycle_is_N (Args);
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

         Tear_Down ("./features/test001.feature");
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
         Report.Num_Steps := Report.Num_Steps + 12;
      else
         Format.Start_Scenario ("state (4/8)", "./features/test001.feature:6", Tags);
         Format.Enter_Scenario;
         Call_Hook (Hook_Begin, Hook_Scenario);

         --------------
         --  Set_Up  --
         --------------

         Set_Up ("./features/test001.feature");
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
         -- Given State is Mixing_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "State is Mixing_State";
            Pos    : constant String    := "./features/test001.feature:7";
         begin
            Make (Args, "State is Mixing_State");
            Add_Match (Args, 10, 21);
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
         -- When Start_cycle is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Start_cycle is FALSE";
            Pos    : constant String    := "./features/test001.feature:9";
         begin
            Make (Args, "Start_cycle is FALSE");
            Add_Match (Args, 16, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Start_cycle_is_N (Args);
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
         -- When End_Filling_P1 is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Filling_P1 is FALSE";
            Pos    : constant String    := "./features/test001.feature:10";
         begin
            Make (Args, "End_Filling_P1 is FALSE");
            Add_Match (Args, 19, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Filling_P1_is_N (Args);
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
         -- When End_Filling_P2 is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Filling_P2 is FALSE";
            Pos    : constant String    := "./features/test001.feature:11";
         begin
            Make (Args, "End_Filling_P2 is FALSE");
            Add_Match (Args, 19, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Filling_P2_is_N (Args);
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
         -- When End_Mixing is TRUE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Mixing is TRUE";
            Pos    : constant String    := "./features/test001.feature:12";
         begin
            Make (Args, "End_Mixing is TRUE");
            Add_Match (Args, 15, 18);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Mixing_is_N (Args);
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
         -- When End_Emptying is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Emptying is FALSE";
            Pos    : constant String    := "./features/test001.feature:13";
         begin
            Make (Args, "End_Emptying is FALSE");
            Add_Match (Args, 17, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Emptying_is_N (Args);
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
         -- Then New_state is Emptying_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "New_state is Emptying_State";
            Pos    : constant String    := "./features/test001.feature:15";
         begin
            Make (Args, "New_state is Emptying_State");
            Add_Match (Args, 14, 27);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_New_state_N (Args);
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
         -- Then Filling_P1_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Filling_P1_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:16";
         begin
            Make (Args, "Filling_P1_Order is FALSE");
            Add_Match (Args, 21, 25);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Filling_P1_Order_is_N (Args);
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
         -- Then Filling_P2_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Filling_P2_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:17";
         begin
            Make (Args, "Filling_P2_Order is FALSE");
            Add_Match (Args, 21, 25);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Filling_P2_Order_is_N (Args);
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
         -- Then Mixing_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Mixing_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:18";
         begin
            Make (Args, "Mixing_Order is FALSE");
            Add_Match (Args, 17, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Mixing_Order_is_N (Args);
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
         -- Then Emptying_Order is TRUE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Emptying_Order is TRUE";
            Pos    : constant String    := "./features/test001.feature:19";
         begin
            Make (Args, "Emptying_Order is TRUE");
            Add_Match (Args, 19, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Emptying_Order_is_N (Args);
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
         -- Then End_Cycle is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "End_Cycle is FALSE";
            Pos    : constant String    := "./features/test001.feature:20";
         begin
            Make (Args, "End_Cycle is FALSE");
            Add_Match (Args, 14, 18);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_End_Cycle_is_N (Args);
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

         Tear_Down ("./features/test001.feature");
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
         Report.Num_Steps := Report.Num_Steps + 12;
      else
         Format.Start_Scenario ("state (5/8)", "./features/test001.feature:6", Tags);
         Format.Enter_Scenario;
         Call_Hook (Hook_Begin, Hook_Scenario);

         --------------
         --  Set_Up  --
         --------------

         Set_Up ("./features/test001.feature");
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
         -- Given State is Emptying_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "State is Emptying_State";
            Pos    : constant String    := "./features/test001.feature:7";
         begin
            Make (Args, "State is Emptying_State");
            Add_Match (Args, 10, 23);
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
         -- When Start_cycle is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Start_cycle is FALSE";
            Pos    : constant String    := "./features/test001.feature:9";
         begin
            Make (Args, "Start_cycle is FALSE");
            Add_Match (Args, 16, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Start_cycle_is_N (Args);
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
         -- When End_Filling_P1 is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Filling_P1 is FALSE";
            Pos    : constant String    := "./features/test001.feature:10";
         begin
            Make (Args, "End_Filling_P1 is FALSE");
            Add_Match (Args, 19, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Filling_P1_is_N (Args);
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
         -- When End_Filling_P2 is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Filling_P2 is FALSE";
            Pos    : constant String    := "./features/test001.feature:11";
         begin
            Make (Args, "End_Filling_P2 is FALSE");
            Add_Match (Args, 19, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Filling_P2_is_N (Args);
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
         -- When End_Mixing is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Mixing is FALSE";
            Pos    : constant String    := "./features/test001.feature:12";
         begin
            Make (Args, "End_Mixing is FALSE");
            Add_Match (Args, 15, 19);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Mixing_is_N (Args);
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
         -- When End_Emptying is TRUE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Emptying is TRUE";
            Pos    : constant String    := "./features/test001.feature:13";
         begin
            Make (Args, "End_Emptying is TRUE");
            Add_Match (Args, 17, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Emptying_is_N (Args);
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
         -- Then New_state is End_Cycle_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "New_state is End_Cycle_State";
            Pos    : constant String    := "./features/test001.feature:15";
         begin
            Make (Args, "New_state is End_Cycle_State");
            Add_Match (Args, 14, 28);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_New_state_N (Args);
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
         -- Then Filling_P1_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Filling_P1_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:16";
         begin
            Make (Args, "Filling_P1_Order is FALSE");
            Add_Match (Args, 21, 25);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Filling_P1_Order_is_N (Args);
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
         -- Then Filling_P2_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Filling_P2_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:17";
         begin
            Make (Args, "Filling_P2_Order is FALSE");
            Add_Match (Args, 21, 25);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Filling_P2_Order_is_N (Args);
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
         -- Then Mixing_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Mixing_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:18";
         begin
            Make (Args, "Mixing_Order is FALSE");
            Add_Match (Args, 17, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Mixing_Order_is_N (Args);
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
         -- Then Emptying_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Emptying_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:19";
         begin
            Make (Args, "Emptying_Order is FALSE");
            Add_Match (Args, 19, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Emptying_Order_is_N (Args);
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
         -- Then End_Cycle is TRUE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "End_Cycle is TRUE";
            Pos    : constant String    := "./features/test001.feature:20";
         begin
            Make (Args, "End_Cycle is TRUE");
            Add_Match (Args, 14, 17);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_End_Cycle_is_N (Args);
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

         Tear_Down ("./features/test001.feature");
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
         Report.Num_Steps := Report.Num_Steps + 12;
      else
         Format.Start_Scenario ("state (6/8)", "./features/test001.feature:6", Tags);
         Format.Enter_Scenario;
         Call_Hook (Hook_Begin, Hook_Scenario);

         --------------
         --  Set_Up  --
         --------------

         Set_Up ("./features/test001.feature");
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
         -- Given State is End_Cycle_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "State is End_Cycle_State";
            Pos    : constant String    := "./features/test001.feature:7";
         begin
            Make (Args, "State is End_Cycle_State");
            Add_Match (Args, 10, 24);
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
         -- When Start_cycle is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Start_cycle is FALSE";
            Pos    : constant String    := "./features/test001.feature:9";
         begin
            Make (Args, "Start_cycle is FALSE");
            Add_Match (Args, 16, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Start_cycle_is_N (Args);
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
         -- When End_Filling_P1 is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Filling_P1 is FALSE";
            Pos    : constant String    := "./features/test001.feature:10";
         begin
            Make (Args, "End_Filling_P1 is FALSE");
            Add_Match (Args, 19, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Filling_P1_is_N (Args);
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
         -- When End_Filling_P2 is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Filling_P2 is FALSE";
            Pos    : constant String    := "./features/test001.feature:11";
         begin
            Make (Args, "End_Filling_P2 is FALSE");
            Add_Match (Args, 19, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Filling_P2_is_N (Args);
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
         -- When End_Mixing is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Mixing is FALSE";
            Pos    : constant String    := "./features/test001.feature:12";
         begin
            Make (Args, "End_Mixing is FALSE");
            Add_Match (Args, 15, 19);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Mixing_is_N (Args);
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
         -- When End_Emptying is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Emptying is FALSE";
            Pos    : constant String    := "./features/test001.feature:13";
         begin
            Make (Args, "End_Emptying is FALSE");
            Add_Match (Args, 17, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Emptying_is_N (Args);
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
            Stanza : constant String    := "New_state is Init_State";
            Pos    : constant String    := "./features/test001.feature:15";
         begin
            Make (Args, "New_state is Init_State");
            Add_Match (Args, 14, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_New_state_N (Args);
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
         -- Then Filling_P1_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Filling_P1_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:16";
         begin
            Make (Args, "Filling_P1_Order is FALSE");
            Add_Match (Args, 21, 25);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Filling_P1_Order_is_N (Args);
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
         -- Then Filling_P2_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Filling_P2_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:17";
         begin
            Make (Args, "Filling_P2_Order is FALSE");
            Add_Match (Args, 21, 25);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Filling_P2_Order_is_N (Args);
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
         -- Then Mixing_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Mixing_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:18";
         begin
            Make (Args, "Mixing_Order is FALSE");
            Add_Match (Args, 17, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Mixing_Order_is_N (Args);
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
         -- Then Emptying_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Emptying_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:19";
         begin
            Make (Args, "Emptying_Order is FALSE");
            Add_Match (Args, 19, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Emptying_Order_is_N (Args);
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
         -- Then End_Cycle is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "End_Cycle is FALSE";
            Pos    : constant String    := "./features/test001.feature:20";
         begin
            Make (Args, "End_Cycle is FALSE");
            Add_Match (Args, 14, 18);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_End_Cycle_is_N (Args);
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

         Tear_Down ("./features/test001.feature");
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
         Report.Num_Steps := Report.Num_Steps + 12;
      else
         Format.Start_Scenario ("state (7/8)", "./features/test001.feature:6", Tags);
         Format.Enter_Scenario;
         Call_Hook (Hook_Begin, Hook_Scenario);

         --------------
         --  Set_Up  --
         --------------

         Set_Up ("./features/test001.feature");
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
         -- Given State is End_Cycle_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "State is End_Cycle_State";
            Pos    : constant String    := "./features/test001.feature:7";
         begin
            Make (Args, "State is End_Cycle_State");
            Add_Match (Args, 10, 24);
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
         -- When Start_cycle is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Start_cycle is FALSE";
            Pos    : constant String    := "./features/test001.feature:9";
         begin
            Make (Args, "Start_cycle is FALSE");
            Add_Match (Args, 16, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Start_cycle_is_N (Args);
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
         -- When End_Filling_P1 is TRUE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Filling_P1 is TRUE";
            Pos    : constant String    := "./features/test001.feature:10";
         begin
            Make (Args, "End_Filling_P1 is TRUE");
            Add_Match (Args, 19, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Filling_P1_is_N (Args);
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
         -- When End_Filling_P2 is TRUE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Filling_P2 is TRUE";
            Pos    : constant String    := "./features/test001.feature:11";
         begin
            Make (Args, "End_Filling_P2 is TRUE");
            Add_Match (Args, 19, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Filling_P2_is_N (Args);
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
         -- When End_Mixing is TRUE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Mixing is TRUE";
            Pos    : constant String    := "./features/test001.feature:12";
         begin
            Make (Args, "End_Mixing is TRUE");
            Add_Match (Args, 15, 18);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Mixing_is_N (Args);
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
         -- When End_Emptying is TRUE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Emptying is TRUE";
            Pos    : constant String    := "./features/test001.feature:13";
         begin
            Make (Args, "End_Emptying is TRUE");
            Add_Match (Args, 17, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Emptying_is_N (Args);
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
            Stanza : constant String    := "New_state is Init_State";
            Pos    : constant String    := "./features/test001.feature:15";
         begin
            Make (Args, "New_state is Init_State");
            Add_Match (Args, 14, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_New_state_N (Args);
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
         -- Then Filling_P1_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Filling_P1_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:16";
         begin
            Make (Args, "Filling_P1_Order is FALSE");
            Add_Match (Args, 21, 25);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Filling_P1_Order_is_N (Args);
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
         -- Then Filling_P2_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Filling_P2_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:17";
         begin
            Make (Args, "Filling_P2_Order is FALSE");
            Add_Match (Args, 21, 25);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Filling_P2_Order_is_N (Args);
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
         -- Then Mixing_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Mixing_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:18";
         begin
            Make (Args, "Mixing_Order is FALSE");
            Add_Match (Args, 17, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Mixing_Order_is_N (Args);
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
         -- Then Emptying_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Emptying_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:19";
         begin
            Make (Args, "Emptying_Order is FALSE");
            Add_Match (Args, 19, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Emptying_Order_is_N (Args);
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
         -- Then End_Cycle is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "End_Cycle is FALSE";
            Pos    : constant String    := "./features/test001.feature:20";
         begin
            Make (Args, "End_Cycle is FALSE");
            Add_Match (Args, 14, 18);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_End_Cycle_is_N (Args);
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

         Tear_Down ("./features/test001.feature");
         Fail := Stop;
         Format.Stop_Scenario;
      end if;
   end Scenario_state_TC_7;

   procedure Scenario_state_TC_8 (Format     : in     Format_Ptr;
                                  Report     : in out Report_Type;
                                  Stop       : in out Boolean;
                                  Tags       : in XReqLib.Format.Tag_Array_Type;
                                  Fail       : in out Boolean;
                                  Count_Mode : in     Boolean := False)

   is
   begin
      if Count_Mode then
         Background (Format, Report, Stop, True);
         Report.Num_Steps := Report.Num_Steps + 12;
      else
         Format.Start_Scenario ("state (8/8)", "./features/test001.feature:6", Tags);
         Format.Enter_Scenario;
         Call_Hook (Hook_Begin, Hook_Scenario);

         --------------
         --  Set_Up  --
         --------------

         Set_Up ("./features/test001.feature");
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
         -- Given State is End_Cycle_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "State is End_Cycle_State";
            Pos    : constant String    := "./features/test001.feature:7";
         begin
            Make (Args, "State is End_Cycle_State");
            Add_Match (Args, 10, 24);
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
         -- When Start_cycle is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Start_cycle is FALSE";
            Pos    : constant String    := "./features/test001.feature:9";
         begin
            Make (Args, "Start_cycle is FALSE");
            Add_Match (Args, 16, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Start_cycle_is_N (Args);
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
         -- When End_Filling_P1 is TRUE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Filling_P1 is TRUE";
            Pos    : constant String    := "./features/test001.feature:10";
         begin
            Make (Args, "End_Filling_P1 is TRUE");
            Add_Match (Args, 19, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Filling_P1_is_N (Args);
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
         -- When End_Filling_P2 is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Filling_P2 is FALSE";
            Pos    : constant String    := "./features/test001.feature:11";
         begin
            Make (Args, "End_Filling_P2 is FALSE");
            Add_Match (Args, 19, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Filling_P2_is_N (Args);
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
         -- When End_Mixing is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Mixing is FALSE";
            Pos    : constant String    := "./features/test001.feature:12";
         begin
            Make (Args, "End_Mixing is FALSE");
            Add_Match (Args, 15, 19);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Mixing_is_N (Args);
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
         -- When End_Emptying is TRUE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "End_Emptying is TRUE";
            Pos    : constant String    := "./features/test001.feature:13";
         begin
            Make (Args, "End_Emptying is TRUE");
            Add_Match (Args, 17, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_End_Emptying_is_N (Args);
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
            Stanza : constant String    := "New_state is Init_State";
            Pos    : constant String    := "./features/test001.feature:15";
         begin
            Make (Args, "New_state is Init_State");
            Add_Match (Args, 14, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_New_state_N (Args);
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
         -- Then Filling_P1_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Filling_P1_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:16";
         begin
            Make (Args, "Filling_P1_Order is FALSE");
            Add_Match (Args, 21, 25);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Filling_P1_Order_is_N (Args);
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
         -- Then Filling_P2_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Filling_P2_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:17";
         begin
            Make (Args, "Filling_P2_Order is FALSE");
            Add_Match (Args, 21, 25);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Filling_P2_Order_is_N (Args);
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
         -- Then Mixing_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Mixing_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:18";
         begin
            Make (Args, "Mixing_Order is FALSE");
            Add_Match (Args, 17, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Mixing_Order_is_N (Args);
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
         -- Then Emptying_Order is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Emptying_Order is FALSE";
            Pos    : constant String    := "./features/test001.feature:19";
         begin
            Make (Args, "Emptying_Order is FALSE");
            Add_Match (Args, 19, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Emptying_Order_is_N (Args);
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
         -- Then End_Cycle is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "End_Cycle is FALSE";
            Pos    : constant String    := "./features/test001.feature:20";
         begin
            Make (Args, "End_Cycle is FALSE");
            Add_Match (Args, 14, 18);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_End_Cycle_is_N (Args);
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

         Tear_Down ("./features/test001.feature");
         Fail := Stop;
         Format.Stop_Scenario;
      end if;
   end Scenario_state_TC_8;

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
      if Cond.Eval (Tags) and then Cond.Eval ("./features/test001.feature", 6, Num_Scenario) then
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
         --------------------
         --  Test Case 8
         --------------------
         if TC_Num = -1 or TC_Num = 8 then
            Scenario_state_TC_8 (Format     => Format,
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
         Format.List_Feature ("Cycle_1 tests");
         Format.List_Scenario ("state", "./features/test001.feature", 6, 1);
      elsif Count_Mode then
         Scenario_state (Format, Report, Cond, Stop, Count_Mode, TC_Num);
      else
         Format.Start_Feature ("Cycle_1 tests", "", "./features/test001.feature:1");
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

end feature_test001;
pragma Style_Checks (On);
