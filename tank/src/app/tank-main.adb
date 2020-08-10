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
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;


with Devices; use Devices;
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
     Resistances.Initialize
       (This             => Tank.Variables.Resistance,
	Kp               => Tank.Variables.Kp,
	Ki               => Tank.Variables.Ki,
	Kd               => Tank.Variables.Kd,
	Temperature_High => Tank.Variables.Temperature_Scale_High,
	Period           => Tank.Variables.Period);
     
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
      
      Filling_V_R2_Closed  :=
        V1_R2_Closed and V2_R2_Closed;

      Emptying_V_R3_Opened :=
	V1_R3_Opened and V2_R3_Opened;

      Emptying_V_R3_Closed  :=
        V1_R3_Closed and V2_R3_Closed;
      
      Blender_Started :=V1_Speed or V2_Speed;
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
      
      Put_Line("  ");
      Put_Line("   ");
      Put_Line(" ");

      Put_Line("  START CYCLE ");



     
      Put_line("Cycle.Cyclic");
      
      Tank.Cycle.Cyclic
        (This             => Cycle_Graf,
         Start_Cycle      => True,
	 End_Filling_P1   => End_Filling_P1,
	 End_Filling_P2   => End_Filling_P2,
	 End_Mixing       => End_Mixing,
	 End_Emptying     => End_Emptying,
	 Filling_P1_Order => Filling_P1_Order,--out
	 Filling_P2_Order => Filling_P2_Order,--out
	 Mixing_Order     => Mixing_Order,--out
	 Emptying_Order   => Emptying_Order,--out
         End_Cycle        => End_Cycle);--out
      Put_Line("IN Cycle.Cyclic :");
      Put_Line("IN Start_Cycle  "&Boolean'Image(Start_Cycle));
      Put_Line("IN End_Filling_P1  "&Boolean'Image(End_Filling_P1));
      Put_Line("IN End_Filling_P2  "&Boolean'Image(End_Filling_P2));
      Put_Line("IN End_Mixing  "&Boolean'Image(End_Mixing));
      Put_Line("IN End_Emptying  "&Boolean'Image(End_Emptying));
      Put_Line("OUT Cycle.Cyclic :");
      Put_Line("OUT Filling_P1_Order  "&Boolean'Image(Filling_P1_Order));
      Put_Line("OUT Filling_P2_Order  "&Boolean'Image(Filling_P2_Order));
      Put_Line("OUT Emptying_Order  "&Boolean'Image(Emptying_Order));
      Put_Line("OUT End_Cycle  "&Boolean'Image(End_Cycle));
      Put_Line("  ");
      Put_Line("  ");

         
      --  Filling
           
      Tank.Filling.Cyclic
	(This           => Filling_P1_Graf,
	 Start_Filling  => Filling_P1_Order,
	 Valves_Opened  => Filling_V_R1_Opened,
	 Valves_Closed  => Filling_V_R1_Closed,
	 Pumps_Started  => P1_Started,
	 Level_P        => True, -- Level_P        => Tank_Medium_Level,
	 Open_Valves    => Filling_Open_V_R1,--out
	 Start_Pumps    => Filling_Start_P1,--out
         Close_Valves   => Filling_Close_V_R1,
 	 End_Filling    => End_Filling_P1);--out
      
      Put_Line("IN Filling_P1 :");
      Put_Line("IN Filling_P1_Order  "&Boolean'Image(Filling_P1_Order));
      Put_Line("IN Filling_V_R1_Opened  "&Boolean'Image(Filling_V_R1_Opened));
      Put_Line("IN Filling_V_R1_Closed  "&Boolean'Image(Filling_V_R1_Closed));
      Put_Line("IN P1_Started  "&Boolean'Image(P1_Started));
      --Put_Line("IN Tank_Medium_Level  "&Boolean'Image(Tank_Medium_Level));
      Put_Line("OUT Filling_P1 :");
      Put_Line("OUT Filling_Open_V_R1  "&Boolean'Image(Filling_Open_V_R1));
      Put_Line("OUT Filling_Start_P1  "&Boolean'Image(Filling_Start_P1));
      Put_Line("OUT Filling_Close_V_R1  "&Boolean'Image(Filling_Close_V_R1));
      Put_Line("OUT End_Filling_P1  "&Boolean'Image(End_Filling_P1));

      Put_Line("  ");
      Put_Line("  ");
      
      Tank.Filling.Cyclic
	(This           => Filling_P2_Graf,
	 Start_Filling  => Filling_P2_Order,
	 Valves_Opened  => Filling_V_R2_Opened,
	 Valves_Closed  => Filling_V_R2_Closed,
	 Pumps_Started  => P2_Started,
	 Level_P        => True, --Tank_High_Level,
	 Open_Valves    => Filling_Open_V_R2,--out
	 Start_Pumps    => Filling_Start_P2,--out
         Close_Valves   => Filling_Close_V_R2,
         End_Filling    => End_Filling_P2);--out
      
      Put_Line("IN Filling_P2 :");
      Put_Line("IN Filling_P2_Order  "&Boolean'Image(Filling_P2_Order));
      Put_Line("IN Filling_V_R2_Opened  "&Boolean'Image(Filling_V_R2_Opened));
      Put_Line("IN Filling_V_R2_Closed  "&Boolean'Image(Filling_V_R2_Closed));
      Put_Line("IN P2_Started  "&Boolean'Image(P2_Started));
      --Put_Line("IN Tank_High_Level  "&Boolean'Image(Tank_High_Level));
      Put_Line("OUT Filling_P2 :");
      Put_Line("OUT Filling_Open_V_R2  "&Boolean'Image(Filling_Open_V_R2));
      Put_Line("OUT Filling_Start_P2  "&Boolean'Image(Filling_Start_P2));
      Put_Line("OUT Filling_Close_V_R2  "&Boolean'Image(Filling_Close_V_R2));
      Put_Line("OUT End_Filling_P2  "&Boolean'Image(End_Filling_P2));

      Put_Line("  ");
      Put_Line("  ");
      
      --  Mixing
      
      Tank.Mixing.Cyclic
	(This             => Mixing_Graf,
	 Start_Mixing     => Mixing_Order,
         Blender_Started  => Blender_Started,
	 Mixing_Duration  => Mixing_Duration,
	 Start_Blender    => Mixing_Start_Blender,--on met des variable intermédiaire pour pour les sorties pour plus d'option sur  la fonction post
	 Start_Resistance => Mixing_Start_Resistance,--out
	 End_Mixing       => End_Mixing);--out

      Put_Line("IN Mixing :");
      Put_Line("IN Mixing_Order  "&Boolean'Image(Mixing_Order));
      Put_Line("IN Blender_Started  "&Boolean'Image(Blender_Started));
      Put_Line("IN Mixing_Duration  "&Integer'Image(Mixing_Duration));
      Put_Line("OUT Mixing :");
      Put_Line("OUT Mixing_Start_Blender  "&Boolean'Image(Mixing_Start_Blender));
      Put_Line("OUT Mixing_Start_Resistance  "&Boolean'Image(Mixing_Start_Resistance));
      Put_Line("OUT End_Mixing  "&Boolean'Image(End_Mixing));
      Put_Line("  ");
      Put_Line("  ");
      
      -- Emptying
         Tank.Filling.Cyclic
	(This           => Emptying_Graf,
	 Start_Filling  => Emptying_Order,
	 Valves_Opened  => Emptying_V_R3_Opened,
	 Valves_Closed  => Emptying_V_R3_Closed,
	 Pumps_Started  => P3_Started,
	 Level_P        => True,--Tank_Low_Level,
	 Open_Valves    => Emptying_Open_V_R3,--out
	 Start_Pumps    => Emptying_Start_P3,--out
         Close_Valves   => Emptying_Close_V_R3,--out
         End_Filling    => End_Emptying);
      
      Put_Line("IN Emptyin :");
      Put_Line("IN Emptying_Order  "&Boolean'Image(Emptying_Order));
      Put_Line("IN Emptying_V_R3_Opened  "&Boolean'Image(Emptying_V_R3_Opened));
      Put_Line("IN Emptying_V_R3_Closed  "&Boolean'Image(Emptying_V_R3_Closed));
      Put_Line("IN P3_Started  "&Boolean'Image(P3_Started));
      --Put_Line("IN Tank_Low_Level  "&Boolean'Image(Tank_Low_Level));
      Put_Line("OUT Emptyin :");
      Put_Line("OUT Emptying_Open_V_R3  "&Boolean'Image(Emptying_Open_V_R3));
      Put_Line("OUT Emptying_Start_P3  "&Boolean'Image(Emptying_Start_P3));
      Put_Line("OUT Emptying_Close_V_R3  "&Boolean'Image(Emptying_Close_V_R3));
      Put_Line("OUT End_Emptying  "&Boolean'Image(End_Emptying));

      Put_Line("  ");
      Put_Line("  ");
      
      
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
      
      Put_Line("IN Valve V1_R1  :");
      Put_Line("IN Filling_Open_V_R1  "&Boolean'Image(Filling_Open_V_R1));
      Put_Line("IN Filling_Close_V_R1  "&Boolean'Image(Filling_Close_V_R1));
      Put_Line("IN V1_R1_Opened  "&Boolean'Image(V1_R1_Opened));
      Put_Line("IN V1_R1_Closed  "&Boolean'Image(V1_R1_Closed));
      Put_Line("OUT Valve V1_R1 :");
      Put_Line("OUT V1_R1_Open_Order  "&Boolean'Image(V1_R1_Open_Order));
      Put_Line("OUT V1_R1_Close_Order  "&Boolean'Image(V1_R1_Close_Order));
      Put_Line("  ");
      Put_Line("  ");
    
      --  Valve V2_R1 

      Devices.Valves.Cyclic
	(This        => V2_R1,
	 Open        => Filling_Open_V_R1,
	 Close       => Filling_Close_V_R1,
	 Opened      => V2_R1_Opened,
	 Closed      => V2_R1_Closed,
	 Open_Order  => V2_R1_Open_Order,
         Close_Order => V2_R1_Close_Order);
      
      Put_Line("IN Valve V2_R1  :");
      Put_Line("IN Filling_Open_V_R1  "&Boolean'Image(Filling_Open_V_R1));
      Put_Line("IN Filling_Close_V_R1  "&Boolean'Image(Filling_Close_V_R1));
      Put_Line("IN V2_R1_Opened  "&Boolean'Image(V2_R1_Opened));
      Put_Line("IN V2_R1_Closed  "&Boolean'Image(V2_R1_Closed));
      Put_Line("OUT Valve V2_R1 :");
      Put_Line("OUT V2_R1_Open_Order  "&Boolean'Image(V2_R1_Open_Order));
      Put_Line("OUT V2_R1_Close_Order  "&Boolean'Image(V2_R1_Close_Order));
      Put_Line("  ");
      Put_Line("  ");
      
    --  Valve V1_R2 
   
      Devices.Valves.Cyclic
	(This         => V1_R2,
	 Open         => Filling_Open_V_R2,
	 Close        => Filling_Close_V_R2,
	 Opened       => V1_R2_Opened,
	 Closed       => V1_R2_Closed,
	 Open_Order   => V1_R2_Open_Order,
         Close_Order  => V1_R2_Close_Order);
      
      Put_Line("IN Valve V1_R2  :");
      Put_Line("IN Filling_Open_V_R2  "&Boolean'Image(Filling_Open_V_R2));
      Put_Line("IN Filling_Close_V_R2  "&Boolean'Image(Filling_Close_V_R2));
      Put_Line("IN V1_R2_Opened  "&Boolean'Image(V1_R2_Opened));
      Put_Line("IN V1_R2_Closed  "&Boolean'Image(V1_R2_Closed));
      Put_Line("OUT Valve V1_R2 :");
      Put_Line("OUT V1_R2_Open_Order  "&Boolean'Image(V1_R2_Open_Order));
      Put_Line("OUT V1_R2_Close_Order  "&Boolean'Image(V1_R2_Close_Order)); 
      Put_Line("  ");
      Put_Line("  ");

      --  Valve V2_R2 
      
      Devices.Valves.Cyclic
	(This         => V2_R2,
	 Open         => Filling_Open_V_R2,
	 Close        => Filling_Close_V_R2,
	 Opened       => V2_R2_Opened,
	 Closed       => V2_R2_Closed,
	 Open_Order   => V2_R2_Open_Order,
         Close_Order  => V2_R2_Close_Order);
      
      Put_Line("IN Valve V2_R2  :");
      Put_Line("IN Filling_Open_V_R2  "&Boolean'Image(Filling_Open_V_R2));
      Put_Line("IN Filling_Close_V_R2  "&Boolean'Image(Filling_Close_V_R2));
      Put_Line("IN V2_R2_Opened  "&Boolean'Image(V2_R2_Opened));
      Put_Line("IN V2_R2_Closed  "&Boolean'Image(V2_R2_Closed));
      Put_Line("OUT Valve V2_R2 :");
      Put_Line("OUT V2_R2_Open_Order  "&Boolean'Image(V2_R2_Open_Order));
      Put_Line("OUT V2_R2_Close_Order  "&Boolean'Image(V2_R2_Close_Order));
      Put_Line("  ");
      Put_Line("  ");
      
      --  Valve V1_R3
     
      Devices.Valves.Cyclic
	(This         => V1_R3,
	 Open         => Emptying_Open_V_R3,
	 Close        => Emptying_Close_V_R3,
	 Opened       => V1_R3_Opened,
	 Closed       => V1_R3_Closed,
	 Open_Order   => V1_R3_Open_Order,
         Close_Order  => V1_R3_Close_Order);
      
      Put_Line("IN Valve V1_R3  :");
      Put_Line("IN Emptying_Open_V_R3  "&Boolean'Image(Emptying_Open_V_R3));
      Put_Line("IN Emptying_Close_V_R3  "&Boolean'Image(Emptying_Close_V_R3));
      Put_Line("IN V1_R3_Opened  "&Boolean'Image(V1_R3_Opened));
      Put_Line("IN V1_R3_Closed  "&Boolean'Image(V1_R3_Closed));
      Put_Line("OUT Valve V1_R3 :");
      Put_Line("OUT V1_R3_Open_Order  "&Boolean'Image(V1_R3_Open_Order));
      Put_Line("OUT V1_R3_Close_Order  "&Boolean'Image(V1_R3_Close_Order)); 
      Put_Line("  ");
      Put_Line("  ");
      
      --  Valve V2_R3 
      
      Devices.Valves.Cyclic
	(This         => V2_R3,
	 Open         => Emptying_Open_V_R3,
	 Close        => Emptying_Close_V_R3,
	 Opened       => V2_R3_Opened,
	 Closed       => V2_R3_Closed,
	 Open_Order   => V2_R3_Open_Order,
         Close_Order  => V2_R3_Close_Order);
      
      Put_Line("IN Valve V2_R3  :");
      Put_Line("IN Emptying_Open_V_R3  "&Boolean'Image(Emptying_Open_V_R3));
      Put_Line("IN Emptying_Close_V_R3  "&Boolean'Image(Emptying_Close_V_R3));
      Put_Line("IN V2_R3_Opened  "&Boolean'Image(V2_R3_Opened));
      Put_Line("IN V2_R3_Closed  "&Boolean'Image(V2_R3_Closed));
      Put_Line("OUT Valve V2_R3 :");
      Put_Line("OUT V2_R3_Open_Order  "&Boolean'Image(V2_R3_Open_Order));
      Put_Line("OUT V2_R3_Close_Order  "&Boolean'Image(V2_R3_Close_Order));
      Put_Line("  ");
      Put_Line("  ");
      
      --Pump P1

     Devices.Pumps.Cyclic
        (This      => P1,
         Run       => Filling_Start_P1,
         Running   => P1_Started,
         Run_Order => P1_Start_Order);
      
      Put_Line("IN Pump P1  :");
      Put_Line("IN Filling_Start_P1  "&Boolean'Image(Filling_Start_P1));
      Put_Line("IN P1_Started  "&Boolean'Image(P1_Started));
      Put_Line("OUT Pump P1  :");
      Put_Line("OUT P1_Start_Order  "&Boolean'Image(P1_Start_Order));
      Put_Line("  ");
      Put_Line("  ");

     --Pump P2

     Devices.Pumps.Cyclic
        (This      => P2,
         Run       => Filling_Start_P2,
         Running   => P2_Started,
         Run_Order => P2_Start_Order);

      Put_Line("IN Pump P1  :");
      Put_Line("IN Filling_Start_P2  "&Boolean'Image(Filling_Start_P2));
      Put_Line("IN P2_Started  "&Boolean'Image(P2_Started));
      Put_Line("OUT Pump P1  :");
      Put_Line("OUT P2_Start_Order  "&Boolean'Image(P2_Start_Order));
      Put_Line("  ");
      Put_Line("  ");

      --Pump P3

     Devices.Pumps.Cyclic
        (This      => P3,
         Run       => Emptying_Start_P3,
         Running   => P3_Started,
         Run_Order => P3_Start_Order);
      
      Put_Line("IN Pump P3  :");
      Put_Line("IN Emptying_Start_P3  "&Boolean'Image(Emptying_Start_P3));
      Put_Line("IN P3_Started  "&Boolean'Image(P3_Started));
      Put_Line("OUT Pump P1  :");
      Put_Line("OUT P3_Start_Order  "&Boolean'Image(P3_Start_Order));
      Put_Line("  ");
      Put_Line("  ");

     --Blender

     Devices.Blenders.Cyclic
        (This      => Blender,
         Run       => Mixing_Start_Blender,
         Speed_2   => V2_Speed,
         Run_Order => Blender_Start_Order,
         v2_Order  => V2_Order);
      
      Put_Line("IN Blender :");
      Put_Line("IN Mixing_Start_Blender  "&Boolean'Image(Mixing_Start_Blender));
      Put_Line("IN V1_Speed  "&Boolean'Image(V1_Speed));
      Put_Line("IN V2_Speed  "&Boolean'Image(V2_Speed));
      Put_Line("OUT Blender  :");
      Put_Line("OUT Blender_Start_Order  "&Boolean'Image(Blender_Start_Order));
      Put_Line("OUT V1_Order  "&Boolean'Image(V1_Order));
      Put_Line("OUT V2_Order  "&Boolean'Image(V2_Order));
      Put_Line("  ");
      Put_Line("  ");
      
      --Regulateur
      
     Regul.Ramps.Ramp
        (Second     =>  Second,
         T_sensor   => T_Measured,
         Set_Point  => Resistance_SetPoint,
         Gradient   => Gradient, --Per minute
         Tmax       => Tmax,
         T_Adjusted => T_Adjusted);
      
      Put_Line("IN Regulateur :");
      Put_Line("IN Second  "&Boolean'Image(Second));
      Put_Line("IN T_Measured  "&Float'Image(T_Measured));
      Put_Line("IN Resistance_SetPoint  "&Float'Image(Resistance_SetPoint));
      Put_Line("IN Gradient  "&Float'Image(Gradient));
      Put_Line("IN Tmax  "&Float'Image(Tmax));
      Put_Line("OUT Regulateur  :");
      Put_Line("OUT T_Adjusted  "&Float'Image(T_Adjusted));
      Put_Line("  ");
      Put_Line("  ");
      
      --Resistance
   
   
     Devices.Resistances.Cyclic
     (This       => Resistance,
      Run        => Mixing_Start_Blender,
      Setpoint   => T_Adjusted,
      Meas       => Temp_Meas,
      Cmd        => Pid_Temp_Adjust);

      Put_Line("IN Resistance :");
      Put_Line("IN Mixing_Start_Blender  "&Boolean'Image(Mixing_Start_Blender));
      Put_Line("IN T_Adjusted  "&Float'Image(T_Adjusted));
      Put_Line("IN Pid_Temp_Adjust  "&Float'Image(Pid_Temp_Adjust));
      Put_Line("  ");
      Put_Line("  ");


      --  Post Treatment

      
      
      --  Update Outputs
      
   end Cyclic;
   
end Tank.Main;
