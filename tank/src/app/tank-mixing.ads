------------------------------------------------------------------------------
--                                                                          --
--                         REFLEX EXAMPLES                                  --
--                                                                          --
--          Copyright (C) 1992-2011, Free Software Foundation, Inc.         --
--                                                                          --
-- Reflex is free software; you can redistribute it  and/or modify it under --
-- terms of the  GNU General Public Licensea as published  by the Free Soft- --
-- ware Foundation; either version 3, or (at your option) any later version --
-- Reflex is distributed in the hope that it will be useful, but WITH-      --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License --
-- for  more details.  You should have  received  a copy of the GNU General --
-- Public License distributed with Reflex; see file COPYING3. If not, go to --
-- http://www.gnu.org/licenses for a complete copy of the license.          --
--                                                                          --
-- Reflex is originally developed  by the Artics team at Grenoble.          --
--                                                                          --
------------------------------------------------------------------------------

package Tank.Mixing is
   
   type Mixing_Record is tagged private;
   
   type Mixing_State is 
      (Init_State,
       Mixing_State,
       End_Mixing_State);
   
   procedure Initialize (This : in out Filling_Record);
   
   procedure Cyclic
     (This             : in out Filling_Record;
      Start_Mixing     : Boolean;
      Mixing_Duration  : Initeger;
      Second           : Integer;
      Start_Blender    : out Boolean;
      Start_Resistance : out Boolean;
      End_Mixing       : out Boolean);
   
private
   
   type Mixing_Record  is tagged record
      State           : Mixing_State;
      Mising_Duration : Integer;
   end record;
   
   No_Mixing_Record : constant Mixing_Record := (State => Init_State );
   
end Tank.Mixing;
