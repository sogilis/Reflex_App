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
         -- Given blender component is initialized
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "blender component is initialized";
            Pos    : constant String    := "./features/test.feature:4";
         begin
            Make (Args, "blender component is initialized");
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Given_blender_component_is_initialized (Args);
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


   procedure Scenario_Eating_TC (Format     : in     Format_Ptr;
                                 Report     : in out Report_Type;
                                 Stop       : in out Boolean;
                                 Tags       : in XReqLib.Format.Tag_Array_Type;
                                 Fail       : in out Boolean;
                                 Count_Mode : in     Boolean := False)

   is
   begin
      if Count_Mode then
         Background (Format, Report, Stop, True);
         Report.Num_Steps := Report.Num_Steps + 3;
      else
         Format.Start_Scenario ("Eating", "./features/test.feature:6", Tags);
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
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Given_State_is_Init_State (Args);
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
         -- When Start_Mixing is TRUE And Blender_Started is FALSE And Mixing_Duration is 2 
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_When;
            Stanza : constant String    := "Start_Mixing is TRUE And Blender_Started is FALSE And Mixing_Duration is 2 ";
            Pos    : constant String    := "./features/test.feature:8";
         begin
            Make (Args, "Start_Mixing is TRUE And Blender_Started is FALSE And Mixing_Duration is 2 ");
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               When_Start_Mixing_is_TRUE_And_Blender_Started_is_FALSE_And_Mixing_Duration_is_2 (Args);
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
         -- Then New_state is Mix_State And Start_Blender is FALSE And Start_Resistance is FALSE And End_Mixing is FALSE
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Then;
            Stanza : constant String    := "New_state is Mix_State And Start_Blender is FALSE And Start_Resistance is FALSE And End_Mixing is FALSE";
            Pos    : constant String    := "./features/test.feature:9";
         begin
            Make (Args, "New_state is Mix_State And Start_Blender is FALSE And Start_Resistance is FALSE And End_Mixing is FALSE");
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Then_New_state_is_Mix_State_And_Start_Blender_is_FALSE_And_Start_Resistance_is_FALSE_And_End_Mixing_is_FALSE (Args);
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
   end Scenario_Eating_TC;

   procedure Scenario_Eating (Format     : in     Format_Ptr;
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
         Scenario_Eating_TC (Format     => Format,
                             Report     => Report,
                             Stop       => Stop,
                             Fail       => Fail,
                             Tags       => Tags,
                             Count_Mode => Count_Mode);
      end if;
   end Scenario_Eating;

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
         Format.List_Scenario ("Eating", "./features/test.feature", 6, 1);
      elsif Count_Mode then
         Scenario_Eating (Format, Report, Cond, Stop, Count_Mode, TC_Num);
      else
         Format.Start_Feature ("test-state Feature", "", "./features/test.feature:1");
         Format.Begin_Feature;
         Format.Put_Feature;
         Call_Hook (Hook_Begin, Hook_Feature);
         Scenario_Eating (Format, Report, Cond, Stop, Count_Mode, TC_Num);
         Call_Hook (Hook_End, Hook_Feature);
         Format.End_Feature;
         Format.Stop_Feature;
      end if;
   end Run;

begin

   Register_Feature (Run'Access);

end feature_test;
pragma Style_Checks (On);
