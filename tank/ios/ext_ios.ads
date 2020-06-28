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

package  Ext_Ios is
   
   --------------------
   -- Ext_Inputs --
   --------------------
      --  Valve V1_R1
      
	Ext_V1_R1_Opened : Boolean;
	Ext_V1_R1_Closed : Boolean;
      
      --  Valve V2_R1
      
	Ext_V2_R1_Opened : Boolean;
	Ext_V2_R1_Closed : Boolean;
      
      --  Valve V1_R2
      
	Ext_V1_R2_Opened : Boolean;
	Ext_V1_R2_Closed : Boolean;
      
      --  Valve V2_R2
      
	Ext_V2_R2_Opened : Boolean;
        Ext_V2_R2_Closed : Boolean;

      --  Valve V1_R3
      
	Ext_V1_R3_Opened : Boolean;
        Ext_V1_R3_Closed : Boolean;
   
         --  Valve V2_R3
      
	Ext_V2_R3_Opened : Boolean;
	Ext_V2_R3_Closed : Boolean;
      

         
      
      --  ¨Pump P1
      
	Ext_P1_Started : Boolean;
      
      --  Pump P2
      
        Ext_P2_Started : Boolean;

      --  Pump P3
   
        Ext_P3_Started : Boolean;
      
      --  Bac
      
	Ext_Tank_Low_Level    : Boolean;
	Ext_Tank_Medium_Level : Boolean;
	Ext_Tank_High_Level   : Boolean;
      
      --  Resistance Marche
      
        Ext_Resistance_SetPoint : Float;
        Ext_Gradient            : Float;
        Ext_Tmax                : Float;

      
      --  Blinder
      
	Ext_Blender_Started : Boolean;
      
      --  Hmi
      
	Ext_Start_Cycle : Boolean;
   
   -----------------
   -- Outputs --
   -----------------

      --  Valve V1_R1
      
	Ext_V1_R1_Open_Order  : Boolean;
	Ext_V1_R1_Close_Order : Boolean;
      
      --  Valve V2_R1
      
	Ext_V2_R1_Open_Order  : Boolean;
	Ext_V2_R1_Close_Order : Boolean;
      
      --  Valve V1_R2
      
	Ext_V1_R2_Open_Order    : Boolean;
	  Ext_V1_R2_Close_Order : Boolean;
      
      --  Valve V2_R2
      
	Ext_V2_R2_Open_Order  : Boolean;
        Ext_V2_R2_Close_Order : Boolean;
   
      --  Valve V1_R3
      
	Ext_V1_R3_Open_Order  : Boolean;
	Ext_V1_R3_Close_Order : Boolean;
      
      --  Valve V2_R3
      
	Ext_V2_R3_Open_Order  : Boolean;
	Ext_V2_R3_Close_Order : Boolean;   
      
      --  ¨Pump P1
      
	Ext_P1_Start_Order : Boolean;
      
      --  Pump P2
      
        Ext_P2_Start_Order : Boolean;
   
      --  Pump P3
      
	Ext_P3_Start_Order : Boolean;   
      
      --  Resistance Marche
      
        Ext_T_Measured : Float;


      --  Blinder
      
       Ext_Blender_Start       : Boolean;
       Ext_V1_Speed            : Boolean;
       Ext_V2_Speed            : Boolean;
       Ext_V1_Order            : Boolean;
       Ext_V2_Order            : Boolean;
       Ext_Blender_Start_Order : Boolean;
   
      
      --  Hmi
      
	Ext_End_Cycle : Boolean;
      
end Ext_Ios;
