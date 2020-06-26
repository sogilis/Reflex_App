

with XReqLib.Args;

use XReqLib.Args;

package step_definitions is

   procedure Set_Up (Feature_File : in String);

   procedure Tear_Down (Feature_File : in String);


   --  @given ^Tmax is ([0-9]+|\${\S+})$
   procedure Given_Tmax_is_N (Args : in out Arg_Type);

   --  @when ^T_sensor is ([0-9]+|\${\S+})$
   procedure When_T_sensor_is_N (Args : in out Arg_Type);

   --  @when ^Set_Point is ([0-9]+|\${\S+})$
   procedure When_Set_Point_is_N (Args : in out Arg_Type);

   --  @given ^Gradient is ([0-9]+|\${\S+})$
   procedure Given_Gradient_is_N(Args : in out Arg_Type);

   --  @then ^T_Adjusted is ([-+]?([0-9]*[.])?[0-9]+([eE][-+]?\d+)?)$
   procedure Then_T_Adjusted_is_N (Args : in out Arg_Type);

end step_definitions;
