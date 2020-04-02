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

--  Very simple reporter to console
package Rxunit.Reporter.Text is

   type Text_Reporter is new Reporter with private;

   procedure Set_Use_ANSI_Colors
     (Engine : in out Text_Reporter;
      Value  : Boolean);
   --  Setting this value will enable colors output on an ANSI compatible
   --  terminal.
   --  By default, no color is used.

   procedure Report (Engine  : Text_Reporter;
                     R       : in out Result'Class;
                     Options : RxUnit_Options := Default_Options);

   procedure Report_OK_Tests (Engine : Text_Reporter;
                              R      : in out Result'Class);
   procedure Report_Fail_Tests (Engine : Text_Reporter;
                                R      : in out Result'Class);
   procedure Report_Error_Tests (Engine : Text_Reporter;
                                 R      : in out Result'Class);
   --  These subprograms implement the various parts of the Report. You
   --  can therefore chose in which order to report the various categories,
   --  and whether or not to report them.
   --  After calling any of these, the list of results has been modified in
   --  R, so you should get the counts first.

private

   type Text_Reporter is new Reporter with record
      Use_ANSI : Boolean := False;
   end record;

end Rxunit.Reporter.Text;
