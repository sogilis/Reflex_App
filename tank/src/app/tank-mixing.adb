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

package body Tank.Mixing is
   
   ----------------
   -- Initialize --
   ----------------
   
   procedure Initialize (This : in out Mixing_Record) is
   begin
      This := No_Mixing_Record;
   end Initialize;
   
   function get_state (This : Mixing_Record) return Mixing_State is
     begin
	return This.State;
     end get_state;

   procedure set_state (This : in out Mixing_Record; S: Mixing_State) is
   begin
      This.State := S;
   end Set_State;
     
   -- Get_Counter --
   -----------------
   
   function Get_Counter (This : in out Mixing_Record) return Integer is
   begin
      return This.Counter;
   end Get_Counter;
   
   -----------------
   -- Set_Counter --
   -----------------
   
   procedure Set_Counter
     (This    : in out Mixing_Record;
      Counter : Integer) is
   begin
      This.Counter := Counter;
   end Set_Counter;
   
     
   ------------
   -- Cyclic --
   ------------
   
   procedure Cyclic
     (This             : in out Mixing_Record;
      Start_Mixing     : Boolean;
      Blender_Started  : Boolean;
      Mixing_Duration  : Integer;
      Second           : boolean;
      Start_Blender    : out Boolean;
      Start_Resistance : out Boolean;
      End_Mixing       : out Boolean) is
      
      New_State : Mixing_State := This.State;
   begin
      Put_Line ("App_Mixing.Cyclic");
       case This.State is
	 when Init_State =>
	    if Start_Mixing then
	       New_State := Mix_State;
    	    end if;

	 when Mix_State =>
	    if Blender_Started then
	       New_State :=It_Mixes_State;
    	    end if;

	 when It_Mixes_State =>
	    if Second then
	       This.Counter:=This.Counter + 1;
	    end if;
	    
	    if This.Counter >= Mixing_Duration then
	       New_State := End_Mixing_State;
	    end if;

	 when End_Mixing_State =>
	    null;
      end case;
      
      This.State := New_State;

      -- Commandes
      
      Start_Blender    := (This.State = It_Mixes_State);
      Start_Resistance := (This.State = It_Mixes_State);
      End_Mixing       := (This.State = End_Mixing_State);
   end Cyclic;
   
end Tank.Mixing;
