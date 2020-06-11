with AUnit.Test_Caller;

with AUnit.Assertions; use AUnit.Assertions;

with XReq.Args;

package body XReq_Args_Test_Suite is

   package Caller is new AUnit.Test_Caller (Test_Case);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := AUnit.Test_Suites.New_Suite;
   begin
      Ret.Add_Test (Caller.Create ("XReq-Args: Test Set_Text", Test_Set_Text'Access));

      return Ret;
   end Suite;

   procedure Test_Set_Text (T : in out Test_Case) is
      pragma Unreferenced (T);
      A : XReq.Args.Argument_Type (XReq.Args.Text);
   begin
      XReq.Args.Set_Text (A, "Toto");
      Assert (XReq.Args.Text (A) = "Toto", "not OK");
   end Test_Set_Text;

end XReq_Args_Test_Suite;
