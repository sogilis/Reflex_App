with XReqLib.Asserts; use XReqLib.Asserts;
with tank.mixing; use tank.mixing;

package body step_definitions is 

	Mixing           : Mixing_Record;
	Blender_Started  : Boolean;
	Run_order        : Boolean;
	Start_Blender    : Boolean;
	Start_Resistance : Boolean;
	End_Mixing       : Boolean;


   procedure Set_Up (Feature_File : in String) is

   begin

      null;

   end Set_Up;

   procedure Tear_Down (Feature_File : in String) is

   begin

      null;

   end Tear_Down;

   procedure Given_Mixing_app_is_initialized (Args : in out Arg_Type) is
      pragma Unreferenced (Args);
   begin

      Mixing.Initialize;

   end Given_Mixing_app_is_initialized;

   procedure Given_State_is_N (Args : in out Arg_Type) is
      Mixing_Status   : constant String := Args.Match (1);
   begin

      mixing.Set_State(mixing_State'Value(Mixing_Status));

   end Given_State_is_N;

   procedure When_Blender_Started_is_N (Args : in out Arg_Type) is
	Blender_Started_s : constant String := Args.Match (1);
   begin

	Blender_Started:= Boolean'value(Blender_Started_s);

   end When_Blender_Started_is_N;

  
   procedure When_Start_Mixing_is_N(Args : in out Arg_Type) is
      Start_Mixing : constant String := Args.Match (1);
   begin

      Mixing.Cyclic
   	  ( Start_Mixing     => Boolean'value(Start_Mixing),
     	    Blender_Started  => Blender_Started,
     	    Mixing_Duration  => 3,
      	    Start_Blender    => Start_Blender,
     	    Start_Resistance => Start_Resistance,
     	    End_Mixing       => End_Mixing );

   end When_Start_Mixing_is_N;

   procedure Then_End_Mixing_is_N (Args : in out Arg_Type) is 
     Expected_End_Mixing       : constant String       := Args.Match (1);
   begin

     Assert
       (Cmp    => End_Mixing = Boolean'Value (Expected_End_Mixing),
        Reason =>
          "Wrong End_Mixing : Actual =>'" & End_Mixing'Img & "' Expected =>'"
          & Expected_End_Mixing & "'");

   end Then_End_Mixing_is_N;

   procedure Then_New_state_is_N (Args : in out Arg_Type) is
     Expected_State            : constant String       := Args.Match (1);
     Actual_Result             : constant Mixing_State := Mixing.Get_State;  
   begin

     Assert
       (Cmp    => Actual_Result = Mixing_State'Value (Expected_State),
        Reason =>
          "Wrong Mixing_State : Actual =>'" & Actual_Result'Img & "' Expected =>'"
           & Expected_State & "'");

   end Then_New_state_is_N;

   procedure Then_Start_Resistance_is_N (Args : in out Arg_Type) is
     Expected_Start_Resistance : constant String       := Args.Match (1);
   begin

     Assert
       (Cmp    => Start_Resistance = Boolean'Value (Expected_Start_Resistance),
        Reason =>
          "Wrong Start_Resistance : Actual =>'" & Start_Resistance'Img & "' Expected =>'"
          & Expected_Start_Resistance & "'");

   end Then_Start_Resistance_is_N;

   procedure Then_Start_Blender_is_N (Args : in out Arg_Type) is
     Expected_Start_Blender    : constant String       := Args.Match (1);
   begin

     Assert
       (Cmp    => Start_Blender = Boolean'Value (Expected_Start_Blender),
        Reason =>
          "Wrong Start_Blender : Actual =>'" & Start_Blender'Img & "' Expected =>'"
          & Expected_Start_Blender & "'");

   end Then_Start_Blender_is_N;

   procedure Then_New_state_is_Init_State (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Then_New_state_is_Init_State;

end step_definitions;
