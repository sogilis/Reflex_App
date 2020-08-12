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
         -- Given Mixing app is initialized
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "Mixing app is initialized";
            Pos    : constant String    := "./features/test.feature:4";
         begin
            Make (Args, "Mixing app is initialized");
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Given_Mixing_app_is_initialized (Args);
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


   procedure Scenario_Mixing_TC (Format     : in     Format_Ptr;
                                 Report     : in out Report_Type;
                                 Stop       : in out Boolean;
                                 Tags       : in XReqLib.Format.Tag_Array_Type;
                                 Fail       : in out Boolean;
                                 Count_Mode : in     Boolean := False)

   is
   begin
      if Count_Mode then
         Background (Format, Report, Stop, True);
         Report.Num_Steps := Report.Num_Steps + 49;
      else
         Format.Start_Scenario ("Mixing", "./features/test.feature:6", Tags);
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
               Given_State_is_N (Args);
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
         -- When Start_Mixing is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Start_Mixing is TRUE ";
            Pos    : constant String    := "./features/test.feature:9";
         begin
            Make (Args, "Start_Mixing is TRUE ");
            Add_Match (Args, 17, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Start_Mixing_is_N (Args);
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
         -- When Blender_Started is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Blender_Started is TRUE ";
            Pos    : constant String    := "./features/test.feature:10";
         begin
            Make (Args, "Blender_Started is TRUE ");
            Add_Match (Args, 20, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Blender_Started_is_N (Args);
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
         -- Then New_state is Mix_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "New_state is Mix_State";
            Pos    : constant String    := "./features/test.feature:12";
         begin
            Make (Args, "New_state is Mix_State");
            Add_Match (Args, 14, 22);
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
         -- Then Start_Blender is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Start_Blender is TRUE ";
            Pos    : constant String    := "./features/test.feature:13";
         begin
            Make (Args, "Start_Blender is TRUE ");
            Add_Match (Args, 18, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Start_Blender_is_N (Args);
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
         -- Then Start_Resistance is TRUE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Start_Resistance is TRUE";
            Pos    : constant String    := "./features/test.feature:14";
         begin
            Make (Args, "Start_Resistance is TRUE");
            Add_Match (Args, 21, 24);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Start_Resistance_is_N (Args);
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
         -- Then End_Mixing is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "End_Mixing is FALSE";
            Pos    : constant String    := "./features/test.feature:15";
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
               Then_End_Mixing_is_N (Args);
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
         -- Given State is Mix_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "State is Mix_State";
            Pos    : constant String    := "./features/test.feature:17";
         begin
            Make (Args, "State is Mix_State");
            Add_Match (Args, 10, 18);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Given_State_is_N (Args);
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
         -- When Start_Mixing is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Start_Mixing is FALSE ";
            Pos    : constant String    := "./features/test.feature:19";
         begin
            Make (Args, "Start_Mixing is FALSE ");
            Add_Match (Args, 17, 21);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Start_Mixing_is_N (Args);
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
         -- When Blender_Started is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Blender_Started is TRUE ";
            Pos    : constant String    := "./features/test.feature:20";
         begin
            Make (Args, "Blender_Started is TRUE ");
            Add_Match (Args, 20, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Blender_Started_is_N (Args);
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
         -- Then New_state is It_Mixes_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "New_state is It_Mixes_State";
            Pos    : constant String    := "./features/test.feature:22";
         begin
            Make (Args, "New_state is It_Mixes_State");
            Add_Match (Args, 14, 27);
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
         -- Then Start_Blender is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Start_Blender is FALSE ";
            Pos    : constant String    := "./features/test.feature:23";
         begin
            Make (Args, "Start_Blender is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Start_Blender_is_N (Args);
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
         -- Then Start_Resistance is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Start_Resistance is FALSE";
            Pos    : constant String    := "./features/test.feature:24";
         begin
            Make (Args, "Start_Resistance is FALSE");
            Add_Match (Args, 21, 25);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Start_Resistance_is_N (Args);
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
         -- Then End_Mixing is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "End_Mixing is FALSE";
            Pos    : constant String    := "./features/test.feature:25";
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
               Then_End_Mixing_is_N (Args);
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
         -- Given State is It_Mixes_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "State is It_Mixes_State";
            Pos    : constant String    := "./features/test.feature:27";
         begin
            Make (Args, "State is It_Mixes_State");
            Add_Match (Args, 10, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Given_State_is_N (Args);
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
         -- When Start_Mixing is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Start_Mixing is TRUE ";
            Pos    : constant String    := "./features/test.feature:29";
         begin
            Make (Args, "Start_Mixing is TRUE ");
            Add_Match (Args, 17, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Start_Mixing_is_N (Args);
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
         -- When Blender_Started is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Blender_Started is TRUE ";
            Pos    : constant String    := "./features/test.feature:30";
         begin
            Make (Args, "Blender_Started is TRUE ");
            Add_Match (Args, 20, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Blender_Started_is_N (Args);
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
         -- Then New_state is It_Mixes_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "New_state is It_Mixes_State";
            Pos    : constant String    := "./features/test.feature:32";
         begin
            Make (Args, "New_state is It_Mixes_State");
            Add_Match (Args, 14, 27);
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
         -- Then Start_Blender is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Start_Blender is FALSE ";
            Pos    : constant String    := "./features/test.feature:33";
         begin
            Make (Args, "Start_Blender is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Start_Blender_is_N (Args);
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
         -- Then Start_Resistance is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Start_Resistance is FALSE";
            Pos    : constant String    := "./features/test.feature:34";
         begin
            Make (Args, "Start_Resistance is FALSE");
            Add_Match (Args, 21, 25);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Start_Resistance_is_N (Args);
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
         -- Then End_Mixing is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "End_Mixing is FALSE";
            Pos    : constant String    := "./features/test.feature:35";
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
               Then_End_Mixing_is_N (Args);
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
         -- Given State is It_Mixes_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "State is It_Mixes_State";
            Pos    : constant String    := "./features/test.feature:37";
         begin
            Make (Args, "State is It_Mixes_State");
            Add_Match (Args, 10, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Given_State_is_N (Args);
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
         -- When Start_Mixing is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Start_Mixing is TRUE ";
            Pos    : constant String    := "./features/test.feature:39";
         begin
            Make (Args, "Start_Mixing is TRUE ");
            Add_Match (Args, 17, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Start_Mixing_is_N (Args);
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
         -- When Blender_Started is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Blender_Started is FALSE ";
            Pos    : constant String    := "./features/test.feature:40";
         begin
            Make (Args, "Blender_Started is FALSE ");
            Add_Match (Args, 20, 24);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Blender_Started_is_N (Args);
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
         -- Then New_state is It_Mixes_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "New_state is It_Mixes_State";
            Pos    : constant String    := "./features/test.feature:42";
         begin
            Make (Args, "New_state is It_Mixes_State");
            Add_Match (Args, 14, 27);
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
         -- Then Start_Blender is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Start_Blender is FALSE ";
            Pos    : constant String    := "./features/test.feature:43";
         begin
            Make (Args, "Start_Blender is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Start_Blender_is_N (Args);
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
         -- Then Start_Resistance is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Start_Resistance is FALSE";
            Pos    : constant String    := "./features/test.feature:44";
         begin
            Make (Args, "Start_Resistance is FALSE");
            Add_Match (Args, 21, 25);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Start_Resistance_is_N (Args);
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
         -- Then End_Mixing is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "End_Mixing is FALSE";
            Pos    : constant String    := "./features/test.feature:45";
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
               Then_End_Mixing_is_N (Args);
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
         -- Given State is It_Mixes_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "State is It_Mixes_State";
            Pos    : constant String    := "./features/test.feature:47";
         begin
            Make (Args, "State is It_Mixes_State");
            Add_Match (Args, 10, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Given_State_is_N (Args);
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
         -- When Start_Mixing is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Start_Mixing is TRUE ";
            Pos    : constant String    := "./features/test.feature:49";
         begin
            Make (Args, "Start_Mixing is TRUE ");
            Add_Match (Args, 17, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Start_Mixing_is_N (Args);
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
         -- When Blender_Started is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Blender_Started is FALSE ";
            Pos    : constant String    := "./features/test.feature:50";
         begin
            Make (Args, "Blender_Started is FALSE ");
            Add_Match (Args, 20, 24);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Blender_Started_is_N (Args);
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
         -- Then New_state is It_Mixes_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "New_state is It_Mixes_State";
            Pos    : constant String    := "./features/test.feature:52";
         begin
            Make (Args, "New_state is It_Mixes_State");
            Add_Match (Args, 14, 27);
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
         -- Then Start_Blender is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Start_Blender is FALSE ";
            Pos    : constant String    := "./features/test.feature:53";
         begin
            Make (Args, "Start_Blender is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Start_Blender_is_N (Args);
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
         -- Then Start_Resistance is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Start_Resistance is FALSE";
            Pos    : constant String    := "./features/test.feature:54";
         begin
            Make (Args, "Start_Resistance is FALSE");
            Add_Match (Args, 21, 25);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Start_Resistance_is_N (Args);
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
         -- Then End_Mixing is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "End_Mixing is FALSE";
            Pos    : constant String    := "./features/test.feature:55";
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
               Then_End_Mixing_is_N (Args);
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
         -- Given State is It_Mixes_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "State is It_Mixes_State";
            Pos    : constant String    := "./features/test.feature:57";
         begin
            Make (Args, "State is It_Mixes_State");
            Add_Match (Args, 10, 23);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Given_State_is_N (Args);
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
         -- When Start_Mixing is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Start_Mixing is TRUE ";
            Pos    : constant String    := "./features/test.feature:59";
         begin
            Make (Args, "Start_Mixing is TRUE ");
            Add_Match (Args, 17, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Start_Mixing_is_N (Args);
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
         -- When Blender_Started is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Blender_Started is FALSE ";
            Pos    : constant String    := "./features/test.feature:60";
         begin
            Make (Args, "Blender_Started is FALSE ");
            Add_Match (Args, 20, 24);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Blender_Started_is_N (Args);
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
         -- Then New_state is End_Mixing_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "New_state is End_Mixing_State";
            Pos    : constant String    := "./features/test.feature:62";
         begin
            Make (Args, "New_state is End_Mixing_State");
            Add_Match (Args, 14, 29);
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
         -- Then Start_Blender is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Start_Blender is FALSE ";
            Pos    : constant String    := "./features/test.feature:63";
         begin
            Make (Args, "Start_Blender is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Start_Blender_is_N (Args);
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
         -- Then Start_Resistance is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Start_Resistance is FALSE";
            Pos    : constant String    := "./features/test.feature:64";
         begin
            Make (Args, "Start_Resistance is FALSE");
            Add_Match (Args, 21, 25);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Start_Resistance_is_N (Args);
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
         -- Then End_Mixing is TRUE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "End_Mixing is TRUE";
            Pos    : constant String    := "./features/test.feature:65";
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
               Then_End_Mixing_is_N (Args);
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
         -- Given State is End_Mixing_State
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "State is End_Mixing_State";
            Pos    : constant String    := "./features/test.feature:68";
         begin
            Make (Args, "State is End_Mixing_State");
            Add_Match (Args, 10, 25);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Given_State_is_N (Args);
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
         -- When Start_Mixing is TRUE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Start_Mixing is TRUE ";
            Pos    : constant String    := "./features/test.feature:70";
         begin
            Make (Args, "Start_Mixing is TRUE ");
            Add_Match (Args, 17, 20);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Start_Mixing_is_N (Args);
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
         -- When Blender_Started is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Blender_Started is FALSE ";
            Pos    : constant String    := "./features/test.feature:71";
         begin
            Make (Args, "Blender_Started is FALSE ");
            Add_Match (Args, 20, 24);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Blender_Started_is_N (Args);
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
            Pos    : constant String    := "./features/test.feature:73";
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
         -- Then Start_Blender is FALSE 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Start_Blender is FALSE ";
            Pos    : constant String    := "./features/test.feature:74";
         begin
            Make (Args, "Start_Blender is FALSE ");
            Add_Match (Args, 18, 22);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Start_Blender_is_N (Args);
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
         -- Then Start_Resistance is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "Start_Resistance is FALSE";
            Pos    : constant String    := "./features/test.feature:75";
         begin
            Make (Args, "Start_Resistance is FALSE");
            Add_Match (Args, 21, 25);
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_Start_Resistance_is_N (Args);
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
         -- Then End_Mixing is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "End_Mixing is FALSE";
            Pos    : constant String    := "./features/test.feature:76";
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
               Then_End_Mixing_is_N (Args);
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
   end Scenario_Mixing_TC;

   procedure Scenario_Mixing (Format     : in     Format_Ptr;
                              Report     : in out Report_Type;
                              Cond       : in     Conditional_Type;
                              Stop       : in out Boolean;
                              Count_Mode : in     Boolean := False;
                              TC_Num     : in     Integer := -1)

   is
      pragma Unreferenced (TC_Num);
      Num_Scenario  : constant Natural := 1;
      Fail : Boolean := Stop;
      Tags : constant XReqLib.Format.Tag_Array_Type (1 .. 0) :=
            (others => Ada.Strings.Unbounded.Null_Unbounded_String);
   begin
      if Cond.Eval (Tags) and then Cond.Eval ("./features/test.feature", 6, Num_Scenario) then
         --------------------
         --  Test Case     --
         --------------------
         Scenario_Mixing_TC (Format     => Format,
                             Report     => Report,
                             Stop       => Stop,
                             Fail       => Fail,
                             Tags       => Tags,
                             Count_Mode => Count_Mode);
      end if;
   end Scenario_Mixing;

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
         Format.List_Feature ("Mixing test");
         Format.List_Scenario ("Mixing", "./features/test.feature", 6, 1);
      elsif Count_Mode then
         Scenario_Mixing (Format, Report, Cond, Stop, Count_Mode, TC_Num);
      else
         Format.Start_Feature ("Mixing test", "", "./features/test.feature:1");
         Format.Begin_Feature;
         Format.Put_Feature;
         Call_Hook (Hook_Begin, Hook_Feature);
         Scenario_Mixing (Format, Report, Cond, Stop, Count_Mode, TC_Num);
         Call_Hook (Hook_End, Hook_Feature);
         Format.End_Feature;
         Format.Stop_Feature;
      end if;
   end Run;

begin

   Register_Feature (Run'Access);

end feature_test;
pragma Style_Checks (On);
