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

with Regul.Ramps; use  Regul.Ramps;
with Devices.Resistances; use DEvices.Resistances;

with Tank.Variables; use Tank.Variables;
with Ios; use Ios;


package body Tank.Main is
   
   ----------------
   -- Initialize --
   ----------------
   
   procedure Initialize is
   begin
     V1_R1.Initialize;
     V2_R1.Initialize;
     V1_R2.Initialize;
     V2_R2.Initialize;
     V1_R3.Initialize;
     V2_R3.Initialize;
     P1.Initialize;
     P2.Initialize;
     P3.Initialize;
     
     Blender.Initialize;
     Resistance.Initialize;
     
     Mixing_Graf.Initialize;
     Filling_P1_Graf.Initialize;
     Filling_P2_Graf.Initialize;
     Emptying_Graf.Initialize;
     
   end Initialize;
   
   ---------
   -- Pre --
   ---------
   
   procedure Pre is
   begin
      --  Update second signal
      
      Filling_V_R1_Opened  := 
	V1_R1_Opened and V2_R1_Opened;
      
      Filling_V_R1_Closed  :=
	V1_R1_Closed and V2_R1_Closed;

      Filling_V_R2_Opened  := 
        V1_R2_Opened and V2_R2_Opened;
      
      Filling_V_R1_Closed  :=
        V1_R2_Closed and V2_R2_Closed;

      Emptying_V_R3_Opened :=
	V1_R3_Opened and V2_R3_Opened;

      Emptying_V_R3_Closed  :=
	V1_R3_Closed and V2_R3_Closed;
      
      
   end Pre;
   
   ----------
   -- Post --
   ----------
   
   procedure Post is
   begin
      null;
   end Post;
   
   ------------
   -- Cyclic --
   ------------
   
   procedure Cyclic is
   begin
      --  Acquire Inputs
      
      --  Pre Treatment
      Pre;
      
      --  Cycle
      
      Tank.Cycle.Cyclic
	(This             => Cycle_Graf,
	 Start            => Start_Cycle,
	 End_Filling_P1   => End_Filling_P1,
	 End_Filling_P2   => End_Filling_P2,
	 End_Mixing       => End_Mixing,
	 End_Emptying     => End_Emptying,
	 Filling_P1_Order => Filling_P1_Order,--out
	 Filling_P2_Order => Filling_P2_Order,--out
	 Mixing_Order     => Mixing_Order,--out
	 Emptying_Order   => Emptying_Order,--out
	 End_Cycle        => End_Cycle);--out
      
      --  Filling
      
      Tank.Filling.Cyclic
	(This           => Filling_P1_Graf,
	 Start_Filling  => Filling_P1_Order,
	 Valves_Opened  => Filling_V_R1_Opened,
	 Valves_Closed  => Filling_V_R1_Closed,
	 Pumps_Started  => P1_Started,
	 Level_P        => Tank_Medium_Level,
	 Open_Valves    => Filling_Open_V_R1,--out
	 Start_Pumps    => Filling_Start_P1,--out
	 Close_Valves   => Filling_Close_V_R1);--out

      Tank.Filling.Cyclic
	(This           => Filling_P2_Graf,
	 Start_Filling  => Filling_P2_Order,
	 Valves_Opened  => Filling_V_R2_Opened,
	 Valves_Closed  => Filling_V_R2_Closed,
	 Pumps_Started  => P2_Started,
	 Level_P        => Tank_High_Level,
	 Open_Valves    => Filling_Open_V_R2,--out
	 Start_Pumps    => Filling_Start_P2,--out
	 Close_Valves   => Filling_Close_V_R2);--out

      --  Mixing
      
      Tank.Mixing.Cyclic
	(This             => Mixing_Graf,
	 Start_Mixing     => Mixing_Order,
         Blender_Started  => Blinder_Started,
	 Mixing_Duration  => Mixing_Duration,
	 Second           => Second,
	 Start_Blender    => Mixing_Start_Blender,--on met des variable intermédiaire pour pour les sorties pour plus d'option sur  la fonction post
	 Start_Resistance => Mixing_Start_Resistance,--out
	 End_Mixing       => End_Mixing);--out
      
      -- Emptying
      
         Tank.Filling.Cyclic
	(This           => Emptying_Graf,
	 Start_Filling  => Emptying_Order,
	 Valves_Opened  => Emptying_V_R3_Opened,
	 Valves_Closed  => Emptying_V_R3_Closed,
	 Pumps_Started  => P3_Started,
	 Level_P        => Tank_Low_Level,
	 Open_Valves    => Emptying_Open_V_R3,--out
	 Start_Pumps    => Emptying_Start_P3,--out
	 Close_Valves   => Emptying_Close_V_R3);--out
      -- Command Devices
      
      --  Valve V1_R1 
      
      Devices.Valves.Cyclic
	(This         => V1_R1,
	 Open         => Filling_Open_V_R1,
	 Close        => Filling_Close_V_R1,
	 Opened       => V1_R1_Opened,
	 Closed       => V1_R1_Closed,
	 Open_Order   => V1_R1_Open_Order,
	 Close_Order  => V1_R1_Close_Order);

      --  Valve V2_R1 
      
      Devices.Valves.Cyclic
	(This         => V2_R1,
	 Open         => Filling_Open_V_R1,
	 Close        => Filling_Close_V_R1,
	 Opened       => V2_R1_Opened,
	 Closed       => V2_R1_Closed,
	 Open_Order    => V2_R1_Open_Order,
	 Close_Order  => V2_R1_Close_Order);
	
      --  Valve V1_R2
      
      Devices.Valves.Cyclic
	(This         => V1_R2,
	 Open         => Filling_Open_V_R2,
	 Close        => Filling_Close_V_R2,
	 Opened       => V1_R2_Opened,
	 Closed       => V1_R2_Closed,
	 Open_Order   => V1_R2_Open_Order,
	 Close_Order  => V1_R2_Close_Order);

      --  Valve V2_R2 
      
      Devices.Valves.Cyclic
	(This         => V2_R2,
	 Open         => Filling_Open_V_R2,
	 Close        => Filling_Close_V_R2,
	 Opened       => V2_R2_Opened,
	 Closed       => V2_R2_Closed,
	 Open_Order   => V2_R2_Open_Order,
	 Close_Order  => V2_R2_Close_Order);

      --  Valve V1_R3
      
      Devices.Valves.Cyclic
	(This         => V1_R3,
	 Open         => Emptying_Open_V_R3,
	 Close        => Emptying_Close_V_R3,
	 Opened       => V1_R3_Opened,
	 Closed       => V1_R3_Closed,
	 Open_Order   => V1_R3_Open_Order,
	 Close_Order  => V1_R3_Close_Order);

      --  Valve V2_R2 
      
      Devices.Valves.Cyclic
	(This         => V2_R2,
	 Open         => Emptying_Open_V_R3,
	 Close        => Emptying_Close_V_R3,
	 Opened       => V2_R3_Opened,
	 Closed       => V2_R3_Closed,
	 Open_Order   => V2_R3_Open_Order,
	 Close_Order  => V2_R3_Close_Order);
      
     --Pump P1

     Devices.Pumps.Cyclic
        (This      => P1,
         Run       => Filling_Start_P1,
         Running   => P2_Started,
         Run_Order => P1_Start_Order);

     --Pump P2

     Devices.Pumps.Cyclic
        (This      => P2,
         Run       => Filling_Start_P2,
         Running   => P2_Started,
         Run_Order => P2_Start_Order);

     --Pump P3

     Devices.Pumps.Cyclic
        (This      => P3,
         Run       => Emptying_Start_P3,
         Running   => P3_Started,
         Run_Order => P3_Start_Order);

     --Blender

     Devices.Blenders.Cyclic
        (This      => Blender,
         Run       => Mixing_Start_Blender,
         CP        => CP,
         Therm     => Therm,
         Running   => Blinder_Started,
         Speed_1   => Speed_1,
         Speed_2   => Speed_2,
         Acqk      => Acqk,
         Run_Order => Blinder_Start_Order,
         v2_Order  => V2_Order);
      
     Regul.Ramps.Ramp
     (Second     => Second,
      T_sensor   => T_Measured,
      Set_Point  => Resistance_SetPoint,
      Gradient   => Gradient, --Per minute
      Tmax       => Tmax,
      T_Adjusted => T_Measured);
         
     Devices.Resistances.Cyclic
     (This       => Resistance,
      Run        => Mixing_Start_Blender,
      T_Regul    => T_Adjusted,
      Set_Point  => Resistance_SetPoint);

      
      --  Post Treatment

      
      
      --  Update Outputs
      
   end Cyclic;
   
end Tank.Main;
