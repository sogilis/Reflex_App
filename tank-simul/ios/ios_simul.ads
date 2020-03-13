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

package Ios_Simul is
   
   -- Valves for Filling --
   ------------------------
   
   --  Valve V1_R1 
   
   V1_R1_Opened_Simul      : Boolean;
   V1_R1_Closed_Simul      : Boolean;
   V1_R1_Open_Order_Simul  : Boolean;
   V1_R1_Close_Order_Simul : Boolean;
   
   --  Valve V2_R1
   
   V2_R1_Opened_Simul      : Boolean;
   V2_R1_Closed_Simul      : Boolean;
   V2_R1_Open_Order_Simul  : Boolean;
   V2_R1_Close_Order_Simul : Boolean;
   
   --  Valve V1_R2
   
   V1_R2_Opened_Simul : Boolean;
   V1_R2_Closed_Simul : Boolean;
   V1_R2_Open_Order_Simul : Boolean;
   V1_R2_Close_Order_Simul : Boolean;
   
   --  Valve V2_R2
   
   V2_R2_Opened_Simul      : Boolean;
   V2_R2_Closed_Simul      : Boolean;
   V2_R2_Open_Order_Simul  : Boolean;
   V2_R2_Close_Order_Simul : Boolean;
   
   -- Valves for Emptying --
   -------------------------
   
   --  Valve V1_R3
   
   V1_R3_Opened_Simul      : Boolean;
   V1_R3_Closed_Simul      : Boolean;
   V1_R3_Open_Order_Simul  : Boolean;
   V1_R3_Close_Order_Simul : Boolean;
   
   --  Valve V2_R3
   
   V2_R3_Opened_Simul      : Boolean;
   V2_R3_Closed_Simul      : Boolean;
   V2_R3_Open_Order_Simul  : Boolean;
   V2_R3_Close_Order_Simul : Boolean;
   
   
   --  Pump P1 Filling From Tank 1
   
   P1_Started_Simul     : Boolean;
   P1_Start_Order_Simul : Boolean;
   
   --  Pump P2 Filling from Tank 2
   
   P2_Started_Simul     : Boolean;
   P2_Start_Order_Simul : Boolean;
   
   --  Pump P3 Emptying
   
   P3_Started_Simul     : Boolean;
   P3_Start_Order_Simul : Boolean;
   
   --  Bac
   
   Tank_Low_Level_Simul    : Boolean;
   Tank_Medium_Level_Simul : Boolean;
   Tank_High_Level_Simul   : Boolean;
   
   --ptemperature measured by the sensor
   
   T_Measured_Simul : float;
   
   --  Resistance Marche
   
   Gradient_Simul             : float;
   Tmax_Simul                 : float;
   Resistance_SetPoint_Simul  : float;

   --  Blender
   
   V1_Speed_Simul            : Boolean;
   V2_Speed_Simul            : Boolean;
   Blender_Start_Order_Simul : Boolean;
   V1_Order_Simul            : Boolean;
   V2_Order_Simul            : Boolean;
   
   --  Hmi
   
   Start_Cycle_Simul : Boolean;
   
   procedure Acquire_Inputs;
   procedure Set_Outputs;
   
end Ios_Simul;
