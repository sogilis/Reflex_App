with AUnit.Test_Suites;    use AUnit.Test_Suites;
with AUnit.Test_Fixtures;

package XReq_Lang_Test_Suite is

   -- Suite
   function Suite return Access_Test_Suite;

   -- Test Cases
   type Test_Case is new AUnit.Test_Fixtures.Test_Fixture with null record;

   procedure Test_Get_Language_Ada (T : in out Test_Case);
   procedure Test_Get_Language_C (T : in out Test_Case);
   procedure Test_Get_Language_Invalid (T : in out Test_Case);

end XReq_Lang_Test_Suite;
