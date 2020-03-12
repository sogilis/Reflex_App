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

package Ios is
   
   -- Valves for Filling --
   ------------------------
   
   --  Valve V1_R1 
   
   V1_R1_Opened      : Boolean;
   V1_R1_Closed      : Boolean;
   V1_R1_Open_Order  : Boolean;
   V1_R1_Close_Order : Boolean;
   
   --  Valve V2_R1
   
   V2_R1_Opened      : Boolean;
   V2_R1_Closed      : Boolean;
   V2_R1_Open_Order  : Boolean;
   V2_R1_Close_Order : Boolean;
   
   --  Valve V1_R2
   
   V1_R2_Opened : Boolean;
   V1_R2_Closed : Boolean;
   V1_R2_Open_Order : Boolean;
   V1_R2_Close_Order : Boolean;
   
   --  Valve V2_R2
   
   V2_R2_Opened      : Boolean;
   V2_R2_Closed      : Boolean;
   V2_R2_Open_Order  : Boolean;
   V2_R2_Close_Order : Boolean;
   
   -- Valves for Emptying --
   -------------------------
   
   --  Valve V1_R3
   
   V1_R3_Opened      : Boolean;
   V1_R3_Closed      : Boolean;
   V1_R3_Open_Order  : Boolean;
   V1_R3_Close_Order : Boolean;
   
   --  Valve V2_R3
   
   V2_R3_Opened      : Boolean;
   V2_R3_Closed      : Boolean;
   V2_R3_Open_Order  : Boolean;
   V2_R3_Close_Order : Boolean;
   
   
   --  Pump P1 Filling From Tank 1
   
   P1_Started     : Boolean;
   P1_Start_Order : Boolean;
   
   --  Pump P2 Filling from Tank 2
   
   P2_Started     : Boolean;
   P2_Start_Order : Boolean;
   
   --  Pump P3 Emptying
   
   P3_Started     : Boolean;
   P3_Start_Order : Boolean;
   
   --  Bac
   
   Tank_Low_Level    : Boolean;
   Tank_Medium_Level : Boolean;
   Tank_High_Level   : Boolean;
   
   --ptemperature measured by the sensor
   
   T_Measured           : float;
   
   --  Resistance Marche
   
   Gradient             : float;
   Tmax                 : float;
   
   --  Resistance Marche
    
   Resistance_SetPoint  : float;
   
   --  higher speed of mixing

   V2_Order             : Boolean;

   --  Blinder
   
   Blinder_Started     : Boolean;
   Blinder_Start_Order : Boolean;
   
   --  Hmi
   
   Start_Cycle : Boolean;
   
   procedure Acquire_Inputs;
   procedure Set_Outputs;
   
end Ios;
