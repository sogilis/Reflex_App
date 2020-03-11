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
   
   procedure Initialize (This : in out Filling_Record) is
   begin
      This := No_Mixing_Record;
   end Initialize;
   
   ------------
   -- Cyclic --
   ------------
   
   procedure Cyclic
     (This             : in out Filling_Record;
      Start_Mixing     : Boolean;
      Mixing_Duration  : Initeger;
      Second           : Integer;
      Start_Blender    : out Boolean;
      Start_Resistance : out Boolean;
      End_Mixing       : out Boolean) is
      
      New_State : Mixing_State := This.State;
   begin
       case This.State is
	 when Init_State =>
	    if Start_Mixing then
	       New_State := Mixing_State;
    	    end if;

	 when Mixing_State =>
	    if Second then
	       This.Mixing_Duration + 1;
	    end if;
	    
	    if This.Mixing_Duration >= Mixing_Duration then
	       New_State := End_Mixing_State;
	    end if;

	 when End_Mixing_State =>
	    null;
      end case;
      
      This.State := New_State;

      -- Commandes
      
      Start_Blender    := (This.State = Mixing_State);
      Start_Resistance := (This.State = Mixing_State);
      End_Mixing       := (This.State = End_Mixing_State);
   end Cyclic;
   
end Tank.Mixing;