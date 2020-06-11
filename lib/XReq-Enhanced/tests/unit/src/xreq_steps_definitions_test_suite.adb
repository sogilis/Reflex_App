with AUnit.Test_Caller;

with Ada.Exceptions;                     use Ada.Exceptions;
with Ada.Strings.Unbounded;              use Ada.Strings.Unbounded;
--  with Ada.Containers;                     use Ada.Containers;
with Ada.Directories;

with Util.IO;                            use Util.IO;
with XReq.Lang;                          use XReq.Lang;
--  with XReq.Steps;                         use XReq.Steps;
--  with XReq.Steps.Handles;                 use XReq.Steps.Handles;
--  with XReq.Step_Definitions.Handles;      use XReq.Step_Definitions.Handles;
with XReq.Step_Definition_List.Handles;  use XReq.Step_Definition_List.Handles;

package body XReq_Steps_Definitions_Test_Suite is

   package Caller is new AUnit.Test_Caller (Test_Case);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := AUnit.Test_Suites.New_Suite;
   begin
      Ret.Add_Test (Caller.Create ("XReq-Steps: Test Step_Definition_Load", Test_Step_Definition_Load'Access));

      return Ret;
   end Suite;

   procedure Test_Step_Definition_Load (T : in out Test_Case) is
      pragma Unreferenced (T);
--        use Step_Match_Vectors;
      Steps   : constant Step_File_List_Handle := Create;
      Dir     : constant String := "data/features/step_definitions";
--        Match_V : Step_Match_Vectors.Vector;
--        Proc_N  : Unbounded_String;
--        StanzaS : constant String := "I match ""abc""";
--        Stanza  : constant Step_Handle := Stanza_When (StanzaS);
--        Found   : Boolean;
--        Loc     : Step_Match_Location;
      Start_Dir : constant String := Ada.Directories.Current_Directory;
   begin
      Ada.Directories.Set_Directory ("tests/unit");
      Steps.R.Load (Std_Logger, Dir, Lang_Ada);

--        Assert (Steps.Ref.all.Contains (Stanza_Given ("this step works")),
--                Dir & " should contains `Given this step works'");
--
--        Assert (Steps.Ref.all.Contains (Stanza_When ("this step works too")),
--                Dir & " should contains `When this step works too'");

--        Assert (Steps.Ref.all.Find (Stanza_When ("this step works too")) =
--                "Sample1.This_Step_Works_Too",
--                "`When this step works too' and link " &
--                "to procedure Sample1.This_Step_Works_Too");
--
--        Assert (not Steps.R.Contains (Stanza_Then ("this step doesn't works")),
--                Dir & " should not contains `Then this step doesn't works'");
--
--        Steps.Ref.all.Find (Stanza_When ("I match nothing"),
--                            Proc_N, Match_V, Found);
--        Assert (not Found, "Found");
--
--        Steps.Ref.all.Find (Stanza, Proc_N, Match_V, Found);
--
--        Assert (Found, "Not found");
--        Assert (To_String (Proc_N) = "Sample2.When_I_Match",
--                "Find should find Sample2.When_I_Match");
--        Assert (Length (Match_V) = 1,
--                "Find should get two captures");
--
--  --       Loc := Element (Match_V, 0);
--  --       T.Assert (Loc.First = StanzaS'First,
--  --               "Find: match 0 should start at" & StanzaS'First'Img &
--  --               " instead of" & Loc.First'Img);
--  --       T.Assert (Loc.Last = StanzaS'Last,
--  --               "Find: match 0 should end at" & StanzaS'Last'Img &
--  --               " instead of" & Loc.Last'Img);
--  --       Loc := Element (Match_V, 1);
--
--        Loc := Element (Match_V, 0);
--        Assert (Loc.First = 10,
--                "Find: match 1 should start at 10" &
--                " instead of" & Loc.First'Img);
--        Assert (Loc.Last = 12,
--                "Find: match 1 should end at 12" &
--                " instead of" & Loc.Last'Img);
      Ada.Directories.Set_Directory (Start_Dir);
   exception
      when Error : others =>
         Ada.Directories.Set_Directory (Start_Dir);
         Reraise_Occurrence (Error);
   end Test_Step_Definition_Load;


end XReq_Steps_Definitions_Test_Suite;
