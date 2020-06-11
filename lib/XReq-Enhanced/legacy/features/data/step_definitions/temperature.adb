with XReqLib.Asserts.Float; use XReqLib.Asserts.Float;
with Ada.Text_IO;           use Ada.Text_IO;

package body Temperature is

   Temperature : Float := 0.0;

   procedure Given_temperature_is_x_degrees (Args : in out Arg_Type) is
   begin
      Temperature := Float'Value (Args.Match (1, replace => true));
   end Given_temperature_is_x_degrees;

   procedure When_i_heat_for_x_degrees (Args : in out Arg_Type) is
   begin
      Temperature := Temperature + Float'Value (Args.Match (1));
   end When_i_heat_for_x_degrees;

   procedure Then_the_temperature_shall_be_x_degrees (Args : in out Arg_Type) is
   begin
      Assert (Actual => Temperature,
              Match  => Args.Match (1),
              Reason => "Temperature is equal");
   end Then_the_temperature_shall_be_x_degrees;

end Temperature;
