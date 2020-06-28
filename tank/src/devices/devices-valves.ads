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

package Devices.Valves is
   
   
   type Valve_Record is new Device_Record with private;
   
   type Valve_State is 
     (Init_State,
      Waiting_State,
      Opening_State,
      Opened_State,
      Closing_State,
      Closed_State);
   
   procedure Initialize (This : in out Valve_Record);
   
   procedure Cyclic
     (This         : in out Valve_Record;
      Open         : Boolean;
      Close        : Boolean;
      Opened       : Boolean;
      Closed       : Boolean;
      Open_Order   : out Boolean;
      Close_Order  : out Boolean);

   function get_state(This : Valve_Record) return Valve_State;

   procedure set_state (This : in out Valve_Record; S: Valve_State);
   
private
   
   type Valve_Record is new Device_Record with record
      State        : Valve_State;
   end record;
   
   No_Valve_Record : constant Valve_Record :=
     (No_Device_Record with
      State        => Init_State);
   
end Devices.Valves;
