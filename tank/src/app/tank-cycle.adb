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

package body Tank.Cycle is
   
   ----------------
   -- Initialize --
   ----------------
   
   procedure Initialize (This : in out Cycle_Record) is
   begin
      This := No_Cycle_Record;
   end Initialize;

   function get_state (This : Cycle_Record) return Cycle_State is
     begin
	return This.State;
     end get_state;  

   procedure set_state (This : in out Cycle_Record; S: Cycle_State) is
     begin
	 This.State := S;
     end Set_State;
   
   procedure Cyclic
     (This             : in out Cycle_Record;
      End_Filling_P1   : Boolean;
      End_Filling_P2   : Boolean;
      End_Mixing       : Boolean;
      End_Emptying     : Boolean;
      Filling_P1_Order : out Boolean;
      Filling_P2_Order : out Boolean;
      Mixing_Order     : out Boolean;
      Emptying_Order   : out Boolean;
      End_Cycle        : out Boolean) is  
      
      New_State : Cycle_State := This.State;
   begin
      case This.State is
	 when Init_State =>
	       New_State := Filling_P1_State;
	       
	 when Filling_P1_State =>
	    if End_Filling_P1 then
	       New_State := Filling_P2_State;
	    end if;

         When Filling_P2_State =>
	    if End_Filling_P2 then
	       New_State := Mixing_State;
	    end if; 
         
         when Mixing_State =>
	    if End_Mixing then
	       New_State := Emptying_State;
	    end if;
	    
	 when Emptying_State =>
	    if End_Emptying then
	       New_State := End_Cycle_State;
	    end if;
	    
	 when End_Cycle_State =>
            null;     
            
      end case;
      
      This.State := New_State;


     -- Commandes

	Filling_P1_Order  := (This.State=Filling_P1_State);
	Filling_P2_Order  := (This.State=Filling_P2_State);
	Mixing_Order      := (This.State=Mixing_State);
        Emptying_Order    := (This.State=Emptying_State);
      	End_Cycle         := (This.State=End_Cycle_State);

   end Cyclic;
   
end Tank.Cycle;
