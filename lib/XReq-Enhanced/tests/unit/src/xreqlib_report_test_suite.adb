with AUnit.Test_Caller;

with AUnit.Assertions; use AUnit.Assertions;

with XReqLib.Report;   use XReqLib.Report;

package body XReqLib_Report_Test_Suite is

   package Caller is new AUnit.Test_Caller (Test_Case);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := AUnit.Test_Suites.New_Suite;
   begin
      Ret.Add_Test (Caller.Create ("XReqLib-Report: Test Success_Report", Test_Success_Report'Access));
      Ret.Add_Test (Caller.Create ("XReqLib-Report: Test Fail_Report_Due_Scenario_Failed", Test_Fail_Report_Due_Scenario_Failed'Access));
      Ret.Add_Test (Caller.Create ("XReqLib-Report: Test Fail_Report_Due_Step_Failed", Test_Fail_Report_Due_Step_Failed'Access));
      Ret.Add_Test (Caller.Create ("XReqLib-Report: Test Fail_Report_Due_Step_Skipped", Test_Fail_Report_Due_Step_Skipped'Access));

      return Ret;
   end Suite;

   procedure Test_Success_Report (T : in out Test_Case) is
      pragma Unreferenced (T);
      Report  : constant Report_Type := (others => <>);
   begin
      Assert (Status (Report), "Report should succeed");
   end Test_Success_Report;

   procedure Test_Fail_Report_Due_Scenario_Failed (T : in out Test_Case) is
      pragma Unreferenced (T);
      Report : constant Report_Type := (Count_Scenario_Failed => 1,
                                        others => <>);
   begin
      Assert (not Status (Report), "Report should fail because scenario failed count is 1");
   end Test_Fail_Report_Due_Scenario_Failed;

   procedure Test_Fail_Report_Due_Step_Failed (T : in out Test_Case) is
      pragma Unreferenced (T);
      Report : constant Report_Type := (Count_Steps_Failed => 1,
                                        others => <>);
   begin
      Assert (not Status (Report), "Report should fail because step failed count is 1");
   end Test_Fail_Report_Due_Step_Failed;

   procedure Test_Fail_Report_Due_Step_Skipped (T : in out Test_Case) is
      pragma Unreferenced (T);
      Report : constant Report_Type := (Count_Steps_Skipped => 1,
                                        others => <>);
   begin
      Assert (not Status (Report), "Report should fail because step skipped count is 1");
   end Test_Fail_Report_Due_Step_Skipped;

end XReqLib_Report_Test_Suite;
