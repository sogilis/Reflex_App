with AUnit.Test_Caller;

with Test_Assertions;         use Test_Assertions;

with Ada.Directories;         use Ada.Directories;
with Ada.Exceptions;          use Ada.Exceptions;

package body XReq_Main_Test_Suite is

   package Caller is new AUnit.Test_Caller (Test_Case);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := AUnit.Test_Suites.New_Suite;
   begin
      Ret.Add_Test (Caller.Create ("XReq-Main: Test Main", Test_Main'Access));

      return Ret;
   end Suite;

   procedure Test_Main (T : in out Test_Case) is
      pragma Unreferenced (T);
      Gnat_Flags : constant String := "-gnat05 -c -aI../step_definitions " &
        "-aI../../../../../src/xreqlib/common" &
        "  -aI../../../../../src/xreqlib/x86_64";
      Start_Dir : constant String := Ada.Directories.Current_Directory;
   begin
      Ada.Directories.Set_Directory ("tests/unit");

     begin
         Delete_File ("data/features/tests/*");
      exception
          when others => null;
      end;

      Assert_Spawn ("-h", Executable_Name => "../../build/bin/development/native/xreq");

      Assert_Spawn ("data/features/simplest.feature", Executable_Name => "../../build/bin/development/native/xreq");

      Assert_Spawn ("-otmp --step tmp data/features/simplest.feature",
                    Expected_Result => False, Executable_Name => "../../build/bin/development/native/xreq");

      Assert_Spawn ("data/features/simplest.feature " &
                    "data/features/simplest2.feature", Executable_Name => "../../build/bin/development/native/xreq");

      Assert_Spawn ("-o tmp",
                    Expected_Result => False, Executable_Name => "../../build/bin/development/native/xreq");

      Assert_Spawn ("--step=tmp",
                    Expected_Result => False, Executable_Name => "../../build/bin/development/native/xreq");

      Assert_Spawn ("--lang fr",
                    Expected_Result => False, Executable_Name => "../../build/bin/development/native/xreq");

      Assert_Spawn ("--step 1 --step 2",
                    Expected_Result => False, Executable_Name => "../../build/bin/development/native/xreq");

      Assert_Spawn ("--step",
                    Expected_Result => False, Executable_Name => "../../build/bin/development/native/xreq");

      Assert_Spawn ("--lang=ada --step data/features/step_definitions " &
                    "data/features/simplest.feature",
                    Expected_Result => True, Executable_Name => "../../build/bin/development/native/xreq");

--        -- This test bugs
--        Assert_Spawn (T, "--step a --step data/features/step_definitions " &
--                      "data/features/simplest.feature",
--                      Expected_Result => False, Executable_Name => "../../build/bin/development/native/xreq");

      Assert_Spawn ("--toto",
                    Expected_Result => False, Executable_Name => "../../build/bin/development/native/xreq");

      Assert_Spawn ("-x result1 -k " &
                    "data/features/simplest.feature " &
                    "data/features/simplest2.feature", Executable_Name => "../../build/bin/development/native/xreq");

      Assert_Spawn (Gnat_Flags & " -aI../step_definitions result1",
                      Directory       => "data/features/tests",
                      Executable_Name => "gnatmake");

      Ada.Directories.Set_Directory (Start_Dir);
   exception
      when Error : others =>
         Ada.Directories.Set_Directory (Start_Dir);
         Reraise_Occurrence (Error);
   end Test_Main;

end XReq_Main_Test_Suite;
