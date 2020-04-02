with RxUnit.Assertions; use RxUnit.Assertions;

with Ada.Text_Io; use Ada.Text_Io;

package body Devices.Valves.Tests is
   
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
      Valve        : Valve_Record;
      Open         : Boolean;
      Close        : Boolean;
      Opened       : Boolean;
      Closed       : Boolean;
      Open_Order   : Boolean;
      Close_Order  : Boolean;
   begin
      Initialize (Valve);
      
      --  Initial State
      
      Open   := False;
      Close  := False;
      Opened := False;
      Closed := False;
      
      Valve.Cyclic
	( Open         => Open,
	 Close        => Close,
	 Opened       => Opened,
	 Closed       => Closed,
	 Open_Order   => Open_Order,
	 Close_Order  => Close_Order);
      
      Assert (Valve.State = Waiting_State, "Cyclic: State = Waiting_State");
      Assert
	(Open_Order = False,
	 "Cyclic: State = Waiting_State: Open_Order must be false");
      Assert
	(Close_Order = False,
	 "Cyclic: State = Waiting_State: Close_Order must be false");
	      
      --  Openning 
      
      Open   := True;
      Close  := False;
      Opened := False;
      Closed := False;
      
      Valve.Cyclic
	(Open         => Open,
	 Close        => Close,
	 Opened       => Opened,
	 Closed       => Closed,
	 Open_Order   => Open_Order,
	 Close_Order  => Close_Order);
      
      Assert (Valve.State = Opening_State, "Cyclic: State = Opening_State");
      Assert
	(Open_Order = True,
	 "Cyclic: State = Opening_State: Open_Order must be true");
      Assert
	(Close_Order = False,
	 "Cyclic: State = Opening_State: Close_Order must be false");
	   
      --  Opened_State
      
      Open   := True;
      Close  := False;
      Opened := True;
      Closed := False;
      
      Valve.Cyclic
	(Open         => Open,
	 Close        => Close,
	 Opened       => Opened,
	 Closed       => Closed,
	 Open_Order   => Open_Order,
	 Close_Order  => Close_Order);
      
      Assert (Valve.State = Opened_State, "Cyclic: State = Opening_State 1");
      Assert
	(Open_Order = False,
	 "Cyclic: State = Opened_State 1: Open_Order must be false");
      Assert
	(Close_Order = False,
	 "Cyclic: State = Opened_State 1: Close_Order must be false");
	   
      --  Opened_State (No more order)
      
      Open   := False;
      Close  := False;
      Opened := True;
      Closed := False;
      
      Valve.Cyclic
	( Open         => Open,
	 Close        => Close,
	 Opened       => Opened,
	 Closed       => Closed,
	 Open_Order   => Open_Order,
	 Close_Order  => Close_Order);
      
      Assert (Valve.State = Opened_State, "Cyclic: State = Opening_State 2");
      Assert
	(Open_Order = False,
	 "Cyclic: State = Opened_State 2: Open_Order must be false");
      Assert
	(Close_Order = False,
	 "Cyclic: State = Opened_State 2: Close_Order must be false");
	   
      --  Closing_State
      
      Open   := False;
      Close  := True;
      Opened := True;
      Closed := False;
      
      Valve.Cyclic
	(Open         => Open,
	 Close        => Close,
	 Opened       => Opened,
	 Closed       => Closed,
	 Open_Order   => Open_Order,
	 Close_Order  => Close_Order);
      
      Assert (Valve.State = Closing_State, "Cyclic: State = Closing_State 1");
      Assert
	(Open_Order = False,
	 "Cyclic: State = Closing_State 1: Open_Order must be false");
      Assert
	(Close_Order = True,
	 "Cyclic: State = Closing_State 1: Close_Order must be true");
	   
      --  Closing_State
      
      Open   := False;
      Close  := True;
      Opened := False;
      Closed := False;
      
      Valve.Cyclic
	(Open         => Open,
	 Close        => Close,
	 Opened       => Opened,
	 Closed       => Closed,
	 Open_Order   => Open_Order,
	 Close_Order  => Close_Order);
      
      Assert (Valve.State = Closing_State, "Cyclic: State = Closing_State 2");
      Assert
	(Open_Order = False,
	 "Cyclic: State = Closing_State 2: Open_Order must be false");
      Assert
	(Close_Order = True,
	 "Cyclic: State = Closing_State 2: Close_Order must be true");
	   
      --  Closed_State
      
      Open   := False;
      Close  := True;
      Opened := False;
      Closed := True;
      
      Valve.Cyclic
	(Open         => Open,
	 Close        => Close,
	 Opened       => Opened,
	 Closed       => Closed,
	 Open_Order   => Open_Order,
	 Close_Order  => Close_Order);
      
      Assert (Valve.State = waiting_State, "Cyclic: State = Closed_State 3");
      Assert
	(Open_Order = False,
	 "Cyclic: State = Closed_State 3: Open_Order must be false");
      Assert
	(Close_Order = False,
	 "Cyclic: State = Closed_State 3: Close_Order must be false");
	   
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
      return Format ("Devices.Valves.Tests");
   end Name;


end Devices.Valves.Tests;

