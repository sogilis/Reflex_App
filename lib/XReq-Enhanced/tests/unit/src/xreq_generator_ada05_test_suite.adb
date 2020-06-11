with AUnit.Test_Caller;

with AUnit.Assertions; use AUnit.Assertions;

with Ada.Exceptions;             use Ada.Exceptions;
with Ada.Strings.Unbounded;      use Ada.Strings.Unbounded;
with Ada.Directories;            use Ada.Directories;

with Util.IO;                    use Util.IO;
with XReq.Job;                   use XReq.Job;
with XReq.Generator;             use XReq.Generator;
with XReq.Environment.Handles;   use XReq.Environment.Handles;

package body XReq_Generator_Ada05_Test_Suite is

   package Caller is new AUnit.Test_Caller (Test_Case);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := AUnit.Test_Suites.New_Suite;
   begin
      Ret.Add_Test (Caller.Create ("XReq-Generator-Ada05: Test Ada_Code_Generation", Test_Ada_Code_Generation'Access));

      return Ret;
   end Suite;

   procedure Test_Ada_Code_Generation (T : in out Test_Case) is
      pragma Unreferenced (T);
      Env     : Environment_Handle := Create;
      Job     : Job_Type;
      Gen     : Generator_Ptr;
      Output  : Unbounded_String;
      Success : Boolean;
      Result  : Integer;
      Flags   : constant String
              := "-gnat05 -c -aI../step_definitions -aI../../../../../src/xreqlib/common" &
                 "  -aI../../../../../src/xreqlib/x86_64";
      pragma Unreferenced (Gen);
      Start_Dir : constant String := Ada.Directories.Current_Directory;
   begin
      Ada.Directories.Set_Directory ("tests/unit");
      begin
         Delete_File ("data/features/tests/simplest.adb");
         Delete_File ("data/features/tests/simplest.ads");
      exception
         when others => null;
      end;

      Init (Env, Job, Std_Logger, "data/features/simplest.feature");
      Run  (Job, Env, Std_Logger);
      Generate (Job, Env, Std_Logger);

      Append (Output, "gnatmake " & Flags & " feature_simplest.adb" &
              ASCII.LF);
      Spawn ("gnatmake", Flags & " feature_simplest.adb",
             Output, Success, Result, "data/features/tests");

      Assert (Success, "gnatmake did not succeed" & ASCII.LF &
              To_String (Output));
      Assert (Result = 0, "gnatmake returned with error" & Result'Img &
              ASCII.LF & To_String (Output));

      Ada.Directories.Set_Directory (Start_Dir);
   exception
      when Error : others =>
         Ada.Directories.Set_Directory (Start_Dir);
         Reraise_Occurrence (Error);
   end Test_Ada_Code_Generation;

end XReq_Generator_Ada05_Test_Suite;
