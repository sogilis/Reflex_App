with XReq_Args_Test_Suite;
with XReq_Features_Test_Suite;
with XReq_Generator_Ada05_Test_Suite;
with XReq_Job_Test_Suite;
with XReq_Lang_Test_Suite;
with XReq_Main_Test_Suite;
with XReq_Result_Test_Suite;
with XReq_Steps_Definitions_Test_Suite;
with XReq_Steps_Test_Suite;
with XReq_Util_IO_Test_Suite;
with XReq_Util_Strings_Pool_Test_Suite;
with XReq_Util_Strings_Test_Suite;
with XReqLib_Args_Test_Suite;
with XReqLib_Asserts_Test_Suite;
with XReqLib_Format_Test_Suite;
with XReqLib_Report_Test_Suite;
with XReqLib_String_Tables_Test_Suite;
with XReqLib_Tables_Test_Suite;

package body Composite_Suite is

   --  Here we dynamically allocate the suite using the New_Suite function
   --  We use the 'Suite' functions provided in This_Suite and That_Suite
   --  We also use Ada 2005 distinguished receiver notation to call Add_Test

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
      Result : constant AUnit.Test_Suites.Access_Test_Suite := AUnit.Test_Suites.New_Suite;
   begin
      Result.Add_Test (XReq_Args_Test_Suite.Suite);
      Result.Add_Test (XReq_Features_Test_Suite.Suite);
      Result.Add_Test (XReq_Generator_Ada05_Test_Suite.Suite);
      Result.Add_Test (XReq_Job_Test_Suite.Suite);
      Result.Add_Test (XReq_Lang_Test_Suite.Suite);
      Result.Add_Test (XReq_Main_Test_Suite.Suite);
      Result.Add_Test (XReq_Result_Test_Suite.Suite);
      Result.Add_Test (XReq_Steps_Definitions_Test_Suite.Suite);
      Result.Add_Test (XReq_Steps_Test_Suite.Suite);
      Result.Add_Test (XReq_Util_IO_Test_Suite.Suite);
      Result.Add_Test (XReq_Util_Strings_Pool_Test_Suite.Suite);
      Result.Add_Test (XReq_Util_Strings_Test_Suite.Suite);
      Result.Add_Test (XReqLib_Args_Test_Suite.Suite);
      Result.Add_Test (XReqLib_Asserts_Test_Suite.Suite);
      Result.Add_Test (XReqLib_Format_Test_Suite.Suite);
      Result.Add_Test (XReqLib_Report_Test_Suite.Suite);
      Result.Add_Test (XReqLib_String_Tables_Test_Suite.Suite);
      Result.Add_Test (XReqLib_Tables_Test_Suite.Suite);

      return Result;
   end Suite;

end Composite_Suite;
