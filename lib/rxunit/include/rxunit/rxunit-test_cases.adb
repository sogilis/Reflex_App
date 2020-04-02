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

with Ada.Unchecked_Conversion;
with RxUnit.Options;              use RxUnit.Options;
with RxUnit.Test_Filters;         use RxUnit.Test_Filters;

package body Rxunit.Test_Cases is

   package body Registration is separate;

   -----------------
   -- Add_Routine --
   -----------------

   procedure Add_Routine (T : in out Test_Case'Class; Val : Routine_Spec) is
   begin
      Routine_Lists.Append (T.Routines, Val);
   end Add_Routine;

   --------------
   -- Run_Test --
   --------------

   procedure Run_Test (Test : in out Test_Case) is
   begin
      Test.Routine.Routine (Test);
   end Run_Test;

   ---------
   -- Run --
   ---------

   procedure Run
     (Test    : access Test_Case;
      Options :        RxUnit.Options.RxUnit_Options;
      R       : in out Result'Class;
      Outcome :    out Status)
   is
      use Routine_Lists;
      Result : Status;
      C      : Cursor;
   begin
      Outcome := Success;
      Routine_Lists.Clear (Test.Routines);
      Register_Tests (Test_Case'Class (Test.all));

      Set_Up_Case (Test_Case'Class (Test.all));
      C := First (Test.Routines);

      while Has_Element (C) loop
         Test.Routine := Element (C);
         if Options.Filter = null
           or else Is_Active (Options.Filter.all, Test.all)
         then
            RxUnit.Simple_Test_Cases.Run
              (RxUnit.Simple_Test_Cases.Test_Case (Test.all)'Access,
               Options, R, Result);

            if Result = Failure then
               Outcome := Failure;
            end if;
         end if;

         Next (C);
      end loop;

      Tear_Down_Case (Test_Case'Class (Test.all));
   end Run;

   ------------------
   -- Routine_Name --
   ------------------

   function Routine_Name (Test : Test_Case) return Message_String is
   begin
      return Test.Routine.Routine_Name;
   end Routine_Name;

   ------------------
   --  Set_Up_Case --
   ------------------

   procedure Set_Up_Case (Test : in out Test_Case) is
      --  Default
      pragma Unreferenced (Test);
   begin
      null;
   end Set_Up_Case;

   --------------------
   -- Tear_Down_Case --
   --------------------

   procedure Tear_Down_Case (Test : in out Test_Case) is
      pragma Unreferenced (Test);
   begin
      null;
   end Tear_Down_Case;

   package body Specific_Test_Case_Registration is

      ----------------------
      -- Register_Wrapper --
      ----------------------

      procedure Register_Wrapper
        (Test    : in out Specific_Test_Case'Class;
         Routine : Specific_Test_Routine;
         Name    : String)
      is
         function Conv is
            new Ada.Unchecked_Conversion (Specific_Test_Routine, Test_Routine);
      begin
         Registration.Register_Routine
           (Test_Case'Class (Test),
            Conv (Routine),
            Name);
      end Register_Wrapper;

   end Specific_Test_Case_Registration;

end Rxunit.Test_Cases;
