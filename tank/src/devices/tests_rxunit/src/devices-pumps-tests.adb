with RxUnit.Assertions; use RxUnit.Assertions;

with Ada.Text_Io; use Ada.Text_Io;

package body Devices.Pumps.Tests is
   
   ---------------------
   -- Test_Initialize --
   ---------------------

   procedure Test_Initialize
     (R : in out RxUnit.Test_Cases.Test_Case'Class)
   is
   begin
      Assert (True, "Initialize : testing OK ");
   end Test_Initialize;
   
   -----------------
   -- Test_Cyclic --
   -----------------

   procedure Test_Cyclic
     (R : in out RxUnit.Test_Cases.Test_Case'Class)
   is
     Pump      : Pump_Record;
      Run       : Boolean;
      Running   : Boolean;
      Run_Order : Boolean;
   begin
      Initialize (Pump);

      --  Stop State
      
      Run       := False;
      Running   := False;

     Pump.Cyclic    
      (Run       => Run,
       Running   => Running,
       Run_Order => Run_Order);
      
      Assert (Pump.State = Stop_State, "Cyclic: State = Stop_State");
      Assert
	(Run_Order = False,
	 "Cyclic: State = Stop_State: Run_Order must be false");
      
     -- Run_State

      Run       := True;
      Running   := False;

     Pump.Cyclic    
      (Run       => Run,
       Running   => Running,
       Run_Order => Run_Order);
      
      Assert (Pump.State = Run_State, "Cyclic: State = Run_State");
      Assert
	(Run_Order = True,
	 "Cyclic: State = Run_State: Run_Order must be true");

     -- Running_State

      Run       := True;
      Running   := True;

     Pump.Cyclic    
      (Run       => Run,
       Running   => Running,
       Run_Order => Run_Order);
      
      Assert (Pump.State = Running_State, "Cyclic: State = Running_State");
      Assert
	(Run_Order = True,
	 "Cyclic: State = Running_State: Run_Order must be true");

     -- stopping_State 

      Run       := false;
      Running   := True;

     Pump.Cyclic    
      (Run       => Run,
       Running   => Running,
       Run_Order => Run_Order);
      
      Assert (Pump.State = stopping_State, "Cyclic: State = stopping_State");
      Assert
	(Run_Order = false,
	 "Cyclic: State = stopping_State: Run_Order must be false");
	      
	   
      Assert (True, "Cyclic : testing OK ");
   end Test_Cyclic;
   
   --------------------
   -- Register_Tests --
   --------------------
   
   procedure Register_Tests (T : in out Test_Case) 
   is
      use Test_Cases, Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Initialize'Access, "Initialize");
      Register_Routine (T, Test_Cyclic'Access, "cyclic");
      
   end Register_Tests;

   ----------
   -- Name --
   ----------
   
   function Name (T : Test_Case) return Message_String is
   begin
      return Format ("Devices.Pumps.Tests");
   end Name;


end Devices.Pumps.Tests;

