with XReqLib.Asserts; use XReqLib.Asserts;
with Tank.Main; use Tank.Main;
with Tank.Cycle; use Tank.Cycle;
with Tank.Filling; use Tank.Filling;
with Devices.Valves; use Devices.Valves;




package body step_definitions is 

      Cycle            : Cycle_Record;
      Filling       : Filling_Record;
    Valve       : Valve_Record;
      End_Filling_P1   : Boolean;
      End_Filling_P2   : Boolean;
      End_Mixing       : Boolean;
      Filling_P1_Order : Boolean;
      Filling_P2_Order : Boolean;
      Mixing_Order     : Boolean;
      Emptying_Order   : Boolean;
      End_Cycle        : Boolean;
      Valves_Opened : Boolean;
      Valves_Closed : Boolean;
      Pumps_Started : Boolean;
      Open_Valves   : Boolean;
      Start_Pumps   : Boolean;
      Close_Valves  : Boolean;
    Open        : Boolean;
    Close       : Boolean;
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

   procedure Given_Application_is_initialized (Args : in out Arg_Type) is
      pragma Unreferenced (Args);
   begin

     Initialize;

   end Given_Application_is_initialized;

   procedure Given_State_Init_State (Args : in out Arg_Type) is
   begin

      Cycle.Set_State(Init_State);


   end Given_State_Init_State;

   procedure Given_State_cycle_N (Args : in out Arg_Type) is
     Cycle_State_s   : constant String := Args.Match (1);
   begin

      Cycle.Set_State(Cycle_State'value(Cycle_State_s));

   end Given_State_cycle_N;

   procedure Given_State_filling_is_N (Args : in out Arg_Type) is
     Cycle_State_s   : constant String := Args.Match (1);
   begin

      filling.Set_State(Filling_State'value(Cycle_State_s));

   end Given_State_filling_is_N;

   procedure Given_State_valve_is_N (Args : in out Arg_Type) is
      Valve_Status   : constant String := Args.Match (1);
   begin

      Valve.Set_State(Valve_State'Value(Valve_Status));

   end Given_State_valve_is_N;


   procedure When_End_Filling_P1_is_N (Args : in out Arg_Type) is
   End_Filling_P1_s : constant String := Args.Match (1);
   begin

       End_Filling_P1 := Boolean'value(End_Filling_P1_s);

   end When_End_Filling_P1_is_N;



   procedure When_End_Filling_P2_is_N (Args : in out Arg_Type) is
   End_Filling_P2_s : constant String := Args.Match (1);
   begin

       End_Filling_P2 := Boolean'value(End_Filling_P2_s);

   end When_End_Filling_P2_is_N;


   procedure When_End_Mixing_is_N (Args : in out Arg_Type) is
   End_Mixing_s : constant String := Args.Match (1);
   begin

       End_Mixing := Boolean'value(End_Mixing_s);

   end When_End_Mixing_is_N;


   procedure When_End_Emptying_is_N (Args : in out Arg_Type) is
      End_Emptying   : constant String := Args.Match (1);
   begin

     Cycle.Cyclic 
                (End_Filling_P1   => End_Filling_P1,
     		 End_Filling_P2   => End_Filling_P2,
     		 End_Mixing       => End_Mixing,
     		 End_Emptying     => Boolean'value(End_Emptying),
     		 Filling_P1_Order => Filling_P1_Order,
      	 	 Filling_P2_Order => Filling_P2_Order,
      	 	 Mixing_Order     => Mixing_Order,
      		 Emptying_Order   => Emptying_Order,
                 End_Cycle        => End_Cycle);     

   end When_End_Emptying_is_N;

   procedure When_Valves_Opened_is_N(Args : in out Arg_Type) is
      Valves_Opened_s : constant String := Args.Match (1);
   begin

       Valves_Opened := Boolean'value(Valves_Opened_s);
   
   end When_Valves_Opened_is_N;

   procedure When_Valves_Closed_is_N (Args : in out Arg_Type) is
      Valves_Closed_s : constant String := Args.Match (1);
   begin

       Valves_Closed := Boolean'value(Valves_Closed_s);
   
   end When_Valves_Closed_is_N;

   procedure When_Pumps_Started_is_N (Args : in out Arg_Type) is
      Pumps_Started_s : constant String := Args.Match (1);
   begin

       Pumps_Started := Boolean'value(Pumps_Started_s);
   
   end When_Pumps_Started_is_N;

   procedure When_Level_P_is_N (Args : in out Arg_Type) is
      Level_P_s : constant String := Args.Match (1);
   begin

      Filling.Cyclic 
 		(Start_Filling  => Filling_P1_Order,
     		 Valves_Opened  => Valves_Opened,
     		 Valves_Closed  => Valves_Closed,
     		 Pumps_Started  => Pumps_Started,
     		 Level_P        => Boolean'Value(Level_P_s),
     		 Open_Valves    => Open_Valves,
     		 Start_Pumps    => Start_Pumps,
     		 Close_Valves   => Close_Valves);
       


   end When_Level_P_is_N;

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
      		(Open        => Open_Valves,
      		 Close       => Close_Valves,
     		 Opened      => Opened,
     		 Closed      => Boolean'value(Closed_s),
     		 Open_Order  => Open_Order,
     		 Close_Order => Close_Order);

   end When_Closed_is_N;


   procedure Then_New_state_cycle_N(Args : in out Arg_Type) is
     Expected_State : constant String := Args.Match (1);
     Actual_Result : constant Cycle_State := Cycle.Get_State;  
   begin

     Assert
       (Cmp    => Actual_Result = Cycle_State'Value (Expected_State),
        Reason =>
          "Wrong Cycle_State : Actual =>'" & Actual_Result'Img & "'  Expected =>'"
           & Expected_State & "'");

   end Then_New_state_cycle_N;

   procedure Then_New_state_filling_is_N(Args : in out Arg_Type) is
     Expected_State : constant String := Args.Match (1);
     Actual_Result : constant Filling_State := filling.Get_State;  
   begin

     Assert
       (Cmp    => Actual_Result = Filling_State'Value (Expected_State),
        Reason =>
          "Wrong Filling_State : Actual =>'" & Actual_Result'Img & "' Expected =>'"
           & Expected_State & "'");

   end Then_New_state_filling_is_N;

   procedure Then_New_state_valve_is_N(Args : in out Arg_Type) is
     Expected_State       : constant String      := Args.Match (1);
     Actual_Result        : constant Valve_State := Valve.Get_State;  
   begin

     Assert
       (Cmp    => Actual_Result = Valve_State'Value (Expected_State),
        Reason =>
          "Wrong Valve_State : Actual =>'" & Actual_Result'Img & "' Expected =>'"
           & Expected_State & "'");

   end Then_New_state_valve_is_N;


   procedure Then_Filling_P1_Order_is_N (Args : in out Arg_Type) is
     Expected_Filling_P1_Order : constant String := Args.Match (1);
   begin
     Assert
       (Cmp    => Filling_P1_Order = Boolean'Value (Expected_Filling_P1_Order),
        Reason =>
          "Wrong Filling_P1_Order : Actual =>'" & Filling_P1_Order'Img & "' Expected =>'"
          & Expected_Filling_P1_Order & "'");

   end Then_Filling_P1_Order_is_N;



   procedure Then_Filling_P2_Order_is_N (Args : in out Arg_Type) is
     Expected_Filling_P2_Order : constant String := Args.Match (1);
   begin

     Assert
       (Cmp    => Filling_P2_Order = Boolean'Value (Expected_Filling_P2_Order),
        Reason =>
          "Wrong Filling_P2_Order : Actual =>'" & Filling_P2_Order'Img & "' Expected =>'"
          & Expected_Filling_P2_Order & "'");

   end Then_Filling_P2_Order_is_N;


   procedure Then_Mixing_Order_is_N (Args : in out Arg_Type) is
     Expected_Mixing_Order : constant String := Args.Match (1);
   begin

     Assert
       (Cmp    => Mixing_Order = Boolean'Value (Expected_Mixing_Order),
        Reason =>
          "Wrong Mixing_Order : Actual =>'" & Mixing_Order'Img & "' Expected =>'"
          & Expected_Mixing_Order & "'");

   end Then_Mixing_Order_is_N;


   procedure Then_Emptying_Order_is_N (Args : in out Arg_Type) is
     Expected_Emptying_Order : constant String := Args.Match (1);
   begin

     Assert
       (Cmp    => Emptying_Order = Boolean'Value (Expected_Emptying_Order),
        Reason =>
          "Wrong Emptying_Order : Actual =>'" & Emptying_Order'Img & "' Expected =>'"
          & Expected_Emptying_Order & "'");

   end Then_Emptying_Order_is_N;


   procedure Then_End_Cycle_is_N (Args : in out Arg_Type) is
     Expected_End_Cycle : constant String := Args.Match (1);
   begin

     Assert
       (Cmp    => End_Cycle = Boolean'Value (Expected_End_Cycle),
        Reason =>
          "Wrong End_Cycle : Actual =>'" & End_Cycle'Img & "' Expected =>'"
          & Expected_End_Cycle & "'");

   end Then_End_Cycle_is_N;

   procedure Then_Start_Filling_is_N (Args : in out Arg_Type) is
     Expected_Start_Filling : constant String := Args.Match (1);
   begin

     Assert
       (Cmp    => Filling_P1_Order = Boolean'Value (Expected_Start_Filling),
        Reason =>
          "Wrong Start_Filling : Actual =>'" & Filling_P1_Order'Img & "' Expected =>'"
          & Expected_Start_Filling & "'");

   end Then_Start_Filling_is_N;

     procedure Then_Open_Valves_is_N (Args : in out Arg_Type) is
     Expected_Open_Valves : constant String := Args.Match (1);
   begin

     Assert
       (Cmp    => Open_Valves  = Boolean'Value (Expected_Open_Valves),
        Reason =>
          "Wrong Open_Valves  : Actual =>'" & Open_Valves 'Img & "' Expected =>'"
          & Expected_Open_Valves & "'");

   end Then_Open_Valves_is_N;

   procedure Then_Start_Pumps_is_N (Args : in out Arg_Type) is
     Expected_Start_Pumps  : constant String        := Args.Match (1);
   begin

     Assert
       (Cmp    => Start_Pumps = Boolean'Value ( Expected_Start_Pumps ),
        Reason =>
          "Wrong Start_Pumps : Actual =>'" & Start_Pumps'Img & "' Expected =>'"
          &  Expected_Start_Pumps  & "'");

   end Then_Start_Pumps_is_N;

   procedure Then_Close_Valves_is_N (Args : in out Arg_Type) is
     Expected_Close_Valves  : constant String := Args.Match (1);
   begin

     Assert
       (Cmp    => Close_Valves = Boolean'Value ( Expected_Close_Valves ),
        Reason =>
          "Wrong Close_Valves : Actual =>'" & Close_Valves'Img & "' Expected =>'"
          &  Expected_Close_Valves  & "'");


   end Then_Close_Valves_is_N;
  

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
