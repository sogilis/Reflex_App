with XReqLib.Asserts; use XReqLib.Asserts;
with devices.resistances; use devices.resistances;

package body step_definitions is 

    Resistance : Resistance_Record;
    Run        : Boolean;
    T_Regul    : Float;
    Set_Point  : Float;

   procedure Set_Up (Feature_File : in String) is

   begin

      null;

   end Set_Up;

   procedure Tear_Down (Feature_File : in String) is

   begin

      null;

   end Tear_Down;

   procedure Given_Resistance_component_is_initialized (Args : in out Arg_Type) is
      pragma Unreferenced (Args);
   begin

      Resistance.Initialize;

   end Given_Resistance_component_is_initialized;

   procedure Given_State_is_N (Args : in out Arg_Type) is
     Resistance_Status   : constant String := Args.Match (1);
   begin

      Resistance.Set_State(Resistance_State'Value(Resistance_Status));

   end Given_State_is_N;


   procedure When_Run_is_N (Args : in out Arg_Type) is 
     Run_s : constant String := Args.Match (1);
   begin

       Run := Boolean'value(Run_s);

   end When_Run_is_N;

   procedure When_T_Regul_is_N (Args : in out Arg_Type) is 
     T_Regul_s : constant String := Args.Match (1);
   begin

       T_Regul := Float'value(T_Regul_s);

   end When_T_Regul_is_N;


   procedure When_Set_Point_is_N (Args : in out Arg_Type) is 
     Set_Point_s : constant String := Args.Match (1);
   begin

      Resistance.Cyclic 
      		(Run       => Run,
      		 T_Regul   => T_Regul,
     		 Set_Point => Float'value(Set_Point_s));   

   end When_Set_Point_is_N;

   procedure Then_New_state_N(Args : in out Arg_Type) is
     Expected_State       : constant String      := Args.Match (1);
     Actual_Result        : constant Resistance_State := Resistance.Get_State;  
   begin

     Assert
       (Cmp    => Actual_Result = Resistance_State'Value (Expected_State),
        Reason =>
          "Wrong Resistance_State : Actual =>'" & Actual_Result'Img & "' Expected =>'"
           & Expected_State & "'");

   end Then_New_state_N;


end step_definitions;
