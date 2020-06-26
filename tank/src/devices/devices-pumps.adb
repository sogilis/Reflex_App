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

package body Devices.Pumps is
   
   ----------------
   -- Initialize --
   ----------------
   
   procedure Initialize (This : in out Pump_Record) is
   begin
      This := No_Pump_Record;
   end Initialize;

   function get_state (This : Pump_Record) return Pump_State is
     begin
	return This.State;
     end get_state;

   procedure set_state (This : in out Pump_Record; S: Pump_State) is
     begin
	 This.State := S;
     end Set_State;
   
   ------------
   -- Cyclic --
   ------------
   
   procedure Cyclic
     (This      : in out Pump_Record;
      Run       : Boolean;
      Running   : Boolean;
      Run_Order : out Boolean) is
      
      New_State : Pump_State := This.State;
   begin
      Put_Line ("app_Pump.Cyclic");
      case This.State is
	 when Init_State =>
	       New_State := stop_State;
	 when Stop_State =>
	    if Run then
            New_State := Run_State;
         end if; 
         
         when Run_State =>
	    if Running then
	       New_State := Running_State;
	    end if;
	    
	 when Running_State =>
	    if not Running then
	       New_State := Stopping_State;
	    end if;
	    
	 when Stopping_State =>
	    if not Run then
	       New_State := Stop_State;
	    end if;	
      end case;
      
      This.State := New_State;

     -- Commandes

	Run_Order := (This.State = Run_State);
   end Cyclic;
   
end Devices.Pumps;
