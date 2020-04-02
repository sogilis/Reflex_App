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

with RxUnit.Assertions;   use RxUnit.Assertions;
with RxUnit.Options;      use RxUnit.Options;
with RxUnit.Test_Filters; use RxUnit.Test_Filters;

package body RxUnit.Simple_Test_Cases is

   procedure Run_Routine
     (Test    : access Test_Case'Class;
      Options :        RxUnit_Options;
      R       : in out Result'Class;
      Outcome :    out Status);
   --  Run one test routine

   -----------------
   -- Run_Routine --
   -----------------

   procedure Run_Routine
     (Test    : access Test_Case'Class;
      Options :        RxUnit_Options;
      R       : in out Result'Class;
      Outcome :    out Status) is separate;

   ------------------
   -- Routine_Name --
   ------------------

   function Routine_Name (Test : Test_Case) return Message_String is
      pragma Unreferenced (Test);
   begin
      return null;
   end Routine_Name;

   ------------
   -- Set_Up --
   ------------

   procedure Set_Up (Test : in out Test_Case) is
      pragma Unreferenced (Test);
   begin
      null;
   end Set_Up;

   ---------------
   -- Tear_Down --
   ---------------

   procedure Tear_Down (Test : in out Test_Case) is
      pragma Unreferenced (Test);
   begin
      null;
   end Tear_Down;

   ---------
   -- Run --
   ---------

   procedure Run
     (Test    : access Test_Case;
      Options :        RxUnit_Options;
      R       : in out Result'Class;
      Outcome :    out Status)
   is
      Old : constant Test_Access := RxUnit.Assertions.Current_Test;
   begin
      Outcome := Success;
      if Options.Filter = null
        or else Is_Active (Options.Filter.all, Test.all)
      then
         RxUnit.Assertions.Set_Current_Test (Test_Access (Test));
         Init_Test (Test.all);
         Start_Test (R, 1);

         --  Run test routine
         Set_Up (Test_Case'Class (Test.all));
         Run_Routine (Test, Options, R, Outcome);
         Tear_Down (Test_Case'Class (Test.all));
         RxUnit.Assertions.Set_Current_Test (Old);
      end if;
   end Run;

end RxUnit.Simple_Test_Cases;
