with AUnit.Test_Suites;    use AUnit.Test_Suites;
with AUnit.Test_Fixtures;

package XReq_Result_Test_Suite is

   -- Suite
   function Suite return Access_Test_Suite;

   -- Test Cases
   type Test_Case is new AUnit.Test_Fixtures.Test_Fixture with null record;

   procedure Test_Result_Step_Type (T : in out Test_Case);
   procedure Test_Result_Scenario_Type (T : in out Test_Case);
   procedure Test_Result_Feature_Type (T : in out Test_Case);
   procedure Test_To_String (T : in out Test_Case);
   procedure Test_Result_Scenario_Outline (T : in out Test_Case);

end XReq_Result_Test_Suite;
