with AUnit.Test_Caller;

with Ada.Directories;
with Ada.Exceptions;             use Ada.Exceptions;

with AUnit.Assertions;           use AUnit.Assertions;
with Test_Assertions;            use Test_Assertions;

with XReq.Steps;                 use XReq.Steps;
with XReq.Steps.Handles;         use XReq.Steps.Handles;
with XReq.Scenarios.Handles;     use XReq.Scenarios.Handles;
with XReq.Features;              use XReq.Features;
with XReq.Features.Files;        use XReq.Features.Files;
with XReqLib.Format;             use XReqLib.Format;

with Util.IO;                    use Util.IO;
with Util.Strings;               use Util.Strings;

package body XReq_Features_Test_Suite is

   package Caller is new AUnit.Test_Caller (Test_Case);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := AUnit.Test_Suites.New_Suite;
   begin
      Ret.Add_Test (Caller.Create ("XReq-Features: Test Parse_File", Test_Parse_File'Access));
      Ret.Add_Test (Caller.Create ("XReq-Features: Test Object_Creation", Test_Object_Creation'Access));

      return Ret;
   end Suite;

   procedure Test_Parse_File (T : in out Test_Case) is
      pragma Unreferenced (T);
      Feature  : Feature_File_Type := Null_Feature_File;
      File     : constant String := "data/features/simplest.feature";
      Scenario : Scenario_Handle;
      Stanza   : Step_Handle;

      CRLF : constant String := "" & ASCII.LF;
      Canonical_Feature_Text : constant String :=
         "# File: " & File              & CRLF &
         "Feature: Sample"              & CRLF &
         ""                             & CRLF &
         "  Background: "               & CRLF &
         "    Given this step works"    & CRLF &
         ""                             & CRLF &
         "  Scenario: Run a good step"  & CRLF &
         "    Given this step works"    & CRLF &
         ""                             & CRLF;
      Start_Dir : constant String := Ada.Directories.Current_Directory;
   begin
      Ada.Directories.Set_Directory ("tests/unit");
      Assert (not Parsed (Feature),
              "Feature has been parsed without invoking Make");

      declare
         procedure P;
         procedure P is
            S : constant String := To_String (Feature);
            pragma Unreferenced (S);
         begin
            null;
         end P;
         procedure Test_Assertion is new Assert_Except (P);
      begin
         Test_Assertion (
            "1:To_String should raise Unparsed_Feature",
            Unparsed_Feature'Identity);
      end;

      Make (Feature, File);

      Assert (File_Name (Feature) = File,
              "Feature filename (" & File_Name (Feature) & ") is incorrect");

      Assert (not Parsed (Feature),
              "Feature has been parsed without invoking Parse");

      declare
         procedure P;
         procedure P is
            S : constant String := To_String (Feature);
            pragma Unreferenced (S);
         begin
            null;
         end P;
         procedure Test_Assertion is new Assert_Except (P);
      begin
         Test_Assertion (
            "2:To_String should raise Unparsed_Feature",
            Unparsed_Feature'Identity);
      end;

      Parse (Feature, Std_Logger);

      Assert (Parsed (Feature),
              "Feature has not been parsed after invoking Parse");

      Assert (Feature.Name = "Sample",
              "Feature name incorrect");

      Assert (Feature.Description = "",
              "Feature description while there is none");

      Assert (Feature.Background.R.Name = "",
              "Background name while there is none");

      Assert (Feature.Background.R.Step_Count /= 0,
              "No background stanzas");

      Assert (Feature.Background.R.Step_Count = 1,
              "More than one line of background");

      Stanza := Feature.Background.R.Step_Element (0);

      Assert (Stanza.R.Kind = Step_Given,
              "The first step of the background is not a Given");

      Assert (Stanza.R.Stanza = "this step works",
              "Text of the first given of background incorrect");

      Assert (Feature.Scenario_Count /= 0,
              "No scenario");

      Assert (Feature.Scenario_Count = 1,
              "More than one scenario");

      Scenario := Feature.Scenario_Element (0);

      Assert (Scenario.R.Name = "Run a good step",
              "Name of the scenario incorrect");

      Assert (Scenario.R.Step_Count = 1,
              "No or more than one stanza in the scenario");

      Stanza := Scenario.R.Step_Element (0);

      Assert (Stanza.R.Kind = Step_Given,
              "The first step of the scenario is not a Given");

      Assert (Stanza.R.Stanza = "this step works",
              "Text of the first given of scenario incorrect");

      Assert (Feature.To_String = Canonical_Feature_Text,
                "To_String do not match the canonical text." & ASCII.LF &
                "Got:      " & Ada_String (Feature.To_String) & ASCII.LF &
                "Expected: " & Ada_String (Canonical_Feature_Text));
      Ada.Directories.Set_Directory (Start_Dir);
   exception
      when Error : others =>
         Ada.Directories.Set_Directory (Start_Dir);
         Reraise_Occurrence (Error);
   end Test_Parse_File;

   procedure Test_Object_Creation (T : in out Test_Case) is
      pragma Unreferenced (T);
      Feature1 : Feature_Type := Null_Feature;
      Feature2 : Feature_File_Type;
      File     : constant String := "data/features/simplest2.feature";
      Scenario : Scenario_Handle;
      Start_Dir : constant String := Ada.Directories.Current_Directory;
   begin
      Ada.Directories.Set_Directory ("tests/unit");
      Make (Feature1, "Sample2");

      Assert (Feature1.Name = "Sample2", "Incorrect feature name");
      Assert (Feature1.Parsed, "Feature_Type is always parsed");

      Scenario := Create;
      Scenario.R.Make ("Background");
      Scenario.R.Step_Append (Stanza_Given ("this step works"));
      Feature1.Set_Background (Scenario);

      Scenario := Create;
      Scenario.R.Make ("Run a good step");
      Scenario.R.Step_Append (Stanza_Given ("this step works"));
      Scenario.R.Step_Append (Stanza_Given ("I am in front of a cake machine"));
      Scenario.R.Step_Append (Stanza_When  ("I insert money"));
      Scenario.R.Step_Append (Stanza_When  ("I push the button"));
      Scenario.R.Step_Append (Stanza_Then  ("I get a cake"));
      Feature1.Scenario_Append (Scenario);

      Scenario := Create;
      Scenario.R.Make ("Another good step");
      Scenario.R.Step_Append (Stanza_Given ("this step works"));
      Feature1.Scenario_Append (Scenario);

      Make  (Feature2, File);
      Parse (Feature2, Std_Logger);

      Assert (Feature1.To_String = Feature_Type (Feature2).To_String,
                "The two features text representation must be the same");
      Ada.Directories.Set_Directory (Start_Dir);
   exception
      when Error : others =>
         Ada.Directories.Set_Directory (Start_Dir);
         Reraise_Occurrence (Error);

   end Test_Object_Creation;

end XReq_Features_Test_Suite;
