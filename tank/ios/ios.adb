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

with Devices.Valves;

with
package body Ios is
   
   --------------------
   -- Acquire_Inputs --
   --------------------
   
   procedure Acquire_Inputs is
   begin
      --  Valve V1_R1
      
  V1_R1_Opened;
  V1_R1_Closed;
      
      --  Valve V2_R1
      
  V2_R1_Opened : Boolean;
  V2_R1_Closed : Boolean;
      
      --  Valve V1_R2
      
  V1_R2_Opened : Boolean;
  V1_R2_Closed : Boolean;
      
      --  Valve V2_R2
      
  V2_R2_Opened : Boolean;
  V2_R2_Closed : Boolean;
      
      --  ¨Pump P1
      
  P1_Started : Boolean;
      
      --  Pump P2
      
  P2_Started : Boolean;
      
      --  Bac
      
  Tank_Low_Levl : Bollena;
  Tank_Medium_Levl : Bollena;
  Tank_High_Levl : Bollena;
      
      --  Resistance Marche
      
  Resistor_Temperature : Integer;
      
      --  Blinder
      
  Blinder_Started : Boolean;
      
      --  Hmi
      
  Start_Cycle : Boolean;
      
   end Acquire_Inputs;
   
   -----------------
   -- Set_Outputs --
   -----------------
   
   procedure Set_Outputs is
   begin
      --  Valve V1_R1
      
  V1_R1_Open_Order : Boolean;
  V1_R1_Close_Order : Boolean;
      
      --  Valve V2_R1
      
  V2_R1_Open_Order : Boolean;
  V2_R1_Close_Order : Boolean;
      
      --  Valve V1_R2
      
  V1_R2_Open_Order : Boolean;
  V1_R2_Close_Order : Boolean;
      
      --  Valve V2_R2
      
  V2_R2_Open_Order : Boolean;
  V2_R2_Close_Order : Boolean;
      
      --  ¨Pump P1
      
  P1_Start_Order : Boolean;
      
      --  Pump P2
      
  P2_Start_Order : Boolean;
      
      --  Resistance Marche
      
  Resitor_Start : Boolean;
  Resistor_Order : Integer;
      
      --  Blinder
      
  Blinder_Start : Boolean;
      
      --  Hmi
      
  Start_Cycle : Boolean;
      
   end Set_Outputs;
   
end Ios;
