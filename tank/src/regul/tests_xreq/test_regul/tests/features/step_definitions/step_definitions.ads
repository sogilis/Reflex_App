

with XReqLib.Args;

use XReqLib.Args;

package step_definitions is

   procedure Set_Up (Feature_File : in String);

   procedure Tear_Down (Feature_File : in String);

   --  @when ^T_sensor is ([0-9]+|\${\S+}) And Set_Point is ([0-9]+|\${\S+}) $
   procedure When_T_sensor_is_20_And_Set_Point_is_40 (Args : in out Arg_Type);

   --  @then ^T_Adjusted is ([0-9]+|\${\S+})  $
   procedure Then_T_Adjusted_is_52_5 (Args : in out Arg_Type);

   --  @given ^second is (TRUE|FALSE) Gradient is ([0-9]+|\${\S+}) Tmax is ([0-9]+|\${\S+})$
   procedure Given_second_is_TRUE_Gradient_is_60_Tmax_is_80 (Args : in out Arg_Type);


   --  @then ^T_Adjusted is 52,5  $
   procedure Then_T_Adjusted_is_52_5_2 (Args : in out Arg_Type);

end step_definitions;
