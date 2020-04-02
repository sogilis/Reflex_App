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

with RxUnit.Options;      use RxUnit.Options;
with RxUnit.Test_Results; use RxUnit.Test_Results;

package RxUnit.Reporter is

   type Reporter is abstract tagged null record;

   procedure Report
     (Engine  : Reporter;
      R       : in out Result'Class;
      Options : RxUnit_Options := Default_Options) is abstract;
   --  This procedure is called by RxUnit.Run to report the result after running
   --  the whole testsuite (or the selected subset of tests).

end RxUnit.Reporter;
