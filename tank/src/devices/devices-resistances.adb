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

package body Devices.Resistances is
   
   ----------------
   -- Initialize --
   ----------------
   
   procedure Initialize (This : in out Resistance_Record) is
   begin
      This := No_Resistance_Record;
   end Initialize;
   
   ------------
   -- Cyclic --
   ------------
   
   procedure Cyclic
       (This       : in out Resistance_Record;
        Run        : Boolean;
        T_Regul    : Float;
        Set_Point  : Float) is
      
      New_State : Resistance_State := This.State;
   begin
      Put_Line ("Resistances.Cyclic");
      case This.State is
         when Init_State =>
	       New_State := Waiting_State;

	 when Waiting_State =>
	    if Run then
	       New_State := Running_State;
	    end if;
	    
	 when Running_State =>
	    if T_Regul /= Set_Point then
	       New_State := Running_State;
            elsif not Run then
	       New_State := Init_State;
	    end if;
	    
      end case;
      
      This.State := New_State;
      
      --Commande
      

   end Cyclic;
   
end Devices.Resistances;
