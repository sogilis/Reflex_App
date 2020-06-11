with Ada.Strings.Unbounded;
with Ada.Strings.Fixed;
with Ada.Environment_Variables;
with Ada.Directories;
with Ada.Sequential_IO;
with GNAT.OS_Lib;
with XReqLib.Asserts;

use Ada.Strings.Unbounded;
use Ada.Strings.Fixed;
use Ada.Strings;

use XReqLib.Asserts;

package body step_definitions is

   Last_Exit_Code : Integer := 0;
   Last_Command_Output : Unbounded_String;
   XReq_Dir : Unbounded_String;
   Feature_Test_Dir : Unbounded_String;

   package Char_IO is new Ada.Sequential_IO (Character);
   package ENV renames Ada.Environment_Variables;

   ----------------------------------------------------------------------------
   -- Execute
   ----------------------------------------------------------------------------
   procedure Execute (Command_Line : in String) is
      Tmp_File      : Char_IO.File_Type;
      Success       : Boolean;
      Return_Code   : Integer;
      Char          : Character;
      Arg1          : aliased String := "-c";
      Arg2          : aliased String := "( " & Command_Line & ") 2>&1";
      Arg_List      : constant GNAT.OS_Lib.Argument_List (1 .. 2)  --  OK, I do an unchecked access
                    := (                      --  access here, but is it
                     Arg1'Unchecked_Access,   --  worse than an
                     Arg2'Unchecked_Access);  --  Unchecked_Deallocation?
   begin
      Char_IO.Create (Tmp_File);
      Last_Command_Output := Null_Unbounded_String;
      --  Append (Last_Command_Output, Arg3 & ASCII.LF);
      --  Append (Last_Command_Output, Name (Tmp_File) & ASCII.LF);
      GNAT.OS_Lib.Spawn  ("/bin/sh",
              Arg_List,
              Char_IO.Name (Tmp_File),
              Success,
              Return_Code,
              True);
      Assert (Success, "Spawn failed");
      Char_IO.Reset (Tmp_File, Char_IO.In_File);
      while not Char_IO.End_Of_File (Tmp_File) loop
         Char_IO.Read   (Tmp_File, Char);
         Append (Last_Command_Output, Char);
      end loop;
      Char_IO.Delete (Tmp_File);
      Last_Exit_Code := Return_Code;
   end Execute;

   ----------------------------------------------------------------------------
   -- Given_xreq_is_in_the_PATH
   ----------------------------------------------------------------------------
   procedure Given_xreq_is_in_the_PATH (Args : in out Arg_Type) is
      pragma Unreferenced (Args);
   begin
      if ENV.Exists ("FEATURE_TEST_DIR") then
         Feature_Test_Dir := To_Unbounded_String (ENV.Value ("FEATURE_TEST_DIR"));
      else
         Feature_Test_Dir := To_Unbounded_String (Ada.Directories.Current_Directory);
      end if;
--      Ada.Text_IO.Put_Line ("Feature_Test_Dir = " & To_String (Feature_Test_Dir));

      if ENV.Exists ("XREQ_DIR") then
         XReq_Dir := To_Unbounded_String (ENV.Value ("XREQ_DIR"));
      else
         XReq_Dir := To_Unbounded_String (Ada.Directories.Current_Directory);
      end if;
--      Ada.Text_IO.Put_Line ("XReq_Dir = " & To_String (XReq_Dir));

      if ENV.Exists ("PATH") then
         ENV.Set ("PATH", To_String (XReq_Dir) & "/bin:" & ENV.Value ("PATH"));
      else
         ENV.Set ("PATH", To_String (XReq_Dir) & "/bin");
      end if;
--      Ada.Text_IO.Put_Line ("PATH = " & ENV.Value ("PATH"));

      if ENV.Exists ("LD_LIBRARY_PATH") then
         ENV.Set ("LD_LIBRARY_PATH", To_String (XReq_Dir) & "/lib/x86_64:" &
                    To_String (XReq_Dir) & "/lib/arm-eabi:" &
                    To_String (XReq_Dir) & "/lib" &
                    ENV.Value ("LD_LIBRARY_PATH"));
      else
         ENV.Set ("LD_LIBRARY_PATH", To_String (XReq_Dir) & "/lib/x86_64" &
                    To_String (XReq_Dir) & "/lib/arm-eabi" &
                    To_String (XReq_Dir) & "/lib"
                 );
      end if;
--      Ada.Text_IO.Put_Line ("LD_LIBRARY_PATH = " & ENV.Value ("LD_LIBRARY_PATH"));

      if ENV.Exists ("GPR_PROJECT_PATH") then
         ENV.Set ("GPR_PROJECT_PATH", To_String (XReq_Dir) & "/lib/gnat:" &
                  ENV.Value ("GPR_PROJECT_PATH"));
      else
         ENV.Set ("GPR_PROJECT_PATH", To_String (XReq_Dir) & "/lib/gnat");
      end if;
--      Ada.Text_IO.Put_Line ("GPR_PROJECT_PATH = " & ENV.Value ("GPR_PROJECT_PATH"));

      if ENV.Exists ("ADA_INCLUDE_PATH") then
         ENV.Set ("ADA_INCLUDE_PATH", To_String (XReq_Dir) & "/include/x86_64:" &
                  To_String (XReq_Dir) & "/include/arm-eabi:" &
                  ENV.Value ("ADA_INCLUDE_PATH"));
      else
         ENV.Set ("ADA_INCLUDE_PATH", To_String (XReq_Dir) & "/include/x86_64:" &
                  To_String (XReq_Dir) & "/include/arm-eabi");
      end if;
--      Ada.Text_IO.Put_Line ("ADA_INCLUDE_PATH = " & ENV.Value ("ADA_INCLUDE_PATH"));

      if ENV.Exists ("C_INCLUDE_PATH") then
         ENV.Set ("C_INCLUDE_PATH", To_String (XReq_Dir) & "/include/x86_64:" &
                  To_String (XReq_Dir) & "/include/arm-eabi:" &
                  ENV.Value ("C_INCLUDE_PATH"));
      else
         ENV.Set ("C_INCLUDE_PATH", To_String (XReq_Dir) & "/include/x86_64:" &
                  To_String (XReq_Dir) & "/include/arm-eabi");
      end if;
--      Ada.Text_IO.Put_Line ("C_INCLUDE_PATH = " & ENV.Value ("C_INCLUDE_PATH"));
   end Given_xreq_is_in_the_PATH;

   ----------------------------------------------------------------------------
   -- Given_I_am_in_the_xreq_directory
   ----------------------------------------------------------------------------
   procedure Given_I_am_in_the_xreq_directory (Args : in out Arg_Type) is
      pragma Unreferenced (Args);
   begin
      Ada.Directories.Set_Directory (To_String (Feature_Test_Dir));
   end Given_I_am_in_the_xreq_directory;

   ----------------------------------------------------------------------------
   -- Given_a_file
   ----------------------------------------------------------------------------
   procedure Given_a_file (Args : in out Arg_Type) is
      File_Name : constant String := Args.Match (1);
      Text      : constant String := Args.Text;
      File      : Char_IO.File_Type;
   begin
      Ada.Directories.Create_Path (Ada.Directories.Containing_Directory (File_Name));
      Char_IO.Create (File, Char_IO.Out_File, File_Name);
      for I in Text'Range loop
         Char_IO.Write (File, Text (I));
      end loop;
      Char_IO.Close (File);
   end Given_a_file;

   ----------------------------------------------------------------------------
   -- When_I_run_CMD_in_X
   ----------------------------------------------------------------------------
   procedure When_I_run_CMD_in_X (Args : in out Arg_Type) is
      Dir : constant String := Ada.Directories.Current_Directory;
   begin
      Ada.Directories.Set_Directory (Args.Match (2));
      Args.Add_Para ("Current Directory:");
      Args.Add_Text (Ada.Directories.Current_Directory);

      Execute (Args.Match (1));

      Args.Add_Para ("Exit code:" & Last_Exit_Code'Img);
      Args.Add_Para ("Current Directory:");
      Args.Add_Text (Ada.Directories.Current_Directory);
      Args.Add_Para ("Command output:");
      Args.Add_Text (To_String (Last_Command_Output));

      Ada.Directories.Set_Directory (Dir);
   end When_I_run_CMD_in_X;

   ----------------------------------------------------------------------------
   -- When_I_run_the_test_suite_SUITE_in_X
   ----------------------------------------------------------------------------
   procedure When_I_run_the_test_suite_SUITE_in_X (Args : in out Arg_Type) is
      Dir : constant String := Ada.Directories.Current_Directory;
   begin
      begin
         Ada.Directories.Set_Directory (Args.Match (2));
         Args.Add_Para ("Current Directory:");
         Args.Add_Text (Ada.Directories.Current_Directory);
      exception
         when Constraint_Error =>
            null;
      end;
      Execute (Args.Match (1) & " --no-color --no-stacktrace");
      Ada.Directories.Set_Directory (Dir);
      declare
         Output : constant String := To_String (Last_Command_Output);
         I      : Integer;
      begin
         I := Index (Output, "Finished in ", Backward);
         if I /= 0 and then Index (Output, "" & ASCII.LF, I) = Output'Last then
            Args.Add_Para ("Removed last line from output:");
            Args.Add_Text (Output (I .. Output'Last));
            Last_Command_Output := To_Unbounded_String
               (Output (Output'First .. I - 1));
         else
            Args.Add_Para ("Could not find ""Finished in "" in output");
            Args.Add_Para ("Command output:");
            Args.Add_Text (Output);
         end if;
      end;
   end When_I_run_the_test_suite_SUITE_in_X;

   ----------------------------------------------------------------------------
   -- When_I_compile_X_in_Y
   ----------------------------------------------------------------------------
   procedure When_I_compile_X_in_Y (Args : in out Arg_Type) is
      Dir      : constant String := Ada.Directories.Current_Directory;
      Cmd_Line : constant String :=
         "gnatmake -m -g -E -gnata -gnat05 -aI../step_definitions " &
         Args.Match (1);
   begin
      Ada.Directories.Set_Directory (Args.Match (2));
      Args.Add_Para ("Current Directory:");
      Args.Add_Text (Ada.Directories.Current_Directory);
      Args.Add_Para ("Command Line:");
      Args.Add_Text (Cmd_Line);
      Execute (Cmd_Line);
      Ada.Directories.Set_Directory (Dir);
   end When_I_compile_X_in_Y;

   ----------------------------------------------------------------------------
   -- When_I_run_xreq_CMD
   ----------------------------------------------------------------------------
   procedure When_I_run_xreq_CMD (Args : in out Arg_Type) is
      Buffer : Unbounded_String;
      procedure FillEnv (Name, Value : String) is
      begin
         Append(Buffer, Name & "=" & Value & ASCII.LF);
      end FillEnv;
   begin
      Ada.Environment_Variables.Iterate (FillEnv'Access);
      Args.Add_Para ("Current Directory:");
      Args.Add_Text (Ada.Directories.Current_Directory);
      Execute ("xreq " & Args.Match (1));
      Args.Add_Para ("Exit code:" & Last_Exit_Code'Img);
      Args.Add_Para ("Command Output:");
      Args.Add_Text (To_String (Last_Command_Output));
      Args.Add_Para ("Environment Variables:");
      Args.Add_Text (To_String (Buffer));
   end When_I_run_xreq_CMD;

   ----------------------------------------------------------------------------
   -- When_I_run_xreq_with_env_CMD
   ----------------------------------------------------------------------------
   procedure When_I_run_xreq_with_env_CMD (Args : in out Arg_Type) is
      Buffer : Unbounded_String;
      procedure FillEnv (Name, Value : String) is
      begin
         Append(Buffer, Name & "=" & Value & ASCII.LF);
      end FillEnv;
   begin
      Ada.Environment_Variables.Iterate (FillEnv'Access);
      Args.Add_Para ("Current Directory:");
      Args.Add_Text (Ada.Directories.Current_Directory);
      Execute (Args.Match (1) & " xreq " & Args.Match (2));
      Args.Add_Para ("Exit code:" & Last_Exit_Code'Img);
      Args.Add_Para ("Command Output:");
      Args.Add_Text (To_String (Last_Command_Output));
      Args.Add_Para ("Environment Variables:");
      Args.Add_Text (To_String (Buffer));
   end When_I_run_xreq_with_env_CMD;

   ----------------------------------------------------------------------------
   -- When_I_run
   ----------------------------------------------------------------------------
   procedure When_I_run (Args : in out Arg_Type) is
   begin
      Execute (Args.Match (1));
      Args.Add_Para ("Exit code:" & Last_Exit_Code'Img);
      Args.Add_Para ("Current Directory:");
      Args.Add_Text (Ada.Directories.Current_Directory);
      Args.Add_Para ("Command output:");
      Args.Add_Text (To_String (Last_Command_Output));
   end When_I_run;

   ----------------------------------------------------------------------------
   -- Then_file_should_exist
   ----------------------------------------------------------------------------
   procedure Then_file_should_exist (Args : in out Arg_Type) is
   begin
      Args.Add_Para ("Current Directory:");
      Args.Add_Text (Ada.Directories.Current_Directory);
      Assert (Ada.Directories.Exists (Args.Match (1)),
              "File should exists: " & Args.Match (1));
   end Then_file_should_exist;

   ----------------------------------------------------------------------------
   -- Then_it_should_pass_fail
   ----------------------------------------------------------------------------
   procedure Then_it_should_pass_fail (Args : in out Arg_Type) is
   begin
      Args.Add_Para ("Exit code:" & Last_Exit_Code'Img);
      Args.Add_Para ("Command output:");
      Args.Add_Text (To_String (Last_Command_Output));
      if Args.Match (1) = "pass" then
         Assert (Last_Exit_Code = 0, "failed with code" & Last_Exit_Code'Img);
      else
         Assert (Last_Exit_Code /= 0, "succeed");
      end if;
   end Then_it_should_pass_fail;

   ----------------------------------------------------------------------------
   -- Then_it_should_pass_fail_with
   ----------------------------------------------------------------------------
   procedure Then_it_should_pass_fail_with (Args : in out Arg_Type) is
   begin
      Then_it_should_pass_fail (Args);
--       Args.Add_Para ("Expected output:");
--       Args.Add_Text (Args.Text);
--       Args.Add_Para ("Command output:");
--       Args.Add_Text (To_String (Last_Command_Output));
      Assert (Args.Text = To_String (Last_Command_Output),
              "Unexpected command output");
   end Then_it_should_pass_fail_with;

   ----------------------------------------------------------------------------
   -- Then_the_output_should_contain
   ----------------------------------------------------------------------------
   procedure Then_the_output_should_contain (Args : in out Arg_Type) is
   begin
      Args.Add_Para ("Command output:");
      Args.Add_Text (To_String (Last_Command_Output));
      if Index (Last_Command_Output, Args.Text) = 0 then
         Assert (False, "The output doesn't match");
      end if;
   end Then_the_output_should_contain;

   ----------------------------------------------------------------------------
   -- Then_the_output_should_not_contain
   ----------------------------------------------------------------------------
   procedure Then_the_output_should_not_contain (Args : in out Arg_Type) is
   begin
      Args.Add_Para ("Command output:");
      Args.Add_Text (To_String (Last_Command_Output));
      if Index (Last_Command_Output, Args.Text) /= 0 then
         Assert (False, "The output match");
      end if;
   end Then_the_output_should_not_contain;

   procedure Set_Up (Feature_File : in String) is
   begin
      null;
   end Set_Up;

   procedure Tear_Down (Feature_File : in String) is
   begin
      null;
   end Tear_Down;

--  @xreq insert above

end step_definitions;
