with AUnit.Test_Caller;

with AUnit.Assertions;       use AUnit.Assertions;

with Ada.Strings.Unbounded;  use Ada.Strings.Unbounded;

with Util.Strings.Pool;      use Util.Strings.Pool;

package body XReq_Util_Strings_Pool_Test_Suite is

   package Caller is new AUnit.Test_Caller (Test_Case);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := AUnit.Test_Suites.New_Suite;
   begin
      Ret.Add_Test (Caller.Create ("XReq-Util-Strings-Pool: Test String_Pool", Test_String_Pool'Access));

      return Ret;
   end Suite;

   procedure Test_String_Pool (T : in out Test_Case) is
      pragma Unreferenced (T);
      Pool : String_Pool;
      Str  : Unbounded_String;
   begin

      Get_Unique_String (Pool, "Test1", Str);
      Assert (To_String (Str) = "Test1",
              "Could not insert 'Test1' in pool");

      Get_Unique_String (Pool, "Test1", Str);
      Assert (To_String (Str) /= "Test1",
              "Get_Unique_String do not return a unique string: " &
              To_String (Str));

      Get_Unique_String (Pool, "Test2", Str);
      Assert (To_String (Str) = "Test2",
              "Could not insert 'Test2' in pool");

      Get_Unique_String (Pool, "Test2", Str);
      Assert (To_String (Str) /= "Test2",
              "Get_Unique_String do not return a unique string: " &
              To_String (Str));

   end Test_String_Pool;

end XReq_Util_Strings_Pool_Test_Suite;
