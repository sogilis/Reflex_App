with Devices.Pumps.Tests;

package body Devices.Pumps_Suite is

   Result : aliased Test_Suite;

   Test_Case_Events : aliased Devices.Pumps.Tests.Test_Case;

   function Suite return Access_Test_Suite is
   begin
      Add_Test (Result'Access, Test_Case_Events'Access);

      return Result'Access;
   end Suite;

end Devices.Pumps_Suite;
