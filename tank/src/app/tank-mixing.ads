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

package Tank.Filling is
   
   type Filling_Record is tagged private;
   
   type Filling_State is 
      (Init_State,
       Openning_Valves_State,
       Running_Pumps_State,
       Filling_emptying_State,
       Closing_Valves_State,
       Stopping_Pumps_State,
       Waiting_State);
   
   procedure Initialize (This : in out Filling_Record);
   
   procedure Cyclic
     (This           : in out Filling_Record;
      Start_Filling  : Boolean;
      Valves_Opened  : Boolean;
      Valves_Closed  : Boolean;
      Pumps_Started  : Boolean;  
      Level_P        : Boolean;
      Open_Valves    : out Boolean;
      Start_Pumps    : out Boolean;
      Close_Valves   : out Boolean);
   
private
   
   type Filling_Record  is tagged record
       State          : Filling_State;
   end record;
   
   No_Filling_Record : constant Filling_Record := (State => Init_State );
   
end Tank.Filling;
