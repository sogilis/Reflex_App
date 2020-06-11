with AUnit.Test_Suites;    use AUnit.Test_Suites;
with AUnit.Test_Fixtures;

package XReq_Util_Strings_Pool_Test_Suite is

   -- Suite
   function Suite return Access_Test_Suite;

   -- Test Cases
   type Test_Case is new AUnit.Test_Fixtures.Test_Fixture with null record;

   procedure Test_String_Pool (T : in out Test_Case);

end XReq_Util_Strings_Pool_Test_Suite;
