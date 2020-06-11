with AUnit.Test_Caller;

with AUnit.Assertions;       use AUnit.Assertions;

with XReq.Steps;             use XReq.Steps;
with XReq.Steps.Handles;     use XReq.Steps.Handles;

package body XReq_Steps_Test_Suite is

   package Caller is new AUnit.Test_Caller (Test_Case);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := AUnit.Test_Suites.New_Suite;
   begin
      Ret.Add_Test (Caller.Create ("XReq-Steps: Test Stanza_Given", Test_Stanza_Given'Access));
      Ret.Add_Test (Caller.Create ("XReq-Steps: Test Stanza_When", Test_Stanza_When'Access));
      Ret.Add_Test (Caller.Create ("XReq-Steps: Test Stanza_Then", Test_Stanza_Then'Access));
      Ret.Add_Test (Caller.Create ("XReq-Steps: Test Stanza_Given_Regexp", Test_Stanza_Given_Regexp'Access));
--        Ret.Add_Test (Caller.Create ("XReq-Steps: Test Set_Position", Test_Set_Position'Access));

      return Ret;
   end Suite;

   procedure Test_Stanza_Given (T : in out Test_Case) is
      pragma Unreferenced (T);
   begin
      Assert (Stanza_Given ("A").R.To_String = "Given A",
              "Wrong stanza Given A");
   end Test_Stanza_Given;

   procedure Test_Stanza_When (T : in out Test_Case) is
      pragma Unreferenced (T);
   begin
      Assert (Stanza_When  ("B").R.To_String = "When B",
              "Wrong stanza When B");
   end Test_Stanza_When;

   procedure Test_Stanza_Then (T : in out Test_Case) is
      pragma Unreferenced (T);
   begin
      Assert (Stanza_Then  ("C").R.To_String = "Then C",
              "Wrong stanza Then C");
   end Test_Stanza_Then;

   procedure Test_Stanza_Given_Regexp (T : in out Test_Case) is
      pragma Unreferenced (T);
      Expect : constant String :=
        "@given ^Something ""([^""]*)"" dumb \(""\)$";
      Found  : constant String :=
        Stanza_Given ("Something ""here"" dumb ("")").R.To_Regexp;
   begin
      Assert (Expect = Found, "To_Regexp not OK." & ASCII.LF &
                "Expected: " & Expect & ASCII.LF &
                "Found   : " & Found);
   end Test_Stanza_Given_Regexp;

--     procedure Test_Set_Position (T : in out Test_Case) is
--        pragma Unreferenced (T);
--        S1, S2 : Step_Handle;
--     begin
--        S1 := Stanza_Given ("A");
--        S2 := Stanza_Given ("A");
--
--        S1.R.Set_Position (Position ("toto", 5));
--        Assert (S1.R.Position = Position ("toto"), "Wrong position");
--
--        S2.R.Set_Position (Position ("toto", 5));
--        Assert (S1.R.all = S2.R.all, "Wrong Equals");
--
--     end Test_Set_Position;

end XReq_Steps_Test_Suite;
