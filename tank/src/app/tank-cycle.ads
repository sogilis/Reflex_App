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

package Tank.Cycle is
   
   type Cycle_Record is tagged private;
   
   type Cycle_State is
   (Init_State,
    Filling_State,
    Mixing_State,
    Emptying_State,
    End_Cycle);
   
   procedure Initialize (This : in out Cycle_Record);
   
   procedure Cyclic
     (This           : in out Cycle_Record;
      Start          : in Boolean;
      End_Filling    : Boolean;
      End_Mixing     : Boolean;
      End_Emptying   : Boolean;
      Filling_Order  : out Boolean;
      Mixing_Order   : out Boolean;
      Emptying_Order : out Boolean;
      End_Cycle      : out Boolean);
   
private
   
   type Cycle_Record is tagged record
      State : Cycle_State;
   end record;
   
   No_Cycle_Record : constant Cycle_Record := (State => Init_State);
   
end Tank.Cycle;
