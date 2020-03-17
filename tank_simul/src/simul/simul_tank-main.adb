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

with Simul.Devices.Valves; use Simul.Devices.Valves;
with Simul.Devices.Pumps; use Simul.Devices.Pumps;
with Simul.Devices.Blenders; use Simul.Devices.Blenders;

--with Simul.Regul.Ramps; use  Simul.Regul.Ramps;

with Ios_Simul; use Ios_Simul;


package body Simul_Tank.Main is
   
   ----------------
   -- Initialize --
   ----------------
   
   procedure Initialize is
   begin
     V1_R1_Simul.Initialize;
     V2_R1_Simul.Initialize;
     V1_R2_Simul.Initialize;
     V2_R2_Simul.Initialize;
     V1_R3_Simul.Initialize;
     V2_R3_Simul.Initialize;
     Blender_Simul.Initialize;
     
   end Initialize;
      
   ------------
   -- Cyclic --
   ------------
   
   procedure Cyclic is
   begin

      -- Command Devices
      
      --  Valve V1_R1 
      
      Simul.Devices.Valves.Cyclic
        (This         => V1_R1_Simul,
         Second       => Second_3,
	 Open_Order   => V1_R1_Open_Order_Simul,
	 Close_Order  => V1_R1_Close_Order_Simul,
	 Opened       => V1_R1_Opened_Simul,
	 Closed       => V1_R1_Closed_Simul);

      --  Valve V2_R1 
      
      Simul.Devices.Valves.Cyclic
        (This         => V2_R1_Simul,
         Second       => Second_3,
	 Open_Order   => V2_R1_Open_Order_Simul,
	 Close_Order  => V2_R1_Close_Order_Simul,
	 Opened       => V2_R1_Opened_Simul,
	 Closed       => V2_R1_Closed_Simul);
	
      --  Valve V1_R2
      
      Simul.Devices.Valves.Cyclic
        (This         => V1_R2_Simul,
         Second       => Second_3,
	 Open_Order   => V1_R2_Open_Order_Simul,
	 Close_Order  => V1_R2_Close_Order_Simul,
	 Opened       => V1_R2_Opened_Simul,
	 Closed       => V1_R2_Closed_Simul);

      --  Valve V2_R2 
      
      Simul.Devices.Valves.Cyclic
        (This         => V2_R2_Simul,
         Second       => Second_3,
	 Open_Order   => V2_R2_Open_Order_Simul,
	 Close_Order  => V2_R2_Close_Order_Simul,
	 Opened       => V2_R2_Opened_Simul,
	 Closed       => V2_R2_Closed_Simul);

      --  Valve V1_R3
      
      Simul.Devices.Valves.Cyclic
        (This         => V1_R3_Simul,
         Second       => Second_3,
	 Open_Order   => V1_R3_Open_Order_Simul,
	 Close_Order  => V1_R3_Close_Order_Simul,
	 Opened       => V1_R3_Opened_Simul,
	 Closed       => V1_R3_Closed_Simul);

      --  Valve V2_R2 
      
      Simul.Devices.Valves.Cyclic
        (This         => V2_R2_Simul,
         Second       => Second_3,
	 Open_Order   => V2_R3_Open_Order_Simul,
	 Close_Order  => V2_R3_Close_Order_Simul,
	 Opened       => V2_R3_Opened_Simul,
	 Closed       => V2_R3_Closed_Simul);
      
     --Pump P1

     Simul.Devices.Pumps.Cyclic
        ( Run_Order => P1_Start_Order_Simul,
          Running   => P2_Started_Simul);

     --Pump P2

     Simul.Devices.Pumps.Cyclic
        (Run_Order => P2_Start_Order_Simul,
	 Running   => P2_Started_Simul);

     --Pump P3

     Simul.Devices.Pumps.Cyclic
        (Run_Order => P3_Start_Order_Simul,
         Running   => P3_Started_Simul);

     --Blender

     Simul.Devices.Blenders.Cyclic
       (This      => Blender_Simul,
        Run_Order => Blender_Start_Order_Simul,
        V1_Order  => V1_Order_Simul,
        V2_Order  => V2_Order_Simul,
        Speed_1   => V1_Speed_Simul,
        Speed_2   => V2_Speed_Simul);
      
   end Cyclic;
   
end Simul_Tank.Main;
