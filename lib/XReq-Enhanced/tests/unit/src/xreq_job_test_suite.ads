with AUnit.Test_Suites;    use AUnit.Test_Suites;
with AUnit.Test_Fixtures;

package XReq_Job_Test_Suite is

   -- Suite
   function Suite return Access_Test_Suite;

   -- Test Cases
   type Test_Case is new AUnit.Test_Fixtures.Test_Fixture with null record;

   procedure Test_First_Step_Dir (T : in out Test_Case);
   procedure Test_Fill_Missing (T : in out Test_Case);
   procedure Test_Job_Environment (T : in out Test_Case);
   procedure Test_Run (T : in out Test_Case);
   procedure Test_Options (T : in out Test_Case);

end XReq_Job_Test_Suite;
