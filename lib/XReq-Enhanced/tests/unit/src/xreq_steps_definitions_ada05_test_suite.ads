with AUnit.Test_Suites;    use AUnit.Test_Suites;
with AUnit.Test_Fixtures;

package XReq_Steps_Definitions_Ada05_Test_Suite is

   -- Suite
   function Suite return Access_Test_Suite;

   -- Test Cases
   type Test_Case is new AUnit.Test_Fixtures.Test_Fixture with null record;

   procedure Test_Step_Definition_Load (T : in out Test_Case);

end XReq_Steps_Definitions_Ada05_Test_Suite;
