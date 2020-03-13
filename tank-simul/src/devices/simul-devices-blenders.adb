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

package body Simul.Devices.Blenders is
   
   ----------------
   -- Initialize --
   ----------------
   
   procedure Initialize (This : in out Blender_Record) is
   begin
      This := No_Blender_Record;
   end Initialize;
   
   ------------
   -- Cyclic --
   ------------
   
   procedure Cyclic
    (This      : in out Blender_Record;
      V1_Order  : Boolean;
      V2_Order  : Boolean;
      Run_Order : Boolean;
      Speed_1   : out Boolean;
      Speed_2   : out Boolean) is
      
      New_State : Blender_State := This.State;
   begin

       case This.State is
	 when Init_State =>
	       New_State := Stop_State;

	 when Stop_State =>
	    if Run_Order then
	       New_State := Running_V1_State;
	    end if;
	    
	 when Running_V1_State =>
	    if V2_Order then
	       New_State := Running_V2_State;
	    elsif not Run_Order then
	       New_State := Stop_State;
	    end if;
	    
	 when Running_V2_State =>
	    if V1_Order  then
	       New_State := Running_V1_State;
	    end if;
    
      end case;
      
      This.State := New_State;

   ------------
   --Commande--
   ------------

      Speed_1 := (This.State = Running_V1_State); 
      Speed_2 := (This.State = Running_V2_State);

   end Cyclic;
   
end Simul.Devices.Blenders;
