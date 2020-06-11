with XReqLib.Asserts; use XReqLib.Asserts;
with Tank.Cycle; use Tank.Cycle;

package body step_definitions is 

      Cycle            : Cycle_Record;
      End_Filling_P1   : Boolean;
      End_Filling_P2   : Boolean;
      End_Mixing       : Boolean;
      Filling_P1_Order : Boolean;
      Filling_P2_Order : Boolean;
      Mixing_Order     : Boolean;
      Emptying_Order   : Boolean;
      End_Cycle        : Boolean;
   procedure Set_Up (Feature_File : in String) is

   begin

      null;

   end Set_Up;

   procedure Tear_Down (Feature_File : in String) is

   begin

      null;

   end Tear_Down;

   procedure Given_Cycle_is_initialized (Args : in out Arg_Type) is
      pragma Unreferenced (Args);
   begin

      Cycle.Initialize;

   end Given_Cycle_is_initialized;

   procedure Given_State_N (Args : in out Arg_Type) is
     Cycle_Status   : constant String := Args.Match (1);
   begin

      Cycle.Set_State(Cycle_State'value(Cycle_Status));

   end Given_State_N;


   --  @when ^End_Filling_P1 is (TRUE|FALSE) $
   procedure When_End_Filling_P1_is_N (Args : in out Arg_Type) is
   End_Filling_P1_s : constant String := Args.Match (1);
   begin

       End_Filling_P1 := Boolean'value(End_Filling_P1_s);

   end When_End_Filling_P1_is_N;


   --  @when ^End_Filling_P2 is (TRUE|FALSE) $
   procedure When_End_Filling_P2_is_N (Args : in out Arg_Type) is
   End_Filling_P2_s : constant String := Args.Match (1);
   begin

       End_Filling_P2 := Boolean'value(End_Filling_P2_s);

   end When_End_Filling_P2_is_N;

   --  @when ^End_Mixing is (TRUE|FALSE) $
   procedure When_End_Mixing_is_N (Args : in out Arg_Type) is
   End_Mixing_s : constant String := Args.Match (1);
   begin

       End_Mixing := Boolean'value(End_Mixing_s);

   end When_End_Mixing_is_N;

   --  @when ^End_Emptying is (TRUE|FALSE)$
   procedure When_End_Emptying_is_N (Args : in out Arg_Type) is
      End_Emptying   : constant String := Args.Match (1);
   begin

      Cycle.Cyclic 
                (End_Filling_P1   => End_Filling_P1;
     		 End_Filling_P2   => End_Filling_P2;
     		 End_Mixing       => End_Mixing;
     		 End_Emptying     => Boolean'value(End_Emptying),
     		 Filling_P1_Order => Filling_P1_Order,
      	 	 Filling_P2_Order => Filling_P2_Order,
      	 	 Mixing_Order     => Mixing_Order,
      		 Emptying_Order   => Emptying_Order,
                 End_Cycle        => End_Cycle);     

   end When_End_Emptying_is_N;

   procedure Then_New_state_N(Args : in out Arg_Type) is
     Expected_State : constant String := Args.Match (1);
     Actual_Result : constant Cycle_State := Cycle.Get_State;  
   begin

     Assert
       (Cmp    => Actual_Result = Cycle_State'Value (Expected_State),
        Reason =>
          "Wrong Cycle_State : Actual =>'" & Actual_Result'Img & "' Expected =>'"
           & Expected_State & "'");

   end Then_New_state_N;

   procedure Then_Commands_N(Args : in out Arg_Type) is
     Expected_Filling_P1_Order : constant String := Args.Match (1);
     Expected_Filling_P2_Order : constant String := Args.Match (2);
     Expected_Mixing_Order     : constant String := Args.Match (3);
     Expected_Emptying_Order   : constant String := Args.Match (4);
     Expected_End_Cycle        : constant String := Args.Match (5);
   begin
     Assert
       (Cmp    => Filling_P1_Order = Boolean'Value (Expected_Filling_P1_Order),
        Reason =>
          "Wrong Filling_P1_Order : Actual =>'" & Filling_P1_Order'Img & "' Expected =>'"
          & Expected_Filling_P1_Order & "'");

     Assert
       (Cmp    => Filling_P2_Order = Boolean'Value (Expected_Filling_P2_Order),
        Reason =>
          "Wrong Filling_P2_Order : Actual =>'" & Filling_P2_Order'Img & "' Expected =>'"
          & Expected_Filling_P2_Order & "'");

     Assert
       (Cmp    => Mixing_Order = Boolean'Value (Expected_Mixing_Order),
        Reason =>
          "Wrong Mixing_Order : Actual =>'" & Mixing_Order'Img & "' Expected =>'"
          & Expected_Mixing_Order & "'");

     Assert
       (Cmp    => Emptying_Order = Boolean'Value (Expected_Emptying_Order),
        Reason =>
          "Wrong Emptying_Order : Actual =>'" & Emptying_Order'Img & "' Expected =>'"
          & Expected_Emptying_Order & "'");

     Assert
       (Cmp    => End_Cycle = Boolean'Value (Expected_End_Cycle),
        Reason =>
          "Wrong End_Cycle : Actual =>'" & End_Cycle'Img & "' Expected =>'"
          & Expected_End_Cycle & "'");


   end Then_Commands_N;

end step_definitions;
