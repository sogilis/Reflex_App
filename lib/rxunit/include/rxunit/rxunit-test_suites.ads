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

--  A collection of test cases.

with Ada.Containers;
with Ada.Containers.Doubly_Linked_Lists;
with RxUnit.Options;           use RxUnit.Options;
with RxUnit.Simple_Test_Cases; use RxUnit.Simple_Test_Cases;
with RxUnit.Tests;
with RxUnit.Test_Results;      use RxUnit.Test_Results;

package RxUnit.Test_Suites is

   type Test_Suite is new RxUnit.Tests.Test with private;
   type Access_Test_Suite is access all Test_Suite'Class;

   procedure Add_Test (S : access Test_Suite'Class;
                       T : access Test_Suite'Class);
   procedure Add_Test (S : access Test_Suite'Class;
                       T : access Test_Case'Class);
   --  Add a test case or suite to this suite

   procedure Run (Suite   : access Test_Suite;
                  Options :        RxUnit_Options;
                  R       : in out Result'Class;
                  Outcome :    out Status);
   --  Run all tests collected into this suite

   function New_Suite return Access_Test_Suite;
   --  Create a new test suite

private

   type Test_Suite_Elt_Kind is
     (TC_Elt,
      TS_Elt);

   type Test_Suite_Element (Kind : Test_Suite_Elt_Kind := TC_Elt) is record
      case Kind is
         when TC_Elt =>
            TC : Test_Case_Access;
         when TS_Elt =>
            TS : Access_Test_Suite;
      end case;
   end record;

   use Ada.Containers;

   package Test_Lists is
      new Ada.Containers.Doubly_Linked_Lists (Test_Suite_Element);
   use Test_Lists;
   --  Containers for test cases and sub-suites

   type Test_Suite is new RxUnit.Tests.Test with record
      Tests : aliased Test_Lists.List;
   end record;

end RxUnit.Test_Suites;
