with XReqLib.Asserts; use XReqLib.Asserts;
with regul.ramps; use regul.ramps;
with XReqLib.Asserts.Float; use XReqLib.Asserts.Float;

package body step_definitions is 

      T_sensor    :  Float;
      Gradient    :  Float;
      Tmax        :  Float;
      T_Adjusted  :  Float;
   

   procedure Set_Up (Feature_File : in String) is

   begin

      null;

   end Set_Up;

   procedure Tear_Down (Feature_File : in String) is

   begin

      null;

   end Tear_Down;

   --  @given ^Gradient is (?:\d+(?:\.\d*)?|\.\d+)$
   procedure Given_Gradient_is_N (Args : in out Arg_Type) is
	Gradient_s   : constant String := Args.Match (1);
   begin

	Gradient := float'value(Gradient_s);  

   end Given_Gradient_is_N;

   --  @given ^Tmax is (?:\d+(?:\.\d*)?|\.\d+)$
   procedure Given_Tmax_is_N (Args : in out Arg_Type) is
	Tmax_s   : constant String := Args.Match (1);
   begin

	Tmax := float'value(Tmax_s);  

   end Given_Tmax_is_N;

     --  @when ^T_sensor is (?:\d+(?:\.\d*)?|\.\d+)$
   procedure When_T_sensor_is_N (Args : in out Arg_Type) is
	T_sensor_s   : constant String := Args.Match (1);
   begin

	T_sensor := float'value(T_sensor_s);  

   end When_T_sensor_is_N;

   --  @when ^Set_Point is (?:\d+(?:\.\d*)?|\.\d+)$
   procedure When_Set_Point_is_N (Args : in out Arg_Type) is
	Set_Point_s   : constant String := Args.Match (1);
   begin

     ramp (Second      => TRUE,
           T_sensor    => T_sensor,
           Set_Point   => float'value(Set_Point_s),
           Gradient    => Gradient,
           Tmax        => Tmax,
           T_Adjusted  => T_Adjusted);

   end When_Set_Point_is_N;

   procedure Then_T_Adjusted_is_N (Args : in out Arg_Type) is 
     Expected_T_Adjusted : constant String := Args.Match (1);
   begin

     Assert
       (Cmp    => T_Adjusted = float'Value (Expected_T_Adjusted),
        Reason =>
          "Wrong T_Adjusted : Actual =>'" & T_Adjusted'Img & "' Expected =>'"
          & Expected_T_Adjusted & "'");

   end Then_T_Adjusted_is_N;

end step_definitions;
