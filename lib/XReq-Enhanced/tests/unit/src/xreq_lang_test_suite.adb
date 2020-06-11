with AUnit.Test_Caller;

with AUnit.Assertions; use AUnit.Assertions;

with Test_Assertions; use Test_Assertions;

with XReq.Lang;        use XReq.Lang;

package body XReq_Lang_Test_Suite is

   package Caller is new AUnit.Test_Caller (Test_Case);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := AUnit.Test_Suites.New_Suite;
   begin
      Ret.Add_Test (Caller.Create ("XReq-Lang: Test Get_Language_Ada", Test_Get_Language_Ada'Access));
      Ret.Add_Test (Caller.Create ("XReq-Lang: Test Get_Language_C", Test_Get_Language_C'Access));
      Ret.Add_Test (Caller.Create ("XReq-Lang: Test Get_Language_Invalid", Test_Get_Language_Invalid'Access));

      return Ret;
   end Suite;

   procedure Test_Get_Language_Ada (T : in out Test_Case) is
      pragma Unreferenced (T);
   begin
      Assert (Get_Language ("Ada") = Lang_Ada,
                "Could not detect language Ada");
   end Test_Get_Language_Ada;

   procedure Test_Get_Language_C (T : in out Test_Case) is
      pragma Unreferenced (T);
   begin
      Assert (Get_Language ("C") = Lang_C,
                "Could not detect language C");
   end Test_Get_Language_C;

   procedure Test_Get_Language_Invalid (T : in out Test_Case) is
      pragma Unreferenced (T);
      Lang : Language_Type;
      pragma Unreferenced (Lang);
      procedure P;
      procedure P is begin
         Lang := Get_Language ("No_Language");
      end P;
      procedure Test_Assertion is new Assert_Except (P);
   begin
      Test_Assertion ("Get_Language (No_Language) should raise Invalid_Language", Invalid_Language'Identity);
   end Test_Get_Language_Invalid;

end XReq_Lang_Test_Suite;
