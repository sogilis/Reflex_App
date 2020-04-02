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

with RxUnit.Time_Measure;
with RxUnit.Test_Suites; use RxUnit.Test_Suites;

package body RxUnit.Run is

   procedure Run
     (Suite    : Access_Test_Suite;
      Results  : in out Test_Results.Result'Class;
      Options  : RxUnit.Options.RxUnit_Options;
      Reporter : RxUnit.Reporter.Reporter'Class;
      Outcome  : out Status);
   --  Run a specific testsuite and return its status

   ---------
   -- Run --
   ---------

   procedure Run
     (Suite    : Access_Test_Suite;
      Results  : in out Test_Results.Result'Class;
      Options  : RxUnit.Options.RxUnit_Options;
      Reporter : RxUnit.Reporter.Reporter'Class;
      Outcome  : out Status)
   is
      Time    : Time_Measure.Time;

   begin
      if Options.Global_Timer then
         Time_Measure.Start_Measure (Time);
      end if;

      pragma Warnings (Off);
      RxUnit.Test_Suites.Run (Suite, Options, Results, Outcome);
      pragma Warnings (On);

      if Options.Global_Timer then
         Time_Measure.Stop_Measure (Time);
         Test_Results.Set_Elapsed (Results, Time);
      end if;

      RxUnit.Reporter.Report (Reporter, Results, Options);
   end Run;

   -----------------
   -- Test_Runner --
   -----------------

   procedure Test_Runner
     (Reporter : RxUnit.Reporter.Reporter'Class;
      Options  : RxUnit.Options.RxUnit_Options := RxUnit.Options.Default_Options)
   is
      Results : Test_Results.Result;
      Outcome : Status;
      pragma Unreferenced (Outcome);
   begin
      Test_Results.Clear (Results);
      Run (Suite, Results, Options, Reporter, Outcome);
   end Test_Runner;

   -----------------------------
   -- Test_Runner_With_Status --
   -----------------------------

   function Test_Runner_With_Status
     (Reporter : RxUnit.Reporter.Reporter'Class;
      Options  : RxUnit.Options.RxUnit_Options := RxUnit.Options.Default_Options)
      return Status
   is
      Results : Test_Results.Result;
      Outcome : Status;
   begin
      Test_Results.Clear (Results);
      Run (Suite, Results, Options, Reporter, Outcome);
      return Outcome;
   end Test_Runner_With_Status;

   ------------------------------
   -- Test_Runner_With_Results --
   ------------------------------

   procedure Test_Runner_With_Results
     (Reporter : RxUnit.Reporter.Reporter'Class;
      Results  : in out RxUnit.Test_Results.Result'Class;
      Options  : RxUnit.Options.RxUnit_Options := 
	RxUnit.Options.Default_Options)
   is
      Outcome : Status;
      pragma Unreferenced (Outcome);
   begin
      Run (Suite, Results, Options, Reporter, Outcome);
   end Test_Runner_With_Results;

end RxUnit.Run;
