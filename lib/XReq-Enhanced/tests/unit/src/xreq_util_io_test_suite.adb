with AUnit.Test_Caller;

with AUnit.Assertions;       use AUnit.Assertions;

with Ada.Strings.Unbounded;  use Ada.Strings.Unbounded;
with Ada.Exceptions;         use Ada.Exceptions;
with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Directories;
with Ada.Environment_Variables;

with Util.IO;                use Util.IO;

package body XReq_Util_IO_Test_Suite is

   package Caller is new AUnit.Test_Caller (Test_Case);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := AUnit.Test_Suites.New_Suite;
   begin
      Ret.Add_Test (Caller.Create ("XReq-Util-IO: Test File_Open", Test_File_Open'Access));
      Ret.Add_Test (Caller.Create ("XReq-Util-IO: Test Spawn", Test_Spawn'Access));
      Ret.Add_Test (Caller.Create ("XReq-Util-IO: Test Char_IO", Test_Char_IO'Access));
      Ret.Add_Test (Caller.Create ("XReq-Util-IO: Test Get_Set", Test_Get_Set'Access));
      Ret.Add_Test (Caller.Create ("XReq-Util-IO: Test Logger", Test_Logger'Access));
      Ret.Add_Test (Caller.Create ("XReq-Util-IO: Test GetEnv", Test_GetEnv'Access));

      return Ret;
   end Suite;

   procedure Test_File_Open (T : in out Test_Case) is
      pragma Unreferenced (T);
      File_Name : constant String := "data/file1.txt";
      CRLF      : constant String := "" & ASCII.LF;
      Line_1    : constant String := "First Line";
      Line_2    : constant String := "Second Line";
      File_Cnt  : constant String := Line_1 & CRLF & Line_2 & CRLF;
      File      : File_Type;
      Start_Dir : constant String := Ada.Directories.Current_Directory;
   begin
      Ada.Directories.Set_Directory ("tests/unit");
      Util.IO.BufferSize := 5;

      Assert (Read_Whole_File (File_Name, CRLF) = File_Cnt,
              "Content of the file " & File_Name &
              " incorrect (Read_Whole_File).");

      Open (File, In_File, File_Name);

      Assert (not End_Of_File (File),
              "Missing 1st line of " & File_Name);

      Assert (To_String (Get_Whole_Line (File)) = Line_1,
              "First line of " & File_Name & " incorrect (Get_Whole_Line)");

      Assert (not End_Of_File (File),
              "Missing 2nd line of " & File_Name);

      declare
         s : constant String := Get_Whole_Line (File);
      begin
         Assert (s = Line_2,
                 "Second line of " & File_Name &
                 " incorrect (Get_Whole_Line)");
      end;

      Assert (End_Of_File (File),
              "No 3rd line expected in " & File_Name);

--        declare
--           procedure P;
--           procedure P is begin
--              Assert (To_String (Get_Whole_Line (File)) =
--                        Null_Unbounded_String,
--                        "Get_Line shouldn't return a string when end of file");
--           end P;
--           procedure Assert_Exception_Raised is new Assert_Except (Test_1, P);
--        begin
--           Assert_Exception_Raised (T, "Get_Line should raise " &
--                                    "Ada.IO_Exceptions.End_Error at EOF",
--                                    Ada.IO_Exceptions.End_Error'Identity);
--        end;

      Close (File);
      Ada.Directories.Set_Directory (Start_Dir);
   exception
      when Error : others =>
         Ada.Directories.Set_Directory (Start_Dir);
         Reraise_Occurrence (Error);
   end Test_File_Open;

   procedure Test_Spawn (T : in out Test_Case) is
      pragma Unreferenced (T);
      Output  : Unbounded_String;
      Success : Boolean;
      Result  : Integer;
   begin

      Spawn ("/bin/true", "", Output, Success, Result);
      Assert (Success, "Failure running `true`");
      Assert (Result = 0, "`true` returned error status"& Result'Img);

      Spawn ("false", "", Output, Success, Result);
      Assert (Success, "Failure running `false`");
      Assert (Result = 1, "`false` returned error status"& Result'Img);

      Output := Null_Unbounded_String;
      Spawn ("pwd", "", Output, Success, Result, "/tmp");

      Assert (Success, "Failure running `pwd`");
      Assert (Result = 0, "`pwd` returned error status" & Result'Img);
      Assert (To_String (Output) = "/tmp" & ASCII.LF,
              "Command output for `pwd` should be ""/tmp\n"" " &
              "instead of """ & To_String (Output) & """");

      Output := Null_Unbounded_String;
      Spawn ("printf", "%s-%s a b", Output, Success, Result);

      Assert (Success, "Failure running `printf %s-%s a b`");
      Assert (Result = 0,
              "`printf %s-%s a b` returned error status"& Result'Img);
      Assert (To_String (Output) = "a-b",
              "Command output for `printf %s-%s a b` should be ""a-b"" " &
              "instead of """ & To_String (Output) & """");

--        declare
--           procedure P;
--           procedure P is begin
--              Spawn ("ThIs_CoMmAnD_dOeSn_T_eXiStS", "", Output, Success, Result);
--           end P;
--           procedure A is new Assert_Except (Test_Spawn, P);
--        begin
--           A (T, "Spawn should raise Ada.IO_Exceptions.Name_Error when spawn " &
--                 """ThIs_CoMmAnD_dOeSn_T_eXiStS"". If you have this command " &
--                 "on your system, remove it to pass the test.",
--                 Ada.IO_Exceptions.Name_Error'Identity);
--        end;

   end Test_Spawn;

   procedure Test_Char_IO (T : in out Test_Case) is
      pragma Unreferenced (T);
      use Char_IO;
      File_Name : constant String := "data/file1.txt";
      Content   : constant String
                := "First Line" & ASCII.LF & "Second Line";
      File      : Char_IO.File_Type;
      Buffer    : Unbounded_String;
      Start_Dir : constant String := Ada.Directories.Current_Directory;
   begin
      Ada.Directories.Set_Directory ("tests/unit");
      Open (File, Append_File, File_Name);
      Buffer := Null_Unbounded_String;
      Read_Whole_File (File, Buffer);

      Assert (To_String (Buffer) = Content,
              "File content incorrect. Found:" & ASCII.LF &
              "<<<" & To_String (Buffer) & ">>>" & ASCII.LF &
              "Instead of:" & ASCII.LF &
              "<<<" & Content & ">>>");

      Buffer := Null_Unbounded_String;
      Read_Whole_File (File, Buffer);
      Close (File);

      Assert (To_String (Buffer) = Content,
              "File content incorrect the second time. Found:" & ASCII.LF &
              "<<<" & To_String (Buffer) & ">>>" & ASCII.LF &
              "Instead of:" & ASCII.LF &
              "<<<" & Content & ">>>");

      Create (File, Out_File, File_Name & "-");
      Write_Whole_File (File, Content);
      Buffer := Null_Unbounded_String;
      Read_Whole_File (File, Buffer);
      Close (File);

      Assert (To_String (Buffer) = Content,
              "File content incorrect after write. Found:" & ASCII.LF &
              "<<<" & To_String (Buffer) & ">>>" & ASCII.LF &
              "Instead of:" & ASCII.LF &
              "<<<" & Content & ">>>");

      Ada.Directories.Set_Directory (Start_Dir);
   exception
      when Error : others =>
         Ada.Directories.Set_Directory (Start_Dir);
         Reraise_Occurrence (Error);
   end Test_Char_IO;

   procedure Test_Get_Set (T : in out Test_Case) is
      pragma Unreferenced (T);
      use Char_IO;
      File_Name : constant String := Temp_Name;
      Content   : constant String := "ABC" & ASCII.CR & "DEF" & ASCII.LF &
                                     "GHI" & ASCII.CR & ASCII.LF;
      Content2  : constant String := "JKL" & ASCII.CR & ASCII.LF;
   begin
      Set_File (File_Name, Content);

      declare
         S : constant String := Get_File (File_Name);
      begin
         Assert (S = Content,
                 "Set_File + Get_File doesn't keep the data intact");
      end;

      Append_File (File_Name, Content2);

      declare
         S : constant String := Get_File (File_Name);
      begin
         Assert (S = Content & Content2,
                 "Append_File not OK. Found:" & ASCII.LF &
              "<<<" & S & ">>>" & ASCII.LF &
              "Instead of:" & ASCII.LF &
              "<<<" & Content & Content2 & ">>>");
      end;
   end Test_Get_Set;

   procedure Test_Logger (T : in out Test_Case) is
      pragma Unreferenced (T);
      Log : Logger_Ptr;
      Buf : Buffer_Logger_Ptr;
      Should_See : constant String := "AAA" & ASCII.LF & "   BBB" &
                   ASCII.LF & "DDD" & ASCII.LF & "MN" & ASCII.LF & "P" &
                   ASCII.LF;
   begin

      Buf := New_Buffer_Logger;
      Log := Logger_Ptr (Buf);

      Assert (Log.Verbosity = 0, "default verbosity");

      Log.Put_Line ("AAA");
      Log.Indent;
      Log.Put_Line (To_Unbounded_String ("BBB"));
      Log.UnIndent;
      Log.Put_Line ("CCC", 1);

      Log.Add_Verbosity (1);
      Log.Put_Line ("DDD", 1);
      Log.Put_Line ("EEE", 2);

      Log.Put ("M");
      Log.Put (To_Unbounded_String ("N"));
      Log.Put (2, To_Unbounded_String ("O"));
      Log.New_Line;
      Log.Put_Line (1, To_Unbounded_String ("P"));

      Assert (To_String (Buf.Buffer) = Should_See,
                "Saw <<<" & To_String (Buf.Buffer) & ">>> instead of <<<" &
                Should_See & ">>>");

      Free (Log);
      Log := Logger_Ptr (New_Standard_Logger);
      Free (Log);
      Log := Logger_Ptr (New_Null_Logger);
      Free (Log);
   end Test_Logger;

   procedure Test_GetEnv (T : in out Test_Case) is
      pragma Unreferenced (T);
      use Ada.Environment_Variables;
   begin
      Clear ("NON_EXISTANT");
      Set ("EXISTANT", "VALUE");

      Assert (GetEnv ("EXISTANT", "") = "VALUE",
                "GetEnv failed for EXISTANT");

      Assert (GetEnv ("NON_EXISTANT", "def") = "def",
                "GetEnv failed for NON_EXISTANT");
   end Test_GetEnv;


end XReq_Util_IO_Test_Suite;
