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

with RxUnit.Options;
with RxUnit.Reporter;
with RxUnit.Test_Results;
with RxUnit.Test_Suites;

--  Framework using text reporter
package RxUnit.Run is

   generic
      with function Suite return RxUnit.Test_Suites.Access_Test_Suite;
   procedure Test_Runner
     (Reporter : RxUnit.Reporter.Reporter'Class;
      Options  : RxUnit.Options.RxUnit_Options := 
	RxUnit.Options.Default_Options);

   generic
      with function Suite return RxUnit.Test_Suites.Access_Test_Suite;
   procedure Test_Runner_With_Results
     (Reporter : RxUnit.Reporter.Reporter'Class;
      Results  : in out RxUnit.Test_Results.Result'Class;
      Options  : RxUnit.Options.RxUnit_Options := 
	RxUnit.Options.Default_Options);
   --  In this version, you can pass your own Result class. In particular, this
   --  can be used to extend the Result type so that for instance you can
   --  output information every time a test passed or fails.
   --  Results is not cleared before running the tests, this is your
   --  responsibility, so that you can for instance cumulate results as needed.

   generic
      with function Suite return RxUnit.Test_Suites.Access_Test_Suite;
   function Test_Runner_With_Status
     (Reporter : RxUnit.Reporter.Reporter'Class;
      Options  : RxUnit.Options.RxUnit_Options := 
	RxUnit.Options.Default_Options)
      return Status;

end RxUnit.Run;
