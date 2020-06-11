with XReqLib.Asserts; use XReqLib.Asserts;
with devices.pumps; use devices.pumps;

package body step_definitions is 

    Pump        : Pump_Record;
    Run         : Boolean;
    Run_order   : Boolean;

   procedure Set_Up (Feature_File : in String) is

   begin

      null;

   end Set_Up;

   procedure Tear_Down (Feature_File : in String) is

   begin

      null;

   end Tear_Down;

   procedure Given_Pump_component_is_initialized (Args : in out Arg_Type) is
      pragma Unreferenced (Args);
   begin

      Pump.Initialize;

   end Given_Pump_component_is_initialized;

   procedure Given_State_N (Args : in out Arg_Type) is
      Pump_Status   : constant String := Args.Match (1);
   begin

      Pump.Set_State(Pump_State'Value(Pump_Status));

   end Given_State_N;

   procedure When_Run_is_N (Args : in out Arg_Type) is

   Run_s : constant String := Args.Match (1);

   begin

       Run := Boolean'value(Run_s);
   
   end When_Run_is_N;


   procedure When_Running_is_N (Args : in out Arg_Type) is

   Running_s : constant String := Args.Match (1);

   begin

      Pump.Cyclic    
     	  (Run        => Run,
      	   Running    => Boolean'value(Running_s),
      	   Run_Order  => Run_Order);
   
   end When_Running_is_N;


   procedure Then_New_state_is_N (Args : in out Arg_Type) is   
     Expected_State       : constant String     := Args.Match (1);
     Actual_Result        : constant Pump_State := Pump.Get_State;  
   begin

     Assert
       (Cmp    => Actual_Result = Pump_State'Value (Expected_State),
        Reason =>
          "Wrong Pump_State : Actual =>'" & Actual_Result'Img & "' Expected =>'"
           & Expected_State & "'");

   end Then_New_state_is_N;

   procedure Then_Run_Order_is_N(Args : in out Arg_Type) is
     Expected_Run_Order : constant String      := Args.Match (1);
   begin

     Assert
       (Cmp    => Run_Order = Boolean'Value (Expected_Run_Order),
        Reason =>
          "Wrong Run_Order : Actual =>'" & Run_Order'Img & "' Expected =>'"
          & Expected_Run_Order & "'");

   end Then_Run_Order_is_N;

end step_definitions;
