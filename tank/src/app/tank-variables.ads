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

with Devices.Valves; use Devices.Valves;
with Devices.Pumps; use Devices.Pumps;
with Devices.Blenders; use Devices.Blenders;
with Devices.Resistances; use Devices.Resistances;
with Tank.Filling; use Tank.Filling;
with Tank.Mixing; use Tank.Mixing;
with Tank.Cycle; use Tank.Cycle;

package Tank.Variables is
   
   Mixing_Graf     : Mixing_Record;
   Filling_P1_Graf : Filling_Record;
   Filling_P2_Graf : Filling_Record;
   Emptying_Graf   : Filling_Record;
   Cycle_Graf      : Cycle_Record;
   
   
   V1_R1 : Devices.Valves.Valve_Record;
   V2_R1 : Devices.Valves.Valve_Record;
   V1_R2 : Devices.Valves.Valve_Record;
   V2_R2 : Devices.Valves.Valve_Record;
   V1_R3 : Devices.Valves.Valve_Record;
   V2_R3 : Devices.Valves.Valve_Record;

   P1 : Devices.Pumps.Pump_Record;
   P2 : Devices.Pumps.Pump_Record;
   P3 : Devices.Pumps.Pump_Record;
   
   Blender : Devices.Blenders.Blender_Record;

   Resistance : Devices.Resistances.Resistance_Record;
   
   End_Filling_P1   : Boolean;
   End_Filling_P2   : Boolean;
   End_Filling      : Boolean;
   End_Mixing       : Boolean;
   End_Emptying     : Boolean;
   Filling_P1_Order : Boolean;
   Filling_P2_Order : Boolean;
   Mixing_Order     : Boolean;
   Emptying_Order   : Boolean;
   End_Cycle        : Boolean;
   
   Filling_V_R1_Opened  : Boolean;
   Filling_V_R1_Closed  : Boolean;
   Filling_P1_Started   : Boolean;  
   Filling_Open_V_R1    : Boolean;
   Filling_Start_P1     : Boolean;
   Filling_Close_V_R1   : Boolean;
   
   Filling_V_R2_Opened  : Boolean;
   Filling_V_R2_Closed  : Boolean;
   Filling_P2_Started   : Boolean;  
   Filling_Open_V_R2    : Boolean;
   Filling_Start_P2     : Boolean;
   Filling_Close_V_R2   : Boolean; 

   Emptying_V_R3_Opened  : Boolean;
   Emptying_V_R3_Closed  : Boolean;
   Emptying_P3_Started   : Boolean;  
   Emptying_Open_V_R3    : Boolean;
   Emptying_Start_P3     : Boolean;
   Emptying_Close_V_R3   : Boolean; 
   
   Blender_Started         : Boolean;
   Mixing_Start_Blender    : Boolean;
   Mixing_Start_Resistance : Boolean;
   Mixing_End              : Boolean;
   
   
   Second : Boolean;
   
   --Temperature adjust by regulator
   
   Pid_Temp_Adjust : Float;
   Temp_Meas   : Float;
   
   --  Pid Parameters
   
   Temperature_Scale_High : Float := 80.0;
   
   Kp         : Float := 0.5;
   Ki         : Float := 0.001;
   Kd         : Float := 0.0;
   Period     : Duration := 1.0;
   Limit_High : Float := 1.0;
   Limit_Low  : Float := 0.0;

end Tank.Variables;
