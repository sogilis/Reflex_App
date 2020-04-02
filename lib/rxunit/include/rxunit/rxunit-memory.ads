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

--  Provides the memory handling mechanism used by RxUnit. This allows in
--  particular RxUnit to use dynamic allocation even on limited run-times that
--  do not provide memory management.
--  See also RxUnit.Memory.Utils that provides an easy to use allocator for
--  complex objects.

with System;

package RxUnit.Memory is

   type size_t is mod 2 ** Standard'Address_Size;

   function RxUnit_Alloc (Size : size_t) return System.Address;

   procedure RxUnit_Free (Obj : System.Address);

private

   pragma Inline (RxUnit_Alloc);
   pragma Inline (RxUnit_Free);

end RxUnit.Memory;
