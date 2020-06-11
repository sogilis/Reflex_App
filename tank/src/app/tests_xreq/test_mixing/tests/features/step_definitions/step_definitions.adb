with XReqLib.Asserts; use XReqLib.Asserts;
with tank.mixing; use tank.mixing;

package body step_definitions is 

    Mixing           : Mixing_Record;
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

   procedure Given_Mixing_component_is_initialized (Args : in out Arg_Type) is
      pragma Unreferenced (Args);
   begin

      Mixing.Initialize;

   end Given_Mixing_component_is_initialized;

   procedure Given_State_N (Args : in out Arg_Type) is
      Mixing_Status   : constant String := Args.Match (1);
   begin

    Mixing.Set_State(Mixing_State'Value(Mixing_Status));

   end Given_State_N;

   procedure When_Transition_N (Args : in out Arg_Type) is
      Start_Mixing    : constant String := Args.Match (1);
      Blender_Started : constant String := Args.Match (2);
      Mixing_Duration : constant String := Args.Match (3);
      Second          : constant String := Args.Match (4);
   begin

      Mixing.Cyclic
   	  ( Start_Mixing     => Boolean'value(Start_Mixing),
     	    Blender_Started  => Boolean'value(Blender_Started),
     	    Mixing_Duration  => Integer'value(Mixing_Duration),
     	    Second           => true,
      	    Start_Blender    => Start_Blender,
     	    Start_Resistance => Start_Resistance,
     	    End_Mixing       => End_Mixing );

   end When_Transition_N;

   procedure Then_New_state_N (Args : in out Arg_Type) is
     Expected_State            : constant String       := Args.Match (1);
     Expected_Start_Blender    : constant String       := Args.Match (2);
     Expected_Start_Resistance : constant String       := Args.Match (3);
     Expected_End_Mixing       : constant String       := Args.Match (4);
     Actual_Result             : constant Mixing_State := Mixing.Get_State;  

   begin

     Assert
       (Cmp    => Actual_Result = Mixing_State'Value (Expected_State),
        Reason =>
          "Wrong Mixing_State : Actual =>'" & Actual_Result'Img & "' Expected =>'"
           & Expected_State & "'");

     Assert
       (Cmp    => Start_Blender = Boolean'Value (Expected_Start_Blender),
        Reason =>
          "Wrong Start_Blender : Actual =>'" & Start_Blender'Img & "' Expected =>'"
          & Expected_Start_Blender & "'");

     Assert
       (Cmp    => Start_Resistance = Boolean'Value (Expected_Start_Resistance),
        Reason =>
          "Wrong Run_Order : Actual =>'" & Start_Resistance'Img & "' Expected =>'"
          & Expected_Start_Resistance & "'");


     Assert
       (Cmp    => End_Mixing = Boolean'Value (Expected_End_Mixing),
        Reason =>
          "Wrong End_Mixing : Actual =>'" & End_Mixing'Img & "' Expected =>'"
          & Expected_End_Mixing & "'");


   end Then_New_state_N;



   procedure When_Second_is_TRUE (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end When_Second_is_TRUE;

   procedure When_Blender_Started_is_FALSE (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end When_Blender_Started_is_FALSE;

   procedure When_Mixing_Duration_is_1 (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end When_Mixing_Duration_is_1;

   procedure When_Start_Mixing_is_TRUE (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end When_Start_Mixing_is_TRUE;

   procedure When_Second_is_FALSE (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end When_Second_is_FALSE;

   procedure When_Blender_Started_is_TRUE (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end When_Blender_Started_is_TRUE;

   procedure When_Mixing_Duration_is_2 (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end When_Mixing_Duration_is_2;

   procedure Given_mixing_component_is_initialized (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_mixing_component_is_initialized;

   procedure Given_mixing_component_is_initialized (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_mixing_component_is_initialized;

   procedure Given_mixing_component_is_initialized (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_mixing_component_is_initialized;

   procedure Given_mixing_component_is_initialized (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_mixing_component_is_initialized;

   procedure Then_New_state_is_Running_V1_State_And_Run_Order_is_TRUE_And_v1_Order_is_TRUE_And_v2_Order_is_FALSE (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Then_New_state_is_Running_V1_State_And_Run_Order_is_TRUE_And_v1_Order_is_TRUE_And_v2_Order_is_FALSE;

   procedure Given_State_is_Running_V1_State (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_State_is_Running_V1_State;

   procedure Then_New_state_is_Starting_State_And_Run_Order_is_TRUE_And_v1_Order_is_FALSE_And_v2_Order_is_FALSE (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Then_New_state_is_Starting_State_And_Run_Order_is_TRUE_And_v1_Order_is_FALSE_And_v2_Order_is_FALSE;

   procedure When_Transition_is_TRUE_And_Transition_is_TRUE_And_Transition_is_TRUE (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end When_Transition_is_TRUE_And_Transition_is_TRUE_And_Transition_is_TRUE;

   procedure When_Transition_is_FALSE_And_Transition_is_FALSE_And_Transition_is_FALSE (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end When_Transition_is_FALSE_And_Transition_is_FALSE_And_Transition_is_FALSE;

   procedure Given_State_is_Init_State (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_State_is_Init_State;

   procedure Then_New_state_is_Stop_State_And_Run_Order_is_FALSE_And_v1_Order_is_FALSE_And_v2_Order_is_FALSE (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Then_New_state_is_Stop_State_And_Run_Order_is_FALSE_And_v1_Order_is_FALSE_And_v2_Order_is_FALSE;

   procedure Given_State_is_Stopping_State (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_State_is_Stopping_State;

   procedure When_Transition_is_TRUE_And_Transition_is_FALSE_And_Transition_is_FALSE (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end When_Transition_is_TRUE_And_Transition_is_FALSE_And_Transition_is_FALSE;

   procedure When_Transition_is_TRUE_And_Transition_is_FALSE_And_Transition_is_TRUE (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end When_Transition_is_TRUE_And_Transition_is_FALSE_And_Transition_is_TRUE;

   procedure Then_New_state_is_Running_V2_State_And_Run_Order_is_TRUE_And_v1_Order_is_FALSE_And_v2_Order_is_TRUE (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Then_New_state_is_Running_V2_State_And_Run_Order_is_TRUE_And_v1_Order_is_FALSE_And_v2_Order_is_TRUE;

   procedure When_Transition_is_FALSE_And_Transition_is_TRUE_And_Transition_is_FALSE (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end When_Transition_is_FALSE_And_Transition_is_TRUE_And_Transition_is_FALSE;

   procedure Given_State_is_Running_V2_State (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_State_is_Running_V2_State;

   procedure Given_blender_component_is_initialized (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_blender_component_is_initialized;

   procedure Then_New_state_is_Stopping_State_And_Run_Order_is_FALSE_And_v1_Order_is_FALSE_And_v2_Order_is_FALSE (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Then_New_state_is_Stopping_State_And_Run_Order_is_FALSE_And_v1_Order_is_FALSE_And_v2_Order_is_FALSE;

   procedure When_Transition_is_TRUE_And_Transition_is_TRUE_And_Transition_is_FALSE (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end When_Transition_is_TRUE_And_Transition_is_TRUE_And_Transition_is_FALSE;

   procedure Given_State_is_Stop_State (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_State_is_Stop_State;

   procedure Given_State_is_Starting_State (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_State_is_Starting_State;

   procedure Given_State_is_Init_State (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_State_is_Init_State;

   procedure When_Transition_is_FALSE_And_Transition_is_FALSE_And_Transition_is_FALSE (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end When_Transition_is_FALSE_And_Transition_is_FALSE_And_Transition_is_FALSE;

   procedure Then_New_state_is_Starting_State_And_Run_Order_is_FALSE_And_v1_Order_is_FALSE_And_v2_Order_is_FALSE (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Then_New_state_is_Starting_State_And_Run_Order_is_FALSE_And_v1_Order_is_FALSE_And_v2_Order_is_FALSE;

   procedure Given_blender_component_is_initialized (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_blender_component_is_initialized;

   procedure Given_blender_component_is_initialized (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_blender_component_is_initialized;

   procedure Given_blender_component_is_initialized (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_blender_component_is_initialized;

   procedure Then_I_should_have_10_oranges (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Then_I_should_have_10_oranges;

   procedure Given_I_want_to_eat_Nb_Oranges_2_oranges (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_I_want_to_eat_Nb_Oranges_2_oranges;

   procedure Given_there_are_12_oranges (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_there_are_12_oranges;

   procedure When_I_eat_oranges (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end When_I_eat_oranges;

   procedure Given_I_want_to_eat_Nb_Oranges_2_oranges (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_I_want_to_eat_Nb_Oranges_2_oranges;

   procedure Given_State_is_State (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_State_is_State;

   procedure Then_New_state_is_New_State (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Then_New_state_is_New_State;

   procedure When_Transition_is_Run_And_Transition_is_Speed_1_And_Transition_is_Speed_2 (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end When_Transition_is_Run_And_Transition_is_Speed_1_And_Transition_is_Speed_2;

   procedure Given_blender_component_is_initialized (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_blender_component_is_initialized;

   procedure Given_blender_component_is_initialized (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_blender_component_is_initialized;

   procedure Given_State_is_State (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_State_is_State;

   procedure Then_New_state_is_New_State (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Then_New_state_is_New_State;

   procedure When_Transition_is_Run_And_Transition_is_Speed_1_And_Transition_is_Speed_2 (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end When_Transition_is_Run_And_Transition_is_Speed_1_And_Transition_is_Speed_2;

   procedure Given_State_is_Init_State (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Given_State_is_Init_State;

   procedure When_Start_Mixing_is_TRUE_And_Blender_Started_is_FALSE_And_Mixing_Duration_is_2 (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end When_Start_Mixing_is_TRUE_And_Blender_Started_is_FALSE_And_Mixing_Duration_is_2;

   procedure Then_New_state_is_Mix_State_And_Start_Blender_is_FALSE_And_Start_Resistance_is_FALSE_And_End_Mixing_is_FALSE (Args : in out Arg_Type) is
      Not_Yet_Implemented : exception;
   begin
      raise Not_Yet_Implemented;
   end Then_New_state_is_Mix_State_And_Start_Blender_is_FALSE_And_Start_Resistance_is_FALSE_And_End_Mixing_is_FALSE;

end step_definitions;
