with AUnit.Test_Caller;

with AUnit.Assertions;      use AUnit.Assertions;

with Ada.Strings;           use Ada.Strings;
with Ada.Strings.Fixed;     use Ada.Strings.Fixed;

with XReqLib.String_Tables; use XReqLib.String_Tables;

package body XReqLib_String_Tables_Test_Suite is

   package Caller is new AUnit.Test_Caller (Test_Case);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := AUnit.Test_Suites.New_Suite;
   begin
      Ret.Add_Test (Caller.Create ("XReqLib-String-Tables: Test String_Table", Test_String_Table'Access));

      return Ret;
   end Suite;

   procedure Test_String_Table (T : in out Test_Case) is
      pragma Unreferenced (T);
      Ta : XReqLib.String_Tables.Table;
      I  : XReqLib.String_Tables.Cursor;

      procedure Check_Key (K : Key_Type; Elem : in String);
      procedure Check_Key (K : Key_Type; Elem : in String) is
         Should : constant String := "(" & Trim (K.X'Img, Left) & "," &
                  Trim (K.Y'Img, Left) & ")";
      begin
         Assert (Should = Elem, Elem & " should be " & Should);
      end Check_Key;
   begin

      Ta.Put (1, 1, "(1,1)");
      Ta.Put (1, 2, "(1,2)");
      Ta.Put (2, 1, "(2,1)");

      Assert (Ta.Item (1, 1)           = "(1,1)",  "Item(1, 1) not OK");
      Assert (Ta.Item (1, 2)           = "(1,2)",  "Item(1, 2) not OK");
      Assert (Ta.Item (2, 1, "<none>") = "(2,1)",  "Item(2, 1) not OK");
      Assert (Ta.Item (2, 2, "<none>") = "<none>", "Item(2, 2) not OK");

      I := First (Ta);
      Assert (Has_Element (I), "cursor should still have an element");
      Check_Key (Key (I), Element (I));

      Next (I);
      Assert (Has_Element (I), "cursor should still have an element");
      Check_Key (Key (I), Element (I));

      Next (I);
      Assert (Has_Element (I), "cursor should still have an element");
      Check_Key (Key (I), Element (I));

      Next (I);
      Assert (not Has_Element (I), "cursor should not have an element");
   end Test_String_Table;

end XReqLib_String_Tables_Test_Suite;
