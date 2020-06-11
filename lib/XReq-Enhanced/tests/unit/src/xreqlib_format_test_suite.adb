with AUnit.Test_Caller;

with AUnit.Assertions; use AUnit.Assertions;

with XReqLib.Format;   use XReqLib.Format;

package body XReqLib_Format_Test_Suite is

   package Caller is new AUnit.Test_Caller (Test_Case);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := AUnit.Test_Suites.New_Suite;
   begin
      Ret.Add_Test (Caller.Create ("XReqLib-Format: Test Get_Duration", Test_Get_Duration'Access));

      return Ret;
   end Suite;

   procedure Test_Get_Duration (T : in out Test_Case) is
      pragma Unreferenced (T);
   begin
      Assert (Get_Duration (Duration (65)), "1m 5s",
                "Get_Duration (65) /= 1m 5s");
   end Test_Get_Duration;

end XReqLib_Format_Test_Suite;
