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
with Simul;
with Simul.Devices.Valves; use Simul.Devices.Valves;
with Simul.Devices.Pumps; use Simul.Devices.Pumps;
with Simul.Devices.Blenders; use Simul.Devices.Blenders;

package Simul_Tank.Main is

     V1_R1_Simul   : Valve_Record;
     V2_R1_Simul   : Valve_Record;
     V1_R2_Simul   : Valve_Record;
     V2_R2_Simul   : Valve_Record;
     V1_R3_Simul   : Valve_Record;
     V2_R3_Simul   : Valve_Record;
     Blender_Simul : Blender_Record;
   
     Second_3        : Boolean;
        
   procedure Initialize;
   procedure Cyclic;

   
end Simul_Tank.Main;
