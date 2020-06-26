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

package body Tank.Filling is
   
   ----------------
   -- Initialize --
   ----------------
   
   procedure Initialize (This : in out Filling_Record) is
   begin
      This := No_Filling_Record;
   end Initialize;

   function get_state (This : Filling_Record) return Filling_State is
     begin
	return This.State;
     end get_state;

   procedure set_state (This : in out Filling_Record; S: Filling_State) is
     begin
	 This.State := S;
     end Set_State;
   
   ------------
   -- Cyclic --
   ------------
   
   procedure Cyclic
     (This          : in out Filling_Record;
      Start_Filling  : Boolean;
      Valves_Opened  : Boolean;
      Valves_Closed  : Boolean;
      Pumps_Started  : Boolean;  
      Level_P        : Boolean;
      Open_Valves    : out Boolean;
      Start_Pumps    : out Boolean;
      Close_Valves   : out Boolean) is
      
      New_State : Filling_State := This.State;
   begin
      Put_Line ("App_Filling.Cyclic");
       case This.State is
	 when Init_State =>
	    if Start_Filling then
	       New_State := Openning_Valves_State;
    	    end if;

	 when Openning_Valves_State =>
	    if Valves_Opened then
	       New_State := Running_Pumps_State;
	    end if;

	 when Running_Pumps_State =>
	    if Pumps_Started then
	       New_State := Filling_emptying_State;
	    end if;

	 when Filling_emptying_State =>
	    if Level_P then
	       New_State := Stopping_Pumps_State;
	    end if;

	 when Stopping_Pumps_State =>
	    if not Pumps_Started then
	       New_State := Closing_Valves_State;
	    end if;

	 when Closing_Valves_State =>
	    if Valves_Closed then
	       New_State := Init_state;
	    end if;

	 when Waiting_State =>
	    if not Start_Filling then
	       New_State := Init_state;
	    end if;
      end case;
      
      This.State := New_State;

      -- Commandes

      Open_Valves  := (This.State = Openning_Valves_State);
      Start_Pumps  := (This.State = Running_Pumps_State) ;
      Close_Valves := (This.State = Closing_Valves_State);
   end Cyclic;
   
end Tank.Filling;
