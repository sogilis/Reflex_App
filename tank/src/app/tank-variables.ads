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

with Devices.Valves; use Devices.Valves;;
with Devices.Pumps; use Devices.Pumps;
with Devices.Blenders; use Devices.Blenders;
with Devices.Resistances; use Devices.Resistances;
with Tank.Filling; use Tank.Filling;
with Tank.Mixing; use Tank.Mixing;
with Tank.Cycle; use Tank.Cycle;

package Tank.Variables is
   
   Mixing_Graf  : Mixing_Record;
   Filling_Graf : Filling_Record;
   Cycle_Graf   : Cycle_Record;
   
   
   V1_R1_Graf : Devices.Valves.Valve_Record;
   V2_R1_Graf : Devices.Valves.Valve_Record;
   V1_R2_Graf : Devices.Valves.Valve_Record;
   V2_R2_Graf : Devices.Valves.Valve_Record;
   
   
   Start_Cycle    : Boolean;
   End_Filling    : Boolean;
   End_Mixing     : Boolean;
   End_Emptying   : Boolean;
   Filling_Order  : Boolean;
   Mixing_Order   : Boolean;
   Emptying_Order : Boolean;
   End_Cycle      : Boolean);
   
   Filling_Valves_Opened  : Boolean;
   Filling_Valves_Closed  : Boolean;
   Filling_Pumps_Started  : Boolean;  
   Level_P        : Boolean;
   Filling_Open_Valves    : Boolean;
   Filling_Start_Pumps    : Boolean;
   Filling_Close_Valves   : Boolean;
   
   Mixing_Start_Blender : Boolean;
   Mixing_Start_Resistance : Boolean;
   Mixing_End : Boolean;
   
   
   Mixing_Duration : constant Integer := 60 * 60;
   --  Mising duration in seconds (60mn)
   
   Second : Boolean;
   -- Raising edge each second
   
end Tank.Variables;
