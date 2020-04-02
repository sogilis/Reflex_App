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

--  An instance of a test filter.
--  This can be created from command line arguments, for instance, so that
--  users can decide to run specific tests only, as opposed to the whole
--  test suite.

with RxUnit.Tests;

package RxUnit.Test_Filters is

   type Test_Filter is abstract tagged limited private;
   type Test_Filter_Access is access all Test_Filter'Class;
   function Is_Active
     (Filter : Test_Filter;
      T      : RxUnit.Tests.Test'Class) return Boolean is abstract;
   --  Whether we should run the given test. If this function returns False,
   --  the test is not run.

   type Name_Filter is new Test_Filter with private;
   --  A filter based on the name of the test and/or routine.

   procedure Set_Name
     (Filter : in out Name_Filter; Name : String);
   --  Set the name of the test(s) to run.
   --  The name can take several forms:
   --     * Either the fully qualified name of the test (including routine).
   --       For instance, if you have an instance of
   --       RxUnit.Test_Cases.Test_Case, the name could be:
   --          Name (Test) & " : " & Routine_Name (Test)
   --     * Or a partial name, that matches the start of the test_name. With
   --       the example above, you could chose to omit the routine_name to run
   --       all routines for instance
   --  If the name is the empty string, all tests will be run

   function Is_Active
     (Filter : Name_Filter;
      T      : RxUnit.Tests.Test'Class) return Boolean;
   --  See inherited documentation

private
   type Test_Filter is abstract tagged limited null record;

   type Name_Filter is new Test_Filter with record
      Name : Message_String;
   end record;

end RxUnit.Test_Filters;
