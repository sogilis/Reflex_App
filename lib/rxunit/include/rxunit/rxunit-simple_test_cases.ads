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

--  This type is used to implement a simple test case: define a derived type
--  that overrides the Run_Test and Name methods.
--
--  You don't usually need to use that type, but Test_Fixture/Test_Caller
--  or Test_Case instead.

with RxUnit.Assertions;
with RxUnit.Options;
with RxUnit.Test_Results; use RxUnit.Test_Results;

package Rxunit.Simple_Test_Cases is

   type Test_Case is abstract new RxUnit.Assertions.Test with private;
   type Test_Case_Access is access all Test_Case'Class;

   function Name (Test : Test_Case) return Message_String is abstract;
   --  Test case name

   function Routine_Name (Test : Test_Case) return Message_String;
   --  Routine name. By default return a null Message_String

   procedure Run_Test
     (Test          : in out Test_Case) is abstract;
   --  Perform the test.

   procedure Set_Up (Test : in out Test_Case);
   --  Set up performed before each test

   procedure Tear_Down (Test : in out Test_Case);
   --  Tear down performed after each test

   ----------------------------------------------
   --  Below are internal routines. Do not use --
   ----------------------------------------------

   procedure Run (Test    : access Test_Case;
                  Options :        RxUnit.Options.RxUnit_Options;
                  R       : in out Result'Class;
                  Outcome :    out Status);
   --  Run test case. Do not override

private

   type Test_Case is abstract new RxUnit.Assertions.Test with null record;

end Rxunit.Simple_Test_Cases;
