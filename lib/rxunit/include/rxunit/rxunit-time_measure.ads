------------------------------------------------------------------------------
--                                                                          --
--                         REFLEX COMPILER COMPONENTS                       --
--                                                                          --
--          Copyright (C) 2012-2020, Free Software Foundation, Inc.         --
--                                                                          --
-- Reflex is free software; you can redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware Foundation; either version 3, or (at your option) any later version --
-- Reflex is distributed in the hope that it will be useful, but WITH-      --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License --
-- for  more details.  You should have  received  a copy of the GNU General --
-- Public License distributed with Reflex; see file COPYING3. If not, go to --
-- http://www.gnu.org/licenses for a complete copy of the license.          --
--                                                                          --
-- Reflex is originally developed by Artics
------------------------------------------------------------------------------

with Ada.Calendar;

package Rxunit.Time_Measure is

   type Time is record
      Start : Ada.Calendar.Time;
      Stop  : Ada.Calendar.Time;
   end record;

   type Rxunit_Duration is private;

   Null_Time : constant Time := 
     (Start => Ada.Calendar.Time_Of (1901, 1, 1),
      Stop  => Ada.Calendar.Time_Of (1901, 1, 1));

   procedure Start_Measure (T : in out Time);
   --  Start a new measure

   procedure Stop_Measure (T : in out Time);
   --  Stop the measure

   function Get_Measure (T : Time) return Rxunit_Duration;
   --  Get the measure

   generic
      with procedure Put (I : Integer) is <>;
      with procedure Put (S : String) is <>;
   procedure Gen_Put_Measure (Measure : Rxunit_Duration);
   --  Put the image of the measure

   generic
      with procedure Put (I : Integer) is <>;
      with procedure Put (S : String) is <>;
   procedure Gen_Put_Measure_In_Seconds (Measure : rxunit_Duration);
   --  Unlike Gen_Put_Measure, puts the measure in seconds only, also puts
   --  9 digits after decimal point.

private

   type Rxunit_Duration is new Duration;

end Rxunit.Time_Measure;
