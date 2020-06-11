with RxUnit; use RxUnit;
with RxUnit.Test_Cases;

package Devices.Pumps.Tests is
   
   type Test_Case is new RxUnit.Test_Cases.Test_Case with null record;

   --  Register routines to be run:
   procedure Register_Tests (T : in out Test_Case);

   --  Provide name identifying the test case:
   function Name (T : Test_Case) return Message_String;

end Devices.Pumps.Tests;
