with XReqLib.Asserts; use XReqLib.Asserts;
with devices.blenders; use devices.blenders;

package body step_definitions is 

    blender   : Blender_Record;
    Run       : Boolean;
    Speed_1   : Boolean;
    Speed_2   : Boolean;
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

   procedure When_Run_is_N (Args : in out Arg_Type) is

   Run_s : constant String := Args.Match (1);

   begin

       Run := Boolean'value(Run_s);
   
   end When_Run_is_N;


   procedure When_Speed_1_is_N (Args : in out Arg_Type) is

   Speed_1_s : constant String := Args.Match (1);

   begin

       Speed_1 := Boolean'value(Speed_1_s);
   
   end When_Speed_1_is_N;

   procedure When_Speed_2_is_N (Args : in out Arg_Type) is

      Speed_2_s      : constant String := Args.Match (1);

   begin

      Blender.Cyclic 
      		(Run       => Run,
      		 Speed_1   => Speed_1,
     		 Speed_2   => Boolean'value(Speed_2_s),
     		 Run_Order => Run_Order,
     		 v2_Order  => v2_Order,
     		 v1_Order  => v1_Order);  


   end When_Speed_2_is_N;


   procedure Then_New_state_is_N (Args : in out Arg_Type) is   
     Expected_State       : constant String      := Args.Match (1);
     Actual_Result        : constant Blender_State := Blender.Get_State;  
   begin

     Assert
       (Cmp    => Actual_Result = Blender_State'Value (Expected_State),
        Reason =>
          "Wrong Blender_State : Actual =>'" & Actual_Result'Img & "' Expected =>'"
           & Expected_State & "'");

   end Then_New_state_is_N;


   procedure Then_Run_Order_is_N (Args : in out Arg_Type) is  
     Expected_Run_Order  : constant String      := Args.Match (1);
   begin

     Assert
       (Cmp    => Run_Order = Boolean'Value (Expected_Run_Order),
        Reason =>
          "Wrong Run_Order : Actual =>'" & Run_Order'Img & "' Expected =>'"
          & Expected_Run_Order & "'");

   end Then_Run_Order_is_N;


   procedure Then_v1_Order_is_N (Args : in out Arg_Type) is
     Expected_v1_Order  : constant String      := Args.Match (1);
   begin

     Assert
       (Cmp    => v1_Order = Boolean'Value (Expected_v1_Order),
        Reason =>
          "Wrong v1_Order : Actual =>'" & v1_Order'Img & "' Expected =>'"
          & Expected_v1_Order & "'");

   end Then_v1_Order_is_N;


   procedure Then_v2_Order_is_N (Args : in out Arg_Type)is
     Expected_v2_Order  : constant String := Args.Match (1);
   begin

     Assert
       (Cmp    => v2_Order = Boolean'Value (Expected_v2_Order),
        Reason =>
          "Wrong v1_Order : Actual =>'" & v2_Order'Img & "' Expected =>'"
          & Expected_v2_Order & "'");

   end Then_v2_Order_is_N;

end step_definitions;
