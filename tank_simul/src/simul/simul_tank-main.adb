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

with Ada.Text_IO; use Ada.Text_IO;
with Simul.Devices.Valves; use Simul.Devices.Valves;
with Simul.Devices.Pumps; use Simul.Devices.Pumps;
with Simul.Devices.Blenders; use Simul.Devices.Blenders;

--with Simul.Regul.Ramps; use  Simul.Regul.Ramps;

with Ios_Simul; use Ios_Simul;
with Ios; use Ios;



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
         Second       => true,
	 Open_Order   => V1_R1_Open_Order_Simul,
	 Close_Order  => V1_R1_Close_Order_Simul,
	 Opened       => V1_R1_Opened_Simul,
	 Closed       => V1_R1_Closed_Simul);

      Put_Line("IN Simul_Valve V1_R1  :");
      Put_Line("IN Second_3  "&Boolean'Image(Second_3));
      Put_Line("IN V1_R1_Open_Order_Simul  "&Boolean'Image(V1_R1_Open_Order_Simul));
      Put_Line("IN V1_R1_Close_Order_Simul  "&Boolean'Image(V1_R1_Close_Order_Simul));
      Put_Line("OUT Simul_Valve V1_R1 :");
      Put_Line("OUT V1_R1_Opened_Simul  "&Boolean'Image(V1_R1_Opened_Simul));
      Put_Line("OUT V1_R1_Closed_Simul  "&Boolean'Image(V1_R1_Closed_Simul));
      Put_Line("  ");
      Put_Line("  ");
      
      --  Valve V2_R1 
      
      Simul.Devices.Valves.Cyclic
        (This         => V2_R1_Simul,
         Second       => True,--est un boolean qui prend True apres 3 seceondes
	 Open_Order   => V2_R1_Open_Order_Simul,
	 Close_Order  => V2_R1_Close_Order_Simul,
	 Opened       => V2_R1_Opened_Simul,
	 Closed       => V2_R1_Closed_Simul);

      Put_Line("IN Simul_Valve V1_R1  :");
      --  Put_Line("IN Second_3  "&Boolean'Image(Second_3));
      Put_Line("IN V2_R1_Open_Order_Simul  "&Boolean'Image(V2_R1_Open_Order_Simul));
      Put_Line("IN V2_R1_Close_Order_Simul  "&Boolean'Image(V2_R1_Close_Order_Simul));
      Put_Line("OUT Simul_Valve V1_R1 :");
      Put_Line("OUT V2_R1_Opened_Simul  "&Boolean'Image(V2_R1_Opened_Simul));
      Put_Line("OUT V2_R1_Closed_Simul  "&Boolean'Image(V2_R1_Closed_Simul));
      Put_Line("  ");
      Put_Line("  ");
	
      --  Valve V1_R2
      
      Simul.Devices.Valves.Cyclic
        (This         => V1_R2_Simul,
         Second       => True,
	 Open_Order   => V1_R2_Open_Order_Simul,
	 Close_Order  => V1_R2_Close_Order_Simul,
	 Opened       => V1_R2_Opened_Simul,
	 Closed       => V1_R2_Closed_Simul);

      Put_Line("IN Simul_Valve V1_R2  :");
      Put_Line("IN Second_3  "&Boolean'Image(Second_3));
      Put_Line("IN V1_R2_Open_Order_Simul  "&Boolean'Image(V1_R2_Open_Order_Simul));
      Put_Line("IN V1_R2_Close_Order_Simul  "&Boolean'Image(V1_R2_Close_Order_Simul));
      Put_Line("OUT Simul_Valve V1_R2 :");
      Put_Line("OUT V1_R2_Opened_Simul  "&Boolean'Image(V1_R2_Opened_Simul));
      Put_Line("OUT V1_R2_Closed_Simul  "&Boolean'Image(V1_R2_Closed_Simul));
      Put_Line("  ");
      Put_Line("  ");

      --  Valve V2_R2 
      
      Simul.Devices.Valves.Cyclic
        (This         => V2_R2_Simul,
         Second       => True,
	 Open_Order   => V2_R2_Open_Order_Simul,
	 Close_Order  => V2_R2_Close_Order_Simul,
	 Opened       => V2_R2_Opened_Simul,
	 Closed       => V2_R2_Closed_Simul);

      Put_Line("IN Simul_Valve V2_R2  :");
      Put_Line("IN Second_3  "&Boolean'Image(Second_3));
      Put_Line("IN V2_R2_Open_Order_Simul  "&Boolean'Image(V2_R2_Open_Order_Simul));
      Put_Line("IN V2_R2_Close_Order_Simul  "&Boolean'Image(V2_R2_Close_Order_Simul));
      Put_Line("OUT Simul_Valve V2_R2 :");
      Put_Line("OUT V2_R2_Opened_Simul  "&Boolean'Image(V2_R2_Opened_Simul));
      Put_Line("OUT V2_R2_Closed_Simul  "&Boolean'Image(V2_R2_Closed_Simul));
      Put_Line("  ");
      Put_Line("  ");


      --  Valve V1_R3
      
      Simul.Devices.Valves.Cyclic
        (This         => V1_R3_Simul,
         Second       => True,
	 Open_Order   => V1_R3_Open_Order_Simul,
	 Close_Order  => V1_R3_Close_Order_Simul,
	 Opened       => V1_R3_Opened_Simul,
	 Closed       => V1_R3_Closed_Simul);

      Put_Line("IN Simul_Valve V1_R3  :");
      Put_Line("IN Second_3  "&Boolean'Image(Second_3));
      Put_Line("IN V1_R3_Open_Order_Simul  "&Boolean'Image(V1_R3_Open_Order_Simul));
      Put_Line("IN V1_R3_Close_Order_Simul  "&Boolean'Image(V1_R3_Close_Order_Simul));
      Put_Line("OUT Simul_Valve V1_R3 :");
      Put_Line("OUT V1_R3_Opened_Simul  "&Boolean'Image(V1_R3_Opened_Simul));
      Put_Line("OUT V1_R3_Closed_Simul  "&Boolean'Image(V1_R3_Closed_Simul));
      Put_Line("  ");
      Put_Line("  ");


      --  Valve V2_R2 
      
      Simul.Devices.Valves.Cyclic
        (This         => V2_R2_Simul,
         Second       => True,
	 Open_Order   => V2_R3_Open_Order_Simul,
	 Close_Order  => V2_R3_Close_Order_Simul,
	 Opened       => V2_R3_Opened_Simul,
	 Closed       => V2_R3_Closed_Simul);

      Put_Line("IN Simul_Valve V2_R2  :");
      Put_Line("IN Second_3  "&Boolean'Image(Second_3));
      Put_Line("IN V2_R3_Open_Order_Simul  "&Boolean'Image(V2_R3_Open_Order_Simul));
      Put_Line("IN V2_R3_Close_Order_Simul  "&Boolean'Image(V2_R3_Close_Order_Simul));
      Put_Line("OUT Simul_Valve V2_R2 :");
      Put_Line("OUT V2_R3_Opened_Simul  "&Boolean'Image(V2_R3_Opened_Simul));
      Put_Line("OUT V2_R3_Closed_Simul  "&Boolean'Image(V2_R3_Closed_Simul));
      Put_Line("  ");
      Put_Line("  ");
      
     --Pump P1

     Simul.Devices.Pumps.Cyclic
        ( Run_Order => P1_Start_Order_Simul,
          Running   => P1_Started_Simul);

      Put_Line("IN Simul_Pump P1  :");
      Put_Line("IN P1_Start_Order_Simul  "&Boolean'Image(P1_Start_Order_Simul));
      Put_Line("OUT Simul_Pump P1 :");
      Put_Line("OUT P1_Started_Simul  "&Boolean'Image(P1_Started_Simul));
      Put_Line("  ");
      Put_Line("  ");

     --Pump P2

     Simul.Devices.Pumps.Cyclic
        (Run_Order => P2_Start_Order_Simul,
	 Running   => P2_Started_Simul);

      Put_Line("IN Simul_Pump P2  :");
      Put_Line("IN P2_Start_Order_Simul  "&Boolean'Image(P2_Start_Order_Simul));
      Put_Line("OUT Simul_Pump P2 :");
      Put_Line("OUT P2_Started_Simul  "&Boolean'Image(P2_Started_Simul));
      Put_Line("  ");
      Put_Line("  ");


     --Pump P3

     Simul.Devices.Pumps.Cyclic
        (Run_Order => P3_Start_Order_Simul,
         Running   => P3_Started_Simul);

      Put_Line("IN Simul_Pump P3  :");
      Put_Line("IN P3_Start_Order_Simul  "&Boolean'Image(P3_Start_Order_Simul));
      Put_Line("OUT Simul_Pump P3 :");
      Put_Line("OUT P3_Started_Simul  "&Boolean'Image(P3_Started_Simul));
      Put_Line("  ");
      Put_Line("  ");

     --Blender

     Simul.Devices.Blenders.Cyclic
       (This      => Blender_Simul,
        Run_Order => Blender_Start_Order_Simul,
        V1_Order  => V1_Order_Simul,
        V2_Order  => V2_Order_Simul,
        Speed_1   => V1_Speed_Simul,
        Speed_2   => V2_Speed_Simul);

      Put_Line("IN Simul_Blender  :");
      Put_Line("IN Blender_Start_Order_Simul  "&Boolean'Image(Blender_Start_Order_Simul));
      Put_Line("IN V1_Order_Simul  "&Boolean'Image(V1_Order_Simul));
      Put_Line("IN V2_Order_Simul  "&Boolean'Image(V2_Order_Simul));
      Put_Line("OUT Simul_Valve V2_R2 :");
      Put_Line("OUT V1_Speed_Simul  "&Boolean'Image(V1_Speed_Simul));
      Put_Line("OUT V2_Speed_Simul  "&Boolean'Image(V2_Speed_Simul));
      Put_Line("  ");
      Put_Line("  ");
      
   end Cyclic;
   
end Simul_Tank.Main;
