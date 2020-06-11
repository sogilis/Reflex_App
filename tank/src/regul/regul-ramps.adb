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

package body Regul.Ramps is
   
   procedure Ramp
     (Second      : in Boolean;
      T_sensor    : in Float;
      Set_Point   : in Float;
      Gradient    : in Float; --Per minute
      Tmax        : in Float;
      T_Adjusted  : out Float) is
      
      Adjust : float := T_Sensor;
   begin
      if Second and T_Sensor /= Set_Point then
         Adjust := T_Sensor + Gradient / 60.0;
      end if;
      
      if (Adjust/Set_Point)*100.0 > Tmax Then
        Adjust := Tmax;  
     end if;
     
     T_Adjusted:=(Adjust/Set_Point)*100.0;
   end Ramp;
   
end Regul.Ramps;
