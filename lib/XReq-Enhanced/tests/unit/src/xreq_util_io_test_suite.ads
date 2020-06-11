with AUnit.Test_Suites;    use AUnit.Test_Suites;
with AUnit.Test_Fixtures;

package XReq_Util_IO_Test_Suite is

   -- Suite
   function Suite return Access_Test_Suite;

   -- Test Cases
   type Test_Case is new AUnit.Test_Fixtures.Test_Fixture with null record;

   procedure Test_File_Open (T : in out Test_Case);
   procedure Test_Spawn (T : in out Test_Case);
   procedure Test_Char_IO (T : in out Test_Case);
   procedure Test_Get_Set (T : in out Test_Case);
   procedure Test_Logger (T : in out Test_Case);
   procedure Test_GetEnv (T : in out Test_Case);

end XReq_Util_IO_Test_Suite;
