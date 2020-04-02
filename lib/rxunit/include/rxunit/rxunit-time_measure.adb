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

package body Rxunit.Time_Measure is

   -------------------
   -- Start_Measure --
   -------------------

   procedure Start_Measure (T : in out Time) is
   begin
      T.Start := Ada.Calendar.Clock;
   end Start_Measure;

   ------------------
   -- Stop_Measure --
   ------------------

   procedure Stop_Measure (T : in out Time) is
   begin
      T.Stop := Ada.Calendar.Clock;
   end Stop_Measure;

   -----------------
   -- Get_Measure --
   -----------------

   function Get_Measure (T : Time) return Rxunit_Duration is
      use type Ada.Calendar.Time;
   begin
      return Rxunit_Duration (T.Stop - T.Start);
   end Get_Measure;

   ---------------------
   -- Gen_Put_Measure --
   ---------------------

   procedure Gen_Put_Measure (Measure : Rxunit_Duration) is
      H, M, S  : Integer := 0;
      T        : Duration := Duration (Measure);
      Force    : Boolean;

      procedure Put (N : Integer; Length : Integer);
      --  Put N using at least Length digits.

      procedure Put (N : Integer; Length : Integer) is
      begin
         for Dig in reverse 1 .. Length - 1 loop
            if N < 10**Dig then
               Put ("0");
            else
               exit;
            end if;
         end loop;

         Put (N);
      end Put;

   begin
      --  Calculate the number of hours, minutes and seconds
      while T >= 3600.0 loop
         H := H + 1;
         T := T - 3600.0;
      end loop;

      while T >= 60.0 loop
         M := M + 1;
         T := T - 60.0;
      end loop;

      while T >= 1.0 loop
         S := S + 1;
         T := T - 1.0;
      end loop;

      --  Now display the result
      Force := False;

      if H > 0 then
         Put (H);
         Put ("h");
         Force := True;
      end if;

      if M > 0 or else Force then
         if not Force then
            Put (M);
         else
            --  In case some output is already done, then we force a 2 digits
            --  output so that the output is normalized.
            Put (M, 2);
         end if;

         Put ("min. ");
         Force := True;
      end if;

      if not Force then
         Put (S);
      else
         Put (S, 2);
      end if;

      Put (".");
      Put (Integer (T * 1_000_000.0), 6);
      Put (" sec.");
   end Gen_Put_Measure;

   --------------------------------
   -- Gen_Put_Measure_In_Seconds --
   --------------------------------

   procedure Gen_Put_Measure_In_Seconds (Measure : Rxunit_Duration) is
      S  : Integer := 0;
      T  : Duration := Duration (Measure);

      procedure Put (N : Integer; Length : Integer);
      --  Put N using at least Length digits.

      procedure Put (N : Integer; Length : Integer) is
      begin
         for Dig in reverse 1 .. Length - 1 loop
            if N < 10**Dig then
               Put ("0");
            else
               exit;
            end if;
         end loop;

         Put (N);
      end Put;

   begin

      while T >= 1.0 loop
         S := S + 1;
         T := T - 1.0;
      end loop;

      Put (S);

      Put (".");
      Put (Integer (T * 1_000_000.0), 9);
      Put ("s");
   end Gen_Put_Measure_In_Seconds;

end Rxunit.Time_Measure;
