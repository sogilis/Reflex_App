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

with Ada.Exceptions; use Ada.Exceptions;

with GNAT.Traceback.Symbolic; use GNAT.Traceback.Symbolic;

with Rxunit.Time_Measure;

separate (Rxunit.Simple_Test_Cases)

--  Version for run-time libraries that support exception handling
procedure Run_Routine
  (Test    : access Test_Case'Class;
   Options :        Rxunit.Options.Rxunit_Options;
   R       : in out Result'Class;
   Outcome :    out Status)
is
   Unexpected_Exception : Boolean := False;
   Time : Time_Measure.Time := Time_Measure.Null_Time;

   use Time_Measure;

begin

   --  Reset failure list to capture failed assertions for one routine

   Clear_Failures (Test.all);

   begin
      if Options.Test_Case_Timer then
         Start_Measure (Time);
      end if;

      Run_Test (Test.all);

      if Options.Test_Case_Timer then
         Stop_Measure (Time);
      end if;

   exception
      when Assertion_Error =>
         if Options.Test_Case_Timer then
            Stop_Measure (Time);
         end if;

      when E : others =>
         if Options.Test_Case_Timer then
            Stop_Measure (Time);
         end if;

         Unexpected_Exception := True;
         Add_Error
           (R,
            Name (Test.all),
            Routine_Name (Test.all),
            Error => (Exception_Name    => Format (Exception_Name (E)),
                      Exception_Message => Format (Exception_Message (E)),
                      Traceback         => Format (Symbolic_Traceback (E))),
            Elapsed => Time);
   end;

   if not Unexpected_Exception and then not Has_Failures (Test.all) then
      Outcome := Success;
      Add_Success (R, Name (Test.all), Routine_Name (Test.all), Time);
   else
      Outcome := Failure;
      declare
         C : Failure_Iter := First_Failure (Test.all);
      begin
         while Has_Failure (C) loop
            Add_Failure (R,
                         Name (Test.all),
                         Routine_Name (Test.all),
                         Get_Failure (C),
                         Time);
            Next (C);
         end loop;
      end;
   end if;

end Run_Routine;
