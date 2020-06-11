with AUnit.Test_Caller;

with AUnit.Assertions;       use AUnit.Assertions;

with Ada.Strings.Unbounded;  use Ada.Strings.Unbounded;
with Ada.Exceptions;         use Ada.Exceptions;

with Util.Strings;           use Util.Strings;

package body XReq_Util_Strings_Test_Suite is

   package Caller is new AUnit.Test_Caller (Test_Case);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := AUnit.Test_Suites.New_Suite;
   begin
      Ret.Add_Test (Caller.Create ("XReq-Util-Strings: Test Starts_With", Test_Starts_With'Access));
      Ret.Add_Test (Caller.Create ("XReq-Util-Strings: Test Find_Token", Test_Find_Token'Access));
      Ret.Add_Test (Caller.Create ("XReq-Util-Strings: Test Trimed_Suffix", Test_Trimed_Suffix'Access));
      Ret.Add_Test (Caller.Create ("XReq-Util-Strings: Test To_Identifier", Test_To_Identifier'Access));
      Ret.Add_Test (Caller.Create ("XReq-Util-Strings: Test Buffer", Test_Buffer'Access));
--        Ret.Add_Test (Caller.Create ("XReq-Util-Strings: Test C_String", Test_C_String'Access));
--        Ret.Add_Test (Caller.Create ("XReq-Util-Strings: Test Ada_string", Test_Ada_string'Access));
--        Ret.Add_Test (Caller.Create ("XReq-Util-Strings: Test Decode_Python", Test_Decode_Python'Access));
      Ret.Add_Test (Caller.Create ("XReq-Util-Strings: Test Decode_String", Test_Decode_String'Access));
      Ret.Add_Test (Caller.Create ("XReq-Util-Strings: Test Relative_Path", Test_Relative_Path'Access));
      Ret.Add_Test (Caller.Create ("XReq-Util-Strings: Test Reverse_Path", Test_Reverse_Path'Access));
      Ret.Add_Test (Caller.Create ("XReq-Util-Strings: Test Goto_Path", Test_Goto_Path'Access));
      Ret.Add_Test (Caller.Create ("XReq-Util-Strings: Test Replace", Test_Replace'Access));
      Ret.Add_Test (Caller.Create ("XReq-Util-Strings: Test Package_File_Id", Test_Package_File_Id'Access));

      return Ret;
   end Suite;

   procedure Test_Starts_With (T : in out Test_Case) is
      pragma Unreferenced (T);
      Search : constant String := "abc 123 ABC 456";
   begin
      Assert (Starts_With (Search, "abc"),
              "Should start with 'abc'");

      Assert (Starts_With (Search, "abc 123"),
              "Should start with 'abc 123'");

      Assert (Starts_With (Search, " 123", 4),
              "Should start with ' 123' at position 4");

      Assert (Starts_With (Search, "123 ABC", 5),
              "Should start with '123 ABC' at position 5");

      Assert (not Starts_With (Search, "123"),
              "Should not start with '123'");

      Assert (not Starts_With (Search, "4567", 13),
              "Should not start with '4567' at position 13");
   end Test_Starts_With;

   procedure Test_Find_Token (T : in out Test_Case) is
      pragma Unreferenced (T);
      Search : constant String := " @tk1 A @tk2 B @tk3 C ";
      Tokens : constant String_List := (To_Unbounded_String ("@tk3"),
                                        To_Unbounded_String ("@tk2"),
                                        To_Unbounded_String ("@tk1"));
      Index  : Natural;
      Token  : Natural;
   begin
      Find_Token ("", Tokens, Index, Token);

      Assert (Token = 0, "token found found");
      Assert (Index = 0, "index out of bounds");

      Find_Token (Search, Tokens, Index, Token);

      Assert (Token /= 0, "No token found");
      Assert (Index /= 0, "No index found");

      Assert (Token = 3,
              "@tk1 not found, found token #" & Natural'Image (Token) & " " &
              To_String (Tokens (Token)));

      Assert (Index = 6,
              "@tk1 not at the correct position. Found: " &
              Natural'Image (Index) & " instead of 6");
   end Test_Find_Token;

   procedure Test_Trimed_Suffix (T : in out Test_Case) is
      pragma Unreferenced (T);

      function Call (Source : in String;
                     Start_Index : in Natural) return String;

      function Call (Source : in String;
                     Start_Index : in Natural) return String is
         Result1 : constant String := Trimed_Suffix (Source, Start_Index);
         Result2 : constant String := To_String (
                   Trimed_Suffix (To_Unbounded_String (Source), Start_Index));
      begin
         Assert (Result1 = Result2, "Trimed_Suffix is not the same for " &
                 "type String and Unbounded_String. '" & Result1 & "' /= '" &
                 Result2 & "'");
         return Result1;
      end Call;

   begin

      Assert (Call ("   ABC   DEF  ",  1) = "ABC   DEF  ", "Error1");
      Assert (Call ("   ABC   DEF  ",  4) = "ABC   DEF  ", "Error2");
      Assert (Call ("   ABC   DEF  ",  5) =  "BC   DEF  ", "Error3");
      Assert (Call ("   ABC   DEF  ",  7) =       "DEF  ", "Error4");
--        Assert (Call ("   ABC   DEF  ", 13) =            "", "Error5");
--        Assert (Call ("   ABC   DEF  ", 20) =            "", "Error6");
--        Assert (Call ("",               22) =            "", "Error7");
      Assert (Call ("",                0) =            "", "Error8");

   exception
      when Error : others =>
--         Put_Line (Exception_Information (Error));
         Reraise_Occurrence (Error);

   end Test_Trimed_Suffix;

   procedure Test_To_Identifier (T : in out Test_Case) is
      pragma Unreferenced (T);
   begin
      Assert (To_Identifier ("This is a title ") = "This_is_a_title", "Error1");

      Assert (To_Identifier ("999 title ") = "title", "Error2");

      Assert (To_Identifier ("Test 7") = "Test_7", "Error3");

      Assert (To_Identifier ("!  Test & ( 8 ") = "Test_8", "Error4");

      Assert (To_Identifier ("toto_") = "toto", "Error5");
   end Test_To_Identifier;

   procedure Test_Buffer (T : in out Test_Case) is
      pragma Unreferenced (T);
      B : Buffer_Type;
   begin

      Assert (B.Value = "", "Buffer should be empty when initialized");
      B.Put_Line ("first line");
      Assert (B.Value = "first line" & B.CRLF, "Put_Line not OK");
      B.Indent (5);
      B.Put_Indent;
      B.Put ("toto");
      B.New_Line;
      Assert (B.Value = "first line" & B.CRLF & "     toto" & B.CRLF,
              "(Indent (5); Put_Indent; Put; New_Line) not OK");
      B.Clear;
      Assert (B.Value = "", "Clear not OK");
      B.UnIndent (2);
      B.Put_Line (To_Unbounded_String ("tata"));
      Assert (B.Value = "   tata" & B.CRLF,
                "(UnIndent (2); Put_Line) not OK");
      B.UnIndent (3);
      B.Put_Indent;
      B.Put (To_Unbounded_String ("titi"));
      Assert (B.Value = "   tata" & B.CRLF & "titi",
              "(UnIndent (3); Put) not OK");
   end Test_Buffer;

   procedure Test_C_String (T : in out Test_Case) is
      pragma Unreferenced (T);
      Test1 : constant String := "This ""is"" a test";
      Res1  : constant String := """This \""is\"" a test""";

      Test2 : constant String := "This ""is"" a test" & ASCII.LF;
      Res2  : constant String := """This \""is\"" a test\012""";

      Test3 : constant String := "This ""is"" a test" & ASCII.LF & "nl";
      Res3  : constant String := """This \""is\"" a test\012nl""";
   begin
      Assert (C_String (Test1) = Res1,
              "Failed: " & Res1 & ASCII.LF &
              "Got: " & C_String (Test1));

      Assert (C_String (Test2) = Res2,
              "Failed: " & Res2 & ASCII.LF &
              "Got: " & C_String (Test2));

      Assert (C_String (Test3) = Res3,
              "Failed: " & Res3 & ASCII.LF &
              "Got: " & C_String (Test3));
   end Test_C_String;

   procedure Test_Ada_string (T : in out Test_Case) is
      pragma Unreferenced (T);
      Test1 : constant String := "This ""is"" a test";
      Res1  : constant String := """This """"is"""" a test""";
      Test2 : constant String := "This ""is"" a test" & ASCII.LF;
      Res2  : constant String := """This """"is"""" a test"" & " &
                                 "Character'Val (10)";
      Test3 : constant String := "This ""is"" a test" & ASCII.LF & "nl";
      Res3  : constant String := """This """"is"""" a test"" & " &
                                 "Character'Val (10) & ""nl""";
   begin
      Assert (Ada_String (Test1) = Res1,
              "Failed: " & Res1 & ASCII.LF &
              "Got: " & Ada_String (Test1));

      Assert (Ada_String (Test2) = Res2,
              "Failed: " & Res2 & ASCII.LF &
              "Got: " & Ada_String (Test2));

      Assert (Ada_String (Test3) = Res3,
              "Failed: " & Res3 & ASCII.LF &
              "Got: " & Ada_String (Test3));
   end Test_Ada_string;

--     procedure Test_Decode_Python (T : in out Test_Case) is
--        pragma Unreferenced (T);
--
--        procedure Compare (Python : in String; Original : in String);
--        procedure Compare (Python : in String; Original : in String) is
--           Str : constant String := Decode_Python (Python);
--        begin
--           Assert (Str = Original, "Decode_Python error." & ASCII.LF &
--                   "Expected       """ & Original & """" & ASCII.LF &
--                   "Got            """ & Str & """" & ASCII.LF &
--                   "While decoding """ & Python & """");
--        end Compare;
--     begin
--
--        Compare ("abc\" & ASCII.LF & "\\d\'e\""f", "abc\d'e""f");
--        Compare ("a\ab\bf\fn\nn",     "a" & ASCII.BEL & "b" & ASCII.BS  &
--                                      "f" & ASCII.FF  & "n" & ASCII.LF  & "n");
--        Compare ("r\rt\tv\vv\222end", "r" & ASCII.CR  & "t" & ASCII.HT &
--                                      "v" & ASCII.VT  & "v" &
--                                      Character'Val (8#222#) & "end");
--        Compare ("a\x56a\xfaa", "a" & Character'Val (16#56#) &
--                                "a" & Character'Val (16#FA#) & "a");
--        Assert (String'(Decode_Python ("h\hh", True)) = "h\hh",
--                "Liberal not OK");
--        declare
--           procedure P;
--           procedure P is begin
--              Assert (String'(Decode_Python ("h\hh")) = "h\hh", "...");
--           end P;
--           procedure A is new Assert_Except (Test_Decode_Python, P);
--        begin
--           A (T, "Decode_Python should raise Constraint_Error",
--              Constraint_Error'Identity);
--        end;
--
--     end Run;

   procedure Test_Decode_String (T : in out Test_Case) is
      pragma Unreferenced (T);

      procedure Compare (Python : in String; Original : in String);
      procedure Compare (Python : in String; Original : in String) is
         Str : constant String := Decode_String (Python);
      begin
         Assert (Str = Original, "Decode_String error." & ASCII.LF &
                 "Expected       " & Ada_String (Original) & ASCII.LF &
                 "Got            " & Ada_String (Str) & ASCII.LF &
                 "While decoding """ & Python & """");
      end Compare;
   begin

      Compare ("abc\ndef", "abc" & ASCII.LF & "def");
      Compare ("abc\def",  "abc\def");
      Compare ("abcdef\",  "abcdef\");

   end Test_Decode_String;

   procedure Test_Relative_Path (T : in out Test_Case) is
      pragma Unreferenced (T);

      procedure Check (Prefix, Element, Result : in String);
      procedure Check (Prefix, Element, Result : in String) is
         Res : constant String := Relative_Path (Prefix, Element);
      begin
         Assert (Result = Res,
                   "Relative_Path (""" & Prefix & """, """ & Element & """) " &
                   "= """ & Res & """ /= """ & Result & """");
      end Check;

   begin

      Check ("toto/tata",       "titi",                 "toto/tata/titi");
      Check ("toto/tata",       "ti/ta",                "toto/tata/ti/ta");
      Check ("toto/tata",       "/ti/ta",               "/ti/ta");
      Check ("toto/tata/",      "titi",                 "toto/tata/titi");
      Check ("toto/tata/",      "ti/ta/",               "toto/tata/ti/ta/");
      Check ("toto/tata/",      "/ti/ta",               "/ti/ta");
      Check ("toto/tata",       "./a/ti",               "toto/tata/a/ti");
      Check ("toto/tata/",      "./a/ti/",              "toto/tata/a/ti/");
      Check ("toto/tata",       "../a/ti",              "toto/a/ti");
      Check ("toto/tata/",      "../a/ti",              "toto/a/ti");
      Check ("toto/tata/",      "./../../a/ti",         "a/ti");
      Check ("toto/",           "./../../a/ti",         "../a/ti");

   end Test_Relative_Path;

   procedure Test_Reverse_Path (T : in out Test_Case) is
      pragma Unreferenced (T);

      procedure Check (Path, Result : in String);
      procedure Check (Path, Result : in String) is
         Res : constant String := Reverse_Path (Path);
      begin
         Assert (Result = Res,
                   "Reverse_Path (""" & Path & """) " &
                   "= """ & Res & """ /= """ & Result & """");
      end Check;

   begin

      Check ("toto/tata",       "../..");
      Check ("toto/tata/",      "../..");
      Check ("toto",            "..");
      Check ("/toto",           "/");

   end Test_Reverse_Path;

   procedure Test_Goto_Path (T : in out Test_Case) is
      pragma Unreferenced (T);

      procedure Check (P1, P2, Result : in String);
      procedure Check (P1, P2, Result : in String) is
         Res : constant String := Goto_Path (P1, P2);
      begin
         Assert (Result = Res,
                   "Reverse_Path (""" & P1 & """, """ & P2 & """) " &
                   "= """ & Res & """ /= """ & Result & """");
      end Check;

   begin

      Check ("toto/tata",       "toto/titi",            "../titi");
      Check ("../toto/tata/",   "../tutu",              "../../tutu");
      Check ("toto/tata",       "toto/tata/titi",       "titi");
      Check ("toto/tata",       "toto/tatatiti",        "../tatatiti");
      Check ("toto/tata",       "toto",                 "..");
      Check ("toto/tata",       "tototata",             "../../tototata");
      Check ("feat/tests",      "feat/tests/a",         "a");
      Check ("feat/tests",      "feat/a.f",             "../a.f");
      Check ("feat/tests",      "feat/",                "..");
      Check ("feat/tests",      "feat",                 "..");

   end Test_Goto_Path;

   procedure Test_Replace (T : in out Test_Case) is
      pragma Unreferenced (T);
   begin

      Assert (Replace ("abcabc", "abc", "Aabc") = "AabcAabc", "not OK");

   end Test_Replace;

   procedure Test_Package_File_Id (T : in out Test_Case) is
      pragma Unreferenced (T);
   begin

      Assert (To_Package_File_Id ("First_Second.Last") = "first_second-last",
                "To_Package_File_Id not OK");

   end Test_Package_File_Id;

end XReq_Util_Strings_Test_Suite;
