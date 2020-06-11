with AUnit.Test_Suites;    use AUnit.Test_Suites;
with AUnit.Test_Fixtures;

package XReq_Util_Strings_Test_Suite is

   -- Suite
   function Suite return Access_Test_Suite;

   -- Test Cases
   type Test_Case is new AUnit.Test_Fixtures.Test_Fixture with null record;

   procedure Test_Starts_With (T : in out Test_Case);
   procedure Test_Find_Token (T : in out Test_Case);
   procedure Test_Trimed_Suffix (T : in out Test_Case);
   procedure Test_To_Identifier (T : in out Test_Case);
   procedure Test_Buffer (T : in out Test_Case);
   procedure Test_C_String (T : in out Test_Case);
   procedure Test_Ada_string (T : in out Test_Case);
--     procedure Test_Decode_Python (T : in out Test_Case);
   procedure Test_Decode_String (T : in out Test_Case);
   procedure Test_Relative_Path (T : in out Test_Case);
   procedure Test_Reverse_Path (T : in out Test_Case);
   procedure Test_Goto_Path (T : in out Test_Case);
   procedure Test_Replace (T : in out Test_Case);
   procedure Test_Package_File_Id (T : in out Test_Case);

end XReq_Util_Strings_Test_Suite;
