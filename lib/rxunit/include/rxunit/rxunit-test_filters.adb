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

with RxUnit.Simple_Test_Cases;  use RxUnit.Simple_Test_Cases;

package body RxUnit.Test_Filters is

   function Starts_With (Str : String; Prefix : String) return Boolean;
   --  Whether Str starts with Prefix

   -----------------
   -- Starts_With --
   -----------------

   function Starts_With (Str : String; Prefix : String) return Boolean is
   begin
      if Str'Length < Prefix'Length then
         return False;
      end if;

      return Str (Str'First .. Str'First + Prefix'Length - 1) = Prefix;
   end Starts_With;

   --------------
   -- Set_Name --
   --------------

   procedure Set_Name (Filter : in out Name_Filter; Name : String) is
   begin
      --  JMA Message_Free (Filter.Name);
      Filter.Name := Format (Name);
   end Set_Name;

   ---------------
   -- Is_Active --
   ---------------

   function Is_Active
     (Filter : Name_Filter;
      T      : RxUnit.Tests.Test'Class) return Boolean is
   begin
      if Filter.Name = null
        or else Filter.Name.all = ""
      then
         return True;
      end if;

      if T not in RxUnit.Simple_Test_Cases.Test_Case'Class
        or else Name (RxUnit.Simple_Test_Cases.Test_Case'Class (T)) = null
      then
         --  There is no name, so it doesn't match the filter
         return False;
      end if;

      if Routine_Name (RxUnit.Simple_Test_Cases.Test_Case'Class (T)) = null then
         return Starts_With
           (Name (RxUnit.Simple_Test_Cases.Test_Case'Class (T)).all,
            Filter.Name.all);
      else
         return Starts_With
           (Name (RxUnit.Simple_Test_Cases.Test_Case'Class (T)).all
            & " : "
            & Routine_Name (RxUnit.Simple_Test_Cases.Test_Case'Class (T)).all,
            Filter.Name.all);
      end if;
   end Is_Active;

end RxUnit.Test_Filters;
