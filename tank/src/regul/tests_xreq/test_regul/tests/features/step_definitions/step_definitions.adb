with XReqLib.Asserts; use XReqLib.Asserts;
with devices.blenders; use devices.blenders;

package body step_definitions is 

    blender   : Blender_Record;
    Run_Order :  Boolean;
    v2_Order  :  Boolean;
    v1_Order  :  Boolean;

   procedure Set_Up (Feature_File : in String) is

   begin

      null;

   end Set_Up;

   procedure Tear_Down (Feature_File : in String) is

   begin

      null;

   end Tear_Down;

   procedure Given_Blender_component_is_initialized (Args : in out Arg_Type) is
      pragma Unreferenced (Args);
   begin

      Blender.Initialize;

   end Given_Blender_component_is_initialized;

   procedure Given_State_N (Args : in out Arg_Type) is
      Blender_Status   : constant String := Args.Match (1);
   begin

      Blender.Set_State(Blender_State'Value(Blender_Status));

   end Given_State_N;

   procedure When_Transition_N (Args : in out Arg_Type) is
      Run        : constant String := Args.Match (1);
      Speed_1       : constant String := Args.Match (2);
      Speed_2      : constant String := Args.Match (3);
   begin

      Blender.Cyclic 
      		(Run       => Boolean'value(Run),
      		 Speed_1   => Boolean'value(Speed_1),
     		 Speed_2   => Boolean'value(Speed_2),
     		 Run_Order => Run_Order,
     		 v2_Order  => v2_Order,
     		 v1_Order  => v1_Order);  


   end When_Transition_N;

   procedure Then_New_state_N(Args : in out Arg_Type) is
     Expected_State     : constant String        := Args.Match (1);
     Expected_Run_Order : constant String        := Args.Match (2);
     Expected_v1_Order  : constant String        := Args.Match (3);
     Expected_v2_Order  : constant String        := Args.Match (4);
     Actual_Result      : constant Blender_State := Blender.Get_State;  
   begin

     Assert
       (Cmp    => Actual_Result = Blender_State'Value (Expected_State),
        Reason =>
          "Wrong Blender_State : Actual =>'" & Actual_Result'Img & "' Expected =>'"
           & Expected_State & "'");

     Assert
       (Cmp    => Run_Order = Boolean'Value (Expected_Run_Order),
        Reason =>
          "Wrong Run_Order : Actual =>'" & Run_Order'Img & "' Expected =>'"
          & Expected_Run_Order & "'");

     Assert
       (Cmp    => v2_Order = Boolean'Value ( Expected_v2_Order ),
        Reason =>
          "Wrong v2_Order : Actual =>'" & v2_Order'Img & "' Expected =>'"
          &  Expected_v2_Order  & "'");

     Assert
       (Cmp    => v1_Order = Boolean'Value ( Expected_v1_Order ),
        Reason =>
          "Wrong v1_Order : Actual =>'" & v1_Order'Img & "' Expected =>'"
          &  Expected_v1_Order  & "'");

   end Then_New_state_N;


   procedure When_T_sensor_is_20_And_Set_Point_is_40 (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end When_T_sensor_is_20_And_Set_Point_is_40;

   procedure Then_T_Adjusted_is_52_5 (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Then_T_Adjusted_is_52_5;

   procedure Given_second_is_TRUE_Gradient_is_60_Tmax_is_80 (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_second_is_TRUE_Gradient_is_60_Tmax_is_80;

   procedure Then_T_Adjusted_is_52_5_2 (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Then_T_Adjusted_is_52_5_2;

   procedure Then_T_Adjusted_is_52_5_2 (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Then_T_Adjusted_is_52_5_2;

end step_definitions;
