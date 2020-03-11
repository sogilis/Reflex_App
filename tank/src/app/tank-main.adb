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

package body Tank.Main is
   
   ----------------
   -- Initialize --
   ----------------
   
   procedure Initialize is
   begin
     V1_R1.Initialize;
     V2_R1.Initialize;
     V3_R1.Initialize;
     V1_R2.Initialize;
     V2_R2.Initialize;
     V3_R2.Initialize;
     
     P1.Initialize;
     P2.Initialize;
     P3.Initialize;
     
     Blender.Initialize;
     Resistance.Initialize;
     
     Mixing_Graf.Initialize;
     Filling_Graf.Initialize;
     
   end Initialize;
   
   ---------
   -- Pre --
   ---------
   
   procedure Pre is
   begin
      --  Update second signal
      
      Filling_Valves_Opened  := 
	V1_R1_Opened and V2_R1_Opened and V1_R2_Opened and V2_R2_Opened;
      
      Filling_Valves_Closed  :=
	V1_R1_Closed and V2_R1_Closed and V1_R2_Closed and V2_R2_Closed;
	
      Filling_Pumps_Started  := P1_Started and P2_Started;
      
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
      
      Cycle.Cyclic
	(This           => Cycle_Graf,
	 Start          => Start_Cycle,
	 End_Filling    => End_Filling,
	 End_Mixing     => End_Mixing,
	 End_Emptying   => End_Emptying,
	 Filling_Order  => Filling_Order,
	 Mixing_Order   => Mixing_Order,
	 Emptying_Order => Emptying_Order,
	 End_Cycle      => End_Cycle);
      
      --  Filling
      
      Tank.Filling.Cyclic
	(This           => Filling_Graf,
	 Start_Filling  => Filling_Order,
	 Valves_Opened  => Filling_Valves_Opened,
	 Valves_Opened  => Filling_Valves_Opened,
	 Valves_Closed  => Filling_Valves_Closed,
	 Pumps_Started  => Filling_Pumps_Started,
	 Level_P        => Tank_Medium_Levl,
	 Open_Valves    => Filling_Open_Valves,
	 Start_Pumps    => Filling_Start_Pumps,
	 Close_Valves   => Filling_Close_Valves);
      
      --  Mixing
      
      Tank.Mixing.Cyclic
	(This             => Mixing_Graf,
	 Start_Mixing     => Mixing_Order,
	 Mixing_Duration  => Mixing_Duration,
	 Second           => Second,
	 Start_Blender    => Mising_Start_Blender,
	 Start_Resistance => Mising_Start_Resistance,
	 End_Mixing       => Mixing_End);
      
      -- Emptying
      
      
      -- Command Devices
      
      --  Valve V1_R1 
      
      Devices.Valves.Cyclic
	(This         => V1_R1_Graf,
	 Open         => Filling_Open_Valves,
	 Close        => Filling_Close_Valves,
	 Opened       => V1_R1_Opened,
	 Closed       => V1_R1_Closed,
	 Open_Order   => V1_R1_Open_Order,
	 Close_Order  => V1_R1_Close_Order);
	
      
      --  Post Treatment

      
      
      --  Update Outputs
      
   end Cyclic;
   
end Tank.Main;
