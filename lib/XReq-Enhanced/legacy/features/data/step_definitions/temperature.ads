with XReqLib.General;
use  XReqLib.General;

package Temperature is

   --  @given ^temperature is (-?[0-9]+.[0-9]+(E(\+|-)[0-9]+)?|\S+) degrees$
   procedure Given_temperature_is_x_degrees (Args : in out Arg_Type);

   --  @when ^I heat for (-?[0-9]+.[0-9]+) degrees$
   procedure When_i_heat_for_x_degrees (Args : in out Arg_Type);

   --  @then ^the temperature shall be ((>=|<=|<|>)?((-?[0-9]+.[0-9]+(E(\+|-)[0-9]+)?)|\S+)(~-?[0-9]+.[0-9]+(E(\+|-)[0-9]+)?)?%?) degrees$
   procedure Then_the_temperature_shall_be_x_degrees (Args : in out Arg_Type);

end Temperature;
