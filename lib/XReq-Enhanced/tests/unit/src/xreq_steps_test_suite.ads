with AUnit.Test_Suites;    use AUnit.Test_Suites;
with AUnit.Test_Fixtures;

package XReq_Steps_Test_Suite is

   -- Suite
   function Suite return Access_Test_Suite;

   -- Test Cases
   type Test_Case is new AUnit.Test_Fixtures.Test_Fixture with null record;

   procedure Test_Stanza_Given (T : in out Test_Case);
   procedure Test_Stanza_When (T : in out Test_Case);
   procedure Test_Stanza_Then (T : in out Test_Case);
   procedure Test_Stanza_Given_Regexp (T : in out Test_Case);
--     procedure Test_Set_Position (T : in out Test_Case);

end XReq_Steps_Test_Suite;
