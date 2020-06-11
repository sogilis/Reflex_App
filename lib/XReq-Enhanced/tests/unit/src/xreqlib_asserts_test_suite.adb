with AUnit.Test_Caller;

with AUnit.Assertions; use AUnit.Assertions;
with Ada.Exceptions;   use Ada.Exceptions;

with XReqLib.Asserts;

package body XReqLib_Asserts_Test_Suite is

   package Caller is new AUnit.Test_Caller (Test_Case);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := AUnit.Test_Suites.New_Suite;
   begin
      Ret.Add_Test (Caller.Create ("XReqLib-Asserts: Test Assert", Test_Assert'Access));

      return Ret;
   end Suite;

   procedure Test_Assert (T : in out Test_Case) is
      pragma Unreferenced (T);
      package Lib renames XReqLib.Asserts;
   begin
      Lib.Assert (True, "This error shouldn't happen");
      begin
         Lib.Assert (False, "errmsg");
         Assert (False, "Assert should raise XReqLib.Asserts.Error");
      exception
         when E : Lib.Error =>
            Assert (Exception_Message (E) = "errmsg",
                      "Exception message not OK. Found: '" &
                      Exception_Message (E) & "'");
      end;
      Lib.Equals ("a", "a", "This error shouldn't happen");
      begin
         Lib.Equals ("a", "b", "errmsg");
         Assert (False, "Assert should raise XReqLib.Asserts.Error");
      exception
         when Lib.Error =>
            Assert (True, "");
      end;
      begin
         Lib.Equals ("a", "b");
         Assert (False, "Assert should raise XReqLib.Asserts.Error");
      exception
         when Lib.Error =>
            Assert (True, "");
      end;
   end Test_Assert;

end XReqLib_Asserts_Test_Suite;
