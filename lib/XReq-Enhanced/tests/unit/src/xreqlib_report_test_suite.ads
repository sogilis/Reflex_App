with AUnit.Test_Suites;    use AUnit.Test_Suites;
with AUnit.Test_Fixtures;

package XReqLib_Report_Test_Suite is

   -- Suite
   function Suite return Access_Test_Suite;

   -- Test Cases
   type Test_Case is new AUnit.Test_Fixtures.Test_Fixture with null record;

   procedure Test_Success_Report (T : in out Test_Case);
   procedure Test_Fail_Report_Due_Scenario_Failed (T : in out Test_Case);
   procedure Test_Fail_Report_Due_Step_Failed (T : in out Test_Case);
   procedure Test_Fail_Report_Due_Step_Skipped (T : in out Test_Case);

end XReqLib_Report_Test_Suite;
