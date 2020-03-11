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

package Tank.Cycle is
   
   ----------------
   -- Initialize --
   ----------------
   
   procedure Initialize (This : in out Cycle_Record) is
   begin
      This.State := No_Cycle_Record;
   end Initialize;
   
   procedure Cyclic
     (This           : in out Cycle_Record;
      Start          : in Boolean;
      End_Filling    : Boolean;
      End_Mixing     : Boolean;
      End_Emptying   : Boolean;
      Filling_Order  : out Boolean;
      Mixing_Order   : out Boolean;
      Emptying_Order : out Boolean;
      End_Cycle      : out Boolean) is
   begin
      
      New_State : Tank_State := This.State;
   begin
      Put_Line ("Tank.Cyclic");
      case This.State is
	 when Init_State =>
	       New_State := Filling_State;
	       
	 when Filling_State =>
	    if This.End_Filling then
	       New_State := Mixing_State;
	    end if; 
         
         when Mixing_State =>
	    if This.End_Mixing then
	       New_State := Emptying_State;
	    end if;
	    
	 when Emptying_State =>
	    if  This.End_Emptying then
	       New_State := Filling_State;
	    end if;
	    
	 when End_Cycle =>
	    null;
      end case;
      
      This.State := New_State;


     -- Commandes

	This.Filling_Order  := (This.State=Filling_State);
	This.Mixing_Order   := (This.State=Mixing_State);
	This.Emptying_Order := (This.State=Emptying_State);
   end Cyclic;
   
private
   
   Mixing_Graf  : Mixing_Record;
   Filling_Graf : Filling_Record;
   
end Tank.Cycle;
