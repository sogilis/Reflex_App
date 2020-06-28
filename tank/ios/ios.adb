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

with Ext_Ios; use Ext_Ios ;

package body Ios is
   
   --------------------
   -- Acquire_Inputs --
   --------------------
   
   procedure Acquire_Inputs is
   begin
      --  Valve V1_R1
      
      V1_R1_Opened := Ext_V1_R1_Opened;
      V1_R1_Closed := Ext_V1_R1_Closed;
      
      --  Valve V2_R1
      
      V2_R1_Opened := Ext_V2_R1_Opened;
      V2_R1_Closed := Ext_V2_R1_Closed;
      
      --  Valve V1_R2
      
      V1_R2_Opened := Ext_V1_R2_Opened;
      V1_R2_Closed := Ext_V1_R2_Closed;
      
      --  Valve V2_R2
      
      V2_R2_Opened := Ext_V2_R2_Opened;
      V2_R2_Closed := Ext_V2_R2_Closed;

      --  Valve V1_R3
      
      V1_R3_Opened := Ext_V1_R3_Opened;
      V1_R3_Closed := Ext_V1_R3_Closed;
      
      --  Valve V2_R3
      
     V2_R3_Opened :=  Ext_V2_R3_Opened;
     V2_R3_Closed :=  Ext_V2_R3_Closed;
      
      --  ¨Pump P1
      
      P1_Started := Ext_P1_Started;
      
      --  Pump P2
      
      P2_Started := Ext_P2_Started;
      
      --  Pump P3
      
      P3_Started := Ext_P3_Started;
      
      --  Bac
      
      Tank_Low_Level := Ext_Tank_Low_Level;
      Tank_Medium_Level := Ext_Tank_Medium_Level;
      Tank_High_Level := Ext_Tank_High_Level;
      
      --  Resistance Marche
      
      Resistance_SetPoint := Ext_Resistance_SetPoint;
      
      --Regulator
      
      Gradient := Ext_Gradient;
      Tmax := Ext_Tmax;

      --  Blender
      
      V1_Speed := ext_V1_Speed;
      V2_Speed := ext_V2_Speed;          

      --  Hmi
      
      Start_Cycle := Ext_Start_Cycle;
      
   end Acquire_Inputs;
   
   -----------------
   -- Set_Outputs --
   -----------------
   
   procedure Set_Outputs is
   begin
      --  Valve V1_R1
      
      Ext_V1_R1_Open_Order := V1_R1_Open_Order;
      Ext_V1_R1_Close_Order := V1_R1_Close_Order;
      
      --  Valve V2_R1
      
      Ext_V2_R1_Open_Order := V2_R1_Open_Order;
      Ext_V2_R1_Close_Order := V2_R1_Close_Order;
      
      --  Valve V1_R2
      
      Ext_V1_R2_Open_Order := V1_R2_Open_Order;
      Ext_V1_R2_Close_Order := V1_R2_Close_Order;
      
      --  Valve V2_R2
      
      Ext_V2_R2_Open_Order := V2_R2_Open_Order;
      Ext_V2_R2_Close_Order := V2_R2_Close_Order;
      
      --  Valve V1_R3
      
      Ext_V1_R3_Open_Order  := V1_R3_Open_Order;
      Ext_V1_R3_Close_Order := V1_R3_Close_Order;
      
      --  Valve V2_R3
      
      Ext_V2_R3_Open_Order := V2_R3_Open_Order;
      Ext_V2_R3_Close_Order := V2_R3_Close_Order;      
      
      --  ¨Pump P1
      
      Ext_P1_Start_Order := P1_Start_Order;
      
      --  Pump P2
      
      Ext_P2_Start_Order := P2_Start_Order;
      
       --  Pump P3
      
      Ext_P3_Start_Order := P3_Start_Order;     
      
      --  Resistance Marche
      
      Ext_T_Measured := T_Measured ;

      --  Blender
      
      Ext_Blender_Start_Order := Blender_Start_Order;
      Ext_V2_Order   := V2_Order;
      Ext_V1_Order   := V1_Order;
      
      --  Hmi
      
      Ext_Start_Cycle := Start_Cycle;
      
   end Set_Outputs;
   
end Ios;
