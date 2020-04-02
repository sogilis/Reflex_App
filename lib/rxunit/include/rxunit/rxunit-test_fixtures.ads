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

--  <description>
--  A Test_Fixture is used to provide a common environment for a set of test
--  cases.
--
--  To define a test case from a test fixture, see RxUnit.Test_Caller.
--
--  Each test runs in its own fixture so there can be no side effects among
--  test runs.
--
--  Here is an example:
--
--  <code>
--  package Math_Test is
--     Type Test is new RxUnit.Test_Fixtures.Test_Fixture with record
--        M_Value1 : Integer;
--        M_Value2 : Integer;
--     end record;
--
--     procedure Set_Up (T : in out Test);
--
--     procedure Test_Addition (T : in out Test);
--
--  end Math_Test;
--
--  package body Math_Test is
--
--     procedure Set_Up (T : in out Test) is
--     begin
--        T.M_Value1 := 2;
--        T.M_Value2 := 3;
--     end Set_Up;
--
--     procedure Test_Addition (T : in out Test) is
--     begin
--        Assert (T.M_Value1 + T.M_Value2 = 5,
--                "Incorrect addition for integers");
--     end Test_Addition;
--
--  end Math_Test;
--  </code>
--  </description>

with RxUnit.Assertions;

package RxUnit.Test_Fixtures is

   type Test_Fixture is new RxUnit.Assertions.Test with private;

   procedure Set_Up (Test : in out Test_Fixture);
   --  Set up performed before each test case

   procedure Tear_Down (Test : in out Test_Fixture);
   --  Tear down performed after each test case

private

   type Test_Fixture is new RxUnit.Assertions.Test with null record;

end RxUnit.Test_Fixtures;
