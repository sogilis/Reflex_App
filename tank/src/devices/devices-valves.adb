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

package body Devices.Valves is
   
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
     
     (This         : in out Valve_Record;
      Open         : Boolean;
      Close        : Boolean;
      Opened       : Boolean;
      Closed       : Boolean;
      Open_Order   : out Boolean;
      Close_Order  : out Boolean) is
      
      New_State : Valve_State := This.State;
   begin
      Put_Line ("App_Valves.Cyclic");
      case This.State is
	 when Init_State =>
	       New_State := Waiting_State;

	 when Waiting_State =>
	    if Open then
	       New_State := Opening_State;
	    end if;
	    
	 when Opening_State =>
	    if Opened then
	       New_State := Opened_State;
	    end if;
	    
	 when Opened_State =>
	    if Close then
	       New_State := Closing_State;
	    end if;
	    
	 when Closing_State =>
	    if Closed then
	       New_State := Waiting_State;
	    end if;
	    
      end case;
      
      This.State := New_State;

   ------------
   --Commande--
   ------------

      Close_Order := (This.State=Closing_State);
      Open_Order  := (This.State=Opening_State);
   end Cyclic;
   
end Devices.Valves;
