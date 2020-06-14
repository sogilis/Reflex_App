with XReqLib.Asserts; use XReqLib.Asserts;
with tank; use tank;
with tank.filling; use tank.filling;


package body step_definitions is 

      Filling       : Filling_Record;
      Start_Filling : Boolean;
      Valves_Opened : Boolean;
      Valves_Closed : Boolean;
      Pumps_Started : Boolean;
      Open_Valves   : Boolean;
      Start_Pumps   : Boolean;
      Close_Valves  : Boolean;

   procedure Set_Up (Feature_File : in String) is

   begin

      null;

   end Set_Up;

   procedure Tear_Down (Feature_File : in String) is

   begin

      null;

   end Tear_Down;

   procedure Given_filling_app_is_initialized (Args : in out Arg_Type) is
      pragma Unreferenced (Args);
   begin

      Filling.Initialize;

   end Given_filling_app_is_initialized;

   procedure Given_State_N (Args : in out Arg_Type) is
      filling_Status   : constant String := Args.Match (1);
   begin

      filling.Set_State(filling_State'Value(filling_Status));

   end Given_State_N;

   procedure When_Start_Filling_is_N (Args : in out Arg_Type) is
      Start_Filling_s : constant String := Args.Match (1);
   begin

       Start_Filling := Boolean'value(Start_Filling_s);
   
   end When_Start_Filling_is_N;

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
 		(Start_Filling  => Start_Filling,
     		 Valves_Opened  => Valves_Opened,
     		 Valves_Closed  => Valves_Closed,
     		 Pumps_Started  => Pumps_Started,
     		 Level_P        => Boolean'Value(Level_P_s),
     		 Open_Valves    => Open_Valves,
     		 Start_Pumps    => Start_Pumps,
     		 Close_Valves   => Close_Valves);
       


   end When_Level_P_is_N;

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


   procedure Then_New_state_is_N(Args : in out Arg_Type) is
     Expected_State        : constant String        := Args.Match (1);
     Actual_Result         : constant Filling_State := Filling.Get_State;  

   begin

     Assert
       (Cmp    => Actual_Result = Filling_State'Value (Expected_State),
        Reason =>
          "Wrong Filling_State : Actual =>'" & Actual_Result'Img & "' Expected =>'"
           & Expected_State & "'");

   end Then_New_state_is_N;


end step_definitions;
