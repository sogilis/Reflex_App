with AUnit.Test_Caller;

with AUnit.Assertions; use AUnit.Assertions;

with XReqLib.Tables;

package body XReqLib_Tables_Test_Suite is

   package Caller is new AUnit.Test_Caller (Test_Case);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := AUnit.Test_Suites.New_Suite;
   begin
      Ret.Add_Test (Caller.Create ("XReqLib-Tables: Test Table", Test_Table'Access));

      return Ret;
   end Suite;

   package Tables is new XReqLib.Tables (Integer);

   procedure Test_Table (T : in out Test_Case) is
      pragma Unreferenced (T);
      Ta : Tables.Table;
      E  : Integer;
      Ok : Boolean;

      procedure Check_Empty (Id : in String; Reset : in Boolean);
      procedure Check_Empty (Id : in String; Reset : in Boolean) is
      begin

         if Reset then
            Ta.First_X (0);
            Ta.First_Y (0);
         end if;

         Assert (Ta.Length.X = 0,  "(" & Id & ") Length.X /= 0 =" &
                                                   Ta.Length.X'Img);
         Assert (Ta.Length.Y = 0,  "(" & Id & ") Length.Y /= 0 =" &
                                                   Ta.Length.Y'Img);
         Assert (Ta.Is_Empty,      "(" & Id & ") not Is_Empty");
         Assert (Ta.Count    = 0,  "(" & Id & ") Count /= 0");
         Assert (Ta.First_X  = 0,  "(" & Id & ") First_X /= 0");
         Assert (Ta.First_Y  = 0,  "(" & Id & ") First_X /= 0");
         Assert (Ta.Last_X   = -1, "(" & Id & ") Last_X /= -1");
         Assert (Ta.Last_Y   = -1, "(" & Id & ") Last_Y /= -1");
         Assert (Ta.Length_X = 0,  "(" & Id & ") Length_X /= 0");
         Assert (Ta.Length_Y = 0,  "(" & Id & ") Length_Y /= 0");

         declare
            I : Integer;
            pragma Unreferenced (I);
         begin
            I := Ta.Item (0, 0);
            Assert (False, "(" & Id & ") Item (0, 0) should raise " &
                             "Constraint_Error");
         exception
            when Constraint_Error =>
               null;
         end;

         Ta.Item (0, 0, E, Ok);

         Assert (not Ok, "(" & Id & ") Item (0, 0, E, Ok) is Ok");

      end Check_Empty;

   begin
      Check_Empty ("A", False);

      Ta.Put (0, 0, 5);
      Ta.Put (0, 1, 6);
      Ta.Put (1, 0, 7);
      Ta.Put (1, 2, 8);

      Assert (Ta.Length.X = 2,  "(B) Length.X /= 2 =" & Ta.Length.X'Img);
      Assert (Ta.Length.Y = 3,  "(B) Length.Y /= 3 =" & Ta.Length.Y'Img);
      Assert (not Ta.Is_Empty,  "(B) Is_Empty");
      Assert (Ta.Count    = 4,  "(B) Count /= 4");
      Assert (Ta.First_X  = 0,  "(B) First_X /= 0");
      Assert (Ta.First_Y  = 0,  "(B) First_X /= 0");
      Assert (Ta.Last_X   = 1,  "(B) Last_X /= 1");
      Assert (Ta.Last_Y   = 2,  "(B) Last_Y /= 2");
      Assert (Ta.Length_X = 2,  "(B) Length_X /= 2");
      Assert (Ta.Length_Y = 3,  "(B) Length_Y /= 3");

      Assert (Ta.Item (0, 0) = 5, "(B) Item (0, 0) /= 5");
      Assert (Ta.Item (0, 1) = 6, "(B) Item (0, 1) /= 6");
      Assert (Ta.Item (1, 0) = 7, "(B) Item (1, 0) /= 7");
      Assert (Ta.Item (1, 2) = 8, "(B) Item (1, 2) /= 8");

      Ta.Item (1, 1, E, Ok);
      Assert (not Ok, "(B) Item (1, 1, E, Ok) is Ok");

      Ta.Item (0, 2, E, Ok);
      Assert (not Ok, "(B) Item (0, 2, E, Ok) is Ok");

      Ta.Clear;

      Check_Empty ("C", False);

      Assert (Ta.Last_X = -1,  "(D) Last_X /= -1");
      Assert (Ta.Last_Y = -1,  "(D) Last_Y /= -1");

      Ta.First_X (1); Ta.First_Y (1);

      Assert (Ta.First_X = 1,  "(D) First_X /= 1");
      Assert (Ta.First_Y = 1,  "(D) First_Y /= 1");
      Assert (Ta.Last_X = 0,   "(D) Last_X /= 0");
      Assert (Ta.Last_Y = 0,   "(D) Last_Y /= 0");
      Assert (Ta.Length_X = 0, "(D) Length_X /= 0");
      Assert (Ta.Length_Y = 0, "(D) Length_Y /= 0");

      Ta.Add_X;
      Ta.Add_Y;

      Assert (Ta.First_X = 1,  "(E) First_X /= 1");
      Assert (Ta.First_Y = 1,  "(E) First_Y /= 1");
      Assert (Ta.Last_X = 1,   "(E) Last_X /= 1");
      Assert (Ta.Last_Y = 1,   "(E) Last_Y /= 1");
      Assert (Ta.Length_X = 1, "(E) Length_X /= 1");
      Assert (Ta.Length_Y = 1, "(E) Length_Y /= 1");

      Ta.Item (1, 1, E, Ok);

      Assert (not Ok, "(E) Item (1, 1, E, Ok) is Ok");

      Ta.Clear;
      Assert (Ta.First_X = 1,  "(F) First_X /= 1");
      Assert (Ta.First_Y = 1,  "(F) First_Y /= 1");

      Check_Empty ("G", True);
   end Test_Table;

end XReqLib_Tables_Test_Suite;
