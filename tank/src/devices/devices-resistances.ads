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

package Devices.Resistances is
   
   
   type Resistance_Record is new Device_Record with private;
   
   type Resistance_State is 
     ( Init_State,
       Waiting_State,
       Running_State );
   
   procedure Initialize (This : in out Resistance_Record);

   function get_state(This : Resistance_Record) return Resistance_State;

   procedure set_state (This : in out Resistance_Record; S: Resistance_State);
   
  
   procedure Cyclic
     (This       : in out Resistance_Record;
      Run        : Boolean;
      T_Regul    : Float;
      Set_Point  : Float);
   
private
   
   type Resistance_Record is new Device_Record with record
      State        : Resistance_State;
   end record;
   
   No_Resistance_Record : constant Resistance_Record :=
     (No_Device_Record with
      State        => Init_State);
end Devices.Resistances;
