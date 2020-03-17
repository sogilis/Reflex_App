------------------------------------------------------------------------------
--                                                                          --
--                         REFLEX EXAMPLES                                  --
--                                                                          --
--          Copyright (C) 1992-2011, Free Software Foundation, Inc.         --
--                                                                          --
-- Reflex is free software; you can redistribute it  and/or modify it under --
-- terms of the  GNU General Public Licensea as published  by the Free Soft- --
-- ware Foundation; either version 3, or (at your option) any later version --
-- Reflex is distributed in the hope that it will be useful, but WITH-      --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License --
-- for  more details.  You should have  received  a copy of the GNU General --
-- Public License distributed with Reflex; see file COPYING3. If not, go to --
-- http://www.gnu.org/licenses for a complete copy of the license.          --
--                                                                          --
-- Reflex is originally developed  by the Artics team at Grenoble.          --
--                                                                          --
------------------------------------------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;

package body Simul.Devices.Valves is
   
   ----------------
   -- Initialize --
   ----------------
   
   procedure Initialize (This : in out Valve_Record) is
   begin
      This := No_Valve_Record;
   end Initialize;
   
   ------------
   -- Cyclic --
   ------------
   
   procedure Cyclic 
	(This         : In Out Valve_Record;
         Second       : Boolean;
         Open_Order   : Boolean;
         Close_Order  : Boolean;
         Opened       : out Boolean;
         Closed       : out Boolean) is
      
      New_State : Valve_State := This.State;
   begin
      Put_Line ("Simul_Valves.Cyclic");
      case This.State is

	 when Waiting_State =>
	    if Close_Order then
	       New_State := Closing_State;
	    elsif Open_Order then
	       New_State := Opening_State;
	    end if;
	    
	 when Opening_State =>
	   if Second then
	     New_State := Opened_State;
	  end if;

	 when Closing_State =>
	  if Second then
	    New_State := Closed_State;
	  end if;
	    
	 when Opened_State =>
	    if Close_Order then
	       New_State := Waiting_State;
	    end if;
	    
	 when Closed_State =>
	    if Open_Order then
	       New_State := Waiting_State;
	    end if;

      end case;
      
      This.State := New_State;

   ------------
   --commande--
   ------------

      Opened := (This.State= Opened_State);
      Closed := (This.State= Closed_State);
   end Cyclic;
   
end Simul.Devices.Valves;
