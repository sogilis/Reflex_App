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

with RxClock;

package body Devices.Resistances is
  
  ----------------
  -- Initialize --
  ----------------
  
  procedure Initialize
    (This             : in out Resistance_Record;
     Kp               : Float;
     Ki               : Float;
     Kd               : Float;
     Temperature_High : Float;
     Period           : Duration) is
     
  begin
     Rx.Library.Analogs.Pid.Initialize
       (This        => This.Pid,
	Kp          => Kp,
	Ki          => Ki,
	Kd          => Kd,
	Period      => Period,
	Limit_High  => Temperature_High,
	Limit_Low   => 0.0);
     
     This.Temperature_Scale_High := Temperature_High;
  end Initialize;
    
  ------------
  -- Cyclic --
  ------------
  
  procedure Cyclic
    (This     : in out Resistance_Record;
     Run      : Boolean;
     Setpoint : Float;
     Meas     : Float;
     Cmd      : in out Float) is
     
     Setpoint_Percent : Float;
     Meas_Percent     : Float;
     Cmd_Percent      : Float := 0.0;
  begin
     Setpoint_Percent := Setpoint / This.Temperature_Scale_High;
     Meas_Percent     := Meas / This.Temperature_Scale_High;
     
      Rx.Library.Analogs.Pid.Cyclic
	(This          => This.Pid,
	 Clock         => Rxclock.Clock,
	 Run           => Run,
	 Set_Point     => Setpoint_Percent,
	 Process_Value => Meas_Percent,
	 Out_Value     => Cmd_Percent);
      
      Cmd := This.Temperature_Scale_High * Cmd_Percent;
  end Cyclic;
	
end Devices.Resistances;
