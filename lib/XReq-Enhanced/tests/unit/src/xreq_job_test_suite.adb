with AUnit.Test_Caller;

with AUnit.Assertions;           use AUnit.Assertions;
with Test_Assertions;            use Test_Assertions;

with Ada.Strings.Unbounded;      use Ada.Strings.Unbounded;
with Ada.Exceptions;             use Ada.Exceptions;
with Ada.Directories;

with XReq.Job;                   use XReq.Job;
with XReq.Environment;           use XReq.Environment;
with XReq.Environment.Handles;   use XReq.Environment.Handles;
with XReqLib.Containers;         use XReqLib.Containers;

with Util.IO;                    use Util.IO;

package body XReq_Job_Test_Suite is

   package Caller is new AUnit.Test_Caller (Test_Case);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := AUnit.Test_Suites.New_Suite;
   begin
      Ret.Add_Test (Caller.Create ("XReq-Job: Test First_Step_Dir", Test_First_Step_Dir'Access));
      Ret.Add_Test (Caller.Create ("XReq-Job: Test Fill_Missing", Test_Fill_Missing'Access));
      Ret.Add_Test (Caller.Create ("XReq-Job: Test Job_Environment", Test_Job_Environment'Access));
      Ret.Add_Test (Caller.Create ("XReq-Job: Test Run", Test_Run'Access));
      Ret.Add_Test (Caller.Create ("XReq-Job: Test Options", Test_Options'Access));

      return Ret;
   end Suite;

   procedure Test_First_Step_Dir (T : in out Test_Case) is
      pragma Unreferenced (T);
      Env  : Environment_Handle;
   begin
      declare
         procedure P;
         procedure P is begin
            Assert (Env.Ref.First_Step_Dir = "", "not OK");
         end P;
         procedure Test_Assertion is new Assert_Except (P);
      begin
         Test_Assertion (
            "Constraint_Error has not been raised in call to First_Step_Dir",
            Constraint_Error'Identity);
      end;
   end Test_First_Step_Dir;

   procedure Test_Fill_Missing (T : in out Test_Case) is
      pragma Unreferenced (T);
      Env  : constant Environment_Handle := Create;
   begin
      Env.Ref.Fill_Missing ("A/B/spec.feature");
      Assert (Env.Ref.First_Step_Dir = "A/B/step_definitions",
                "Incorrect step dir");
      Assert (Env.Ref.Out_Dir = "A/B/tests", "Incorrect out dir");
   end Test_Fill_Missing;

   procedure Test_Job_Environment (T : in out Test_Case) is
      pragma Unreferenced (T);
      Env         : constant Environment_Handle := Create;
      String_Vect : String_Vector := Empty_String_Vector;
      Start_Dir : constant String := Ada.Directories.Current_Directory;
   begin
      Ada.Directories.Set_Directory ("tests/unit");
      Assert (not Env.Ref.Loaded, "Env should NOT be loaded");

      String_Vect.Clear;
      String_Vect.Append (To_Unbounded_String("steps"));
      Env.Ref.Make (Step_Dir => String_Vect, Out_Dir => "out");

      Assert (not Env.Ref.Loaded, "Env should NOT be loaded");

      Assert (Env.Ref.First_Step_Dir = "steps", "Invalid step dir");
      Assert (Env.Ref.Out_Dir = "out", "Invalid out dir");

      String_Vect.Clear;
      String_Vect.Append (To_Unbounded_String("data/features/step_definitions"));
      Env.Ref.Make (Step_Dir => String_Vect);

      Assert (not Env.Ref.Loaded, "Env should NOT be loaded");

      declare
         procedure P;
         procedure P is begin
            Env.Ref.Load (Std_Logger);
         end P;
         procedure Test_Assertion is new Assert_Except (P);
      begin
         Test_Assertion (
            "Invalid_Environment has not been raised in call to Load (1)",
            XReq.Environment.Invalid_Environment'Identity);
      end;

      Assert (not Env.Ref.Loaded, "Env should NOT be loaded");

      Env.Ref.Make (Out_Dir => "data/features/tests");

      Assert (not Env.Ref.Loaded, "Env should NOT be loaded");

      declare
         procedure P;
         procedure P is begin
            Env.Ref.Load (Std_Logger);
         end P;
         procedure Test_Assertion is new Assert_Except (P);
      begin
         Test_Assertion (
            "Invalid_Environment has not been raised in call to Load (2)",
            XReq.Environment.Invalid_Environment'Identity);
      end;

      Assert (not Env.Ref.Loaded, "Env should NOT be loaded");

      String_Vect.Clear;
      String_Vect.Append (To_Unbounded_String("data/features/step_definitions"));
      Env.Ref.Make (Step_Dir => String_Vect, Out_Dir => "data/features/tests");
      Env.Ref.Load (Std_Logger);

      Assert (Env.Ref.Loaded, "Env should be loaded");
      Ada.Directories.Set_Directory (Start_Dir);
   exception
      when Error : others =>
         Ada.Directories.Set_Directory (Start_Dir);
         Reraise_Occurrence (Error);
   end Test_Job_Environment;

   procedure Test_Run (T : in out Test_Case) is
      pragma Unreferenced (T);
      Env  : Environment_Handle := Create;
      Job  : Job_Type;
      Start_Dir : constant String := Ada.Directories.Current_Directory;
   begin
      Ada.Directories.Set_Directory ("tests/unit");
      Job.Make ("data/features/simplest.feature");
      Env.Ref.Make;
      Env.Ref.Fill_Missing (Feature_File (Job));

      declare
         procedure P;
         procedure P is begin
            Run (Job, Env, Std_Logger);
         end P;
         procedure Test_Assertion is new Assert_Except (P);
      begin
         Test_Assertion (
            "Invalid_Environment has not been raised in call to Run",
            XReq.Environment.Invalid_Environment'Identity);
      end;

      Env.Ref.Load (Std_Logger);

      Assert (Env.Ref.First_Step_Dir = "data/features/step_definitions",
              "incorrect step dir");

      Assert (Env.Ref.Out_Dir = "data/features/tests",
              "incorrect out dir");

      Run (Job, Env, Std_Logger);
      Ada.Directories.Set_Directory (Start_Dir);
   exception
      when Error : others =>
         Ada.Directories.Set_Directory (Start_Dir);
         Reraise_Occurrence (Error);
   end Test_Run;

   procedure Test_Options (T : in out Test_Case) is
      pragma Unreferenced (T);
      Env  : constant Environment_Handle := Create;
   begin
      Env.Ref.Set_Option ("a", "b");
      Assert (Env.Ref.Get_Option ("a") = "b",
                "Wrong option a (1)");

      Env.Ref.Set_Option ("a", "c");
      Assert (Env.Ref.Get_Option ("a") = "c",
                "Wrong option a (2)");
      Assert (Env.Ref.Get_Option ("a", "x") = "c",
                "Wrong option a (3)");

      Assert (Env.Ref.Has_Option ("a"), "Should have option a");
      Assert (not Env.Ref.Has_Option ("none"),
                "Should not have option none");

      Assert (Env.Ref.Get_Option ("none", "a") = "a",
                "Wrong default value Get_Option");
      declare
         procedure P;
         procedure P is begin
            Assert (Env.Ref.Get_Option ("none") = "",
                      "Exception not raised");
         end P;
         procedure Test_Assertion is new Assert_Except (P);
      begin
         Test_Assertion (
            "Invalid_Option has not been raised in call to Get_Option",
            XReq.Environment.Invalid_Option'Identity);
      end;
   end Test_Options;

end XReq_Job_Test_Suite;

