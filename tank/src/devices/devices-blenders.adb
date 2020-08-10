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

package body Devices.Blenders is
   
   ----------------
   -- Initialize --
   ----------------
   
   procedure Initialize (This : in out Blender_Record) is
   begin
      This := No_Blender_Record;
   end Initialize;

   function get_state (This : Blender_Record) return Blender_State is
     begin
	return This.State;
     end get_state;

   procedure set_state (This : in out Blender_Record; S: Blender_State) is
     begin
	 This.State := S;
     end Set_State;
   
   ------------
   -- Cyclic --
   ------------
   
   procedure Cyclic
     (This      : in out Blender_Record;
      Run       : Boolean;
      Speed_2   : Boolean;
      Run_Order : out Boolean;
      v2_Order  : out Boolean) is

      
      New_State : Blender_State := This.State;
   begin
      Put_Line ("app_Blenders.Cyclic");
       case This.State is
	 when Init_State =>
               New_State := Stop_State;
         
	 when Stop_State =>
	    if Run  then
	       New_State := Running_v1_State;
	    end if;
	    
	 when Running_v1_State =>
            if Speed_2 then
	       New_State := Running_V2_State;
            elsif not Run then 
               New_State := stop_state;
	    end if;	    
	    
	 when Running_V2_State =>
	    if not Speed_2 then
	       New_State := Running_V1_State;
            elsif not Run then
               New_State := stop_state;
	    end if;	



      end case;
      
      This.State := New_State;

   ------------
   --Commande--
   ------------

      Run_Order :=(This.State = Running_V1_State) or (This.State = Running_V2_State); 
      V2_Order  := (This.State = Running_V2_State);
      --  Fault     := (This.State = Faulty_State);
   end Cyclic;
   
end Devices.Blenders;
