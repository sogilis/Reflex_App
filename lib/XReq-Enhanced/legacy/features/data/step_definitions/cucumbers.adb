with XReqLib.Asserts;         use XReqLib.Asserts;
with XReqLib.Asserts.Integer; use XReqLib.Asserts.Integer;
with Ada.Text_IO;             use Ada.Text_IO;

package body Cucumbers is

   Cukes : Integer := 0;

   procedure Given_there_are_n_cucumbers (Args : in out Arg_Type) is
   begin
      Cukes := Integer'Value (Args.Match (1, replace => true));
   end Given_there_are_n_cucumbers;

   procedure When_i_eat_n_cucumbers (Args : in out Arg_Type) is
   begin
      Cukes := Cukes - Integer'Value (Args.Match (1));
   end When_i_eat_n_cucumbers;

   procedure Then_i_should_have_n_cucumbers (Args : in out Arg_Type) is
   begin
      Assert (Actual => Cukes,
              Match  => Args.Match (1),
              Reason => "Wrong number of cucumbers");
   end Then_i_should_have_n_cucumbers;

end Cucumbers;
