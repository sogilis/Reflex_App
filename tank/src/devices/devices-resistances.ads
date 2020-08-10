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

with Rx.Library.Analogs.PID;

package Devices.Resistances is
  
  
   type Resistance_Record is tagged private;

  procedure Initialize
    (This             : in out Resistance_Record;
     Kp               : Float;
     Ki               : Float;
     Kd               : Float;
     Temperature_High : Float;
     Period           : Duration);
    
  procedure Cyclic
    (This     : in out Resistance_Record;
     Run      : Boolean;
     Setpoint : Float;
     Meas     : Float;
     Cmd      : in out Float);
  
private
   
   type Resistance_Record is tagged record
      Temperature_Scale_High : Float;
      
      Pid : Rx.Library.Analogs.Pid.Pid_Record;
   end record;
     
end Devices.Resistances;
