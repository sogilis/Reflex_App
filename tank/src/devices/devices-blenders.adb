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
   
   ------------
   -- Cyclic --
   ------------
   
   procedure Cyclic
     (This      : in out Blender_Record;
      Run       : Boolean;
      CP        : Boolean;
      Therm     : Boolean;
      Speed_1   : Boolean;
      Speed_2   : Boolean;
      Acqk      : Boolean;
      Run_Order : out Boolean;
      v2_Order  : out Boolean;
      v1_Order  : out Boolean) is

      
      New_State : Blender_State := This.State;
   begin
      Put_Line ("Blenders.Cyclic");
       case This.State is
	 when Init_State =>
               New_State := Stop_State;
         
	 when Stop_State =>
	    if (Run and CP and not Therm) then
	       New_State := starting_State;
	    end if;
	    
	 when Starting_State =>
	    if Speed_1 then
	       New_State := Running_V1_State;
            elsif not CP or Therm then
	       New_State := Faulty_State;
	    end if;
	    
	 when Running_v1_State =>
	    if not Run  then
	       New_State := Stopping_State;
            elsif Speed_2 then
	       New_State := Running_V2_State;
            elsif not CP or Therm then
	       New_State := Faulty_State;
	    end if;
	    
	 when Stopping_State =>
	    if not speed_1 then
	       New_State := Stop_State;
	    end if;
	    
	 when Running_V2_State =>
	    if Speed_1 then
	       New_State := Running_V1_State;
            elsif not CP or Therm then
	       New_State := Faulty_State;
            end if;
         
	 when Faulty_State =>
	    if not Speed_1 then
	       New_State := Stop_State;
            elsif Acqk and CP and Therm then
               New_State := Starting_State;
            end if;

      end case;
      
      This.State := New_State;

   ------------
   --Commande--
   ------------

      Run_Order := (This.State = Starting_State); 
      V1_Order  := (This.State = Running_V1_State);
      V2_Order  := (This.State = Running_V2_State);
      --  Fault     := (This.State = Faulty_State);
   end Cyclic;
   
end Devices.Blenders;
