with XReqLib.Asserts; use XReqLib.Asserts;
with devices.valves; use devices.valves;

package body step_definitions is 

    Valve       : Valve_Record;
    Open      : Boolean;
    Close      : Boolean;
    Opened      : Boolean;
    Open_Order  : Boolean;
    Close_Order : Boolean;

   procedure Set_Up (Feature_File : in String) is

   begin

      null;

   end Set_Up;

   procedure Tear_Down (Feature_File : in String) is

   begin

      null;

   end Tear_Down;

   procedure Given_Valve_component_is_initialized (Args : in out Arg_Type) is
      pragma Unreferenced (Args);
   begin

      Valve.Initialize;

   end Given_Valve_component_is_initialized;

   procedure Given_State_N (Args : in out Arg_Type) is
      Valve_Status   : constant String := Args.Match (1);
   begin

      Valve.Set_State(Valve_State'Value(Valve_Status));

   end Given_State_N;
   
   procedure When_Open_is_N (Args : in out Arg_Type)  is
      Open_s: constant String := Args.Match (1);
   begin

      Open := Boolean'value(Open_s); 
  
   end When_Open_is_N;

   procedure When_Opened_is_N(Args : in out Arg_Type)  is
      Opened_s : constant String := Args.Match (1);
   begin

      Opened := Boolean'value(Opened_s);   

   end When_Opened_is_N;

   procedure When_Close_is_N (Args : in out Arg_Type)  is
      Close_s : constant String := Args.Match (1);
   begin

      Close := Boolean'value(Close_s); 
  
   end When_Close_is_N;

   procedure When_Closed_is_N (Args : in out Arg_Type)  is
      Closed_s      : constant String := Args.Match (1);
   begin

      Valve.Cyclic 
      		(Open        => Open,
      		 Close       => Close,
     		 Opened      => Opened,
     		 Closed      => Boolean'value(Closed_s),
     		 Open_Order  => Open_Order,
     		 Close_Order => Close_Order);

   end When_Closed_is_N;

   procedure Then_New_state_N(Args : in out Arg_Type) is
     Expected_State       : constant String      := Args.Match (1);
     Actual_Result        : constant Valve_State := Valve.Get_State;  
   begin

     Assert
       (Cmp    => Actual_Result = Valve_State'Value (Expected_State),
        Reason =>
          "Wrong Valve_State : Actual =>'" & Actual_Result'Img & "' Expected =>'"
           & Expected_State & "'");

   end Then_New_state_N;
  

   procedure Then_Open_Order_is_N (Args : in out Arg_Type)  is
     Expected_Open_Order  : constant String      := Args.Match (1);
   begin

     Assert
       (Cmp    => Open_Order = Boolean'Value (Expected_Open_Order),
        Reason =>
          "Wrong Open_Order : Actual =>'" & Open_Order'Img & "' Expected =>'"
          & Expected_Open_Order & "'");

   end Then_Open_Order_is_N;

   procedure Then_Close_Order_is_N (Args : in out Arg_Type)  is
     Expected_Close_Order : constant String      := Args.Match (1);
   begin 

     Assert
       (Cmp    => Close_Order = Boolean'Value (Expected_Close_Order),
        Reason =>
          "Wrong Close_Order : Actual =>'" & Close_Order'Img & "' Expected =>'"
          & Expected_Close_Order & "'");

   end Then_Close_Order_is_N;


end step_definitions;
