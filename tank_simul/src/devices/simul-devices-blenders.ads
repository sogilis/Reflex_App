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

package Simul.Devices.Blenders is
   
   
   type Blender_Record is new Device_Record with private;
   
   type Blender_State is 
     (Init_State,
      Stop_State,
      Running_V1_State,
      Running_V2_State);
   
   procedure Initialize (This : in out Blender_Record);
   
  
   procedure Cyclic
     (This      : in out Blender_Record;
      V1_Order  : Boolean;
      V2_Order  : Boolean;
      Run_Order : Boolean;
      Speed_1   : out Boolean;
      Speed_2   : out Boolean);
   
private
   
   type Blender_Record is new Device_Record with record
      State        : Blender_State;
   end record;
   
   No_Blender_Record : constant Blender_Record :=
     (No_Device_Record with
      State        => Init_State);

   
end Simul.Devices.Blenders;
