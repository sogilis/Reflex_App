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

--  Memory allocation implementation using the gnat runtime methods.

package body RxUnit.Memory is

   -----------
   -- Alloc --
   -----------

   function RxUnit_Alloc (Size : size_t) return System.Address is
      function RT_Malloc (Size : size_t) return System.Address;
      pragma Import (C, RT_Malloc, "__gnat_malloc");
   begin
      return RT_Malloc (Size);
   end RxUnit_Alloc;

   ----------
   -- Free --
   ----------

   procedure RxUnit_Free (Obj : System.Address) is
      procedure RT_Free (Obj : System.Address);
      pragma Import (C, RT_Free, "__gnat_free");
   begin
      RT_Free (Obj);
   end RxUnit_Free;

end RxUnit.Memory;
