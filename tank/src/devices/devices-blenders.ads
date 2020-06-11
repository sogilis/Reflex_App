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

package Devices.Blenders is
   
   
   type Blender_Record is new Device_Record with private;
   
   type Blender_State is 
     (Init_State,
      Stop_State,
      Starting_State,
      Running_V1_State,
      Running_V2_State,
      Stopping_State );
   
   procedure Initialize (This : in out Blender_Record);

   function get_state(This : Blender_Record) return Blender_State;

   procedure set_state (This : in out Blender_Record; S: Blender_State);
   
  
   procedure Cyclic
     (This      : in out Blender_Record;
      Run       : Boolean;
      Speed_1   : Boolean;
      Speed_2   : Boolean;
      Run_Order : out Boolean;
      v2_Order  : out Boolean;
      v1_Order  : out Boolean);
   
private
   
   type Blender_Record is new Device_Record with record
      State        : Blender_State;
   end record;
   
   No_Blender_Record : constant Blender_Record :=
     (No_Device_Record with
      State        => Init_State);

   
end Devices.Blenders;
