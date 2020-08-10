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

with Ada.Text_Io; use Ada.Text_Io;
with Rxclock; use Rxclock;

with Tank.Main; use Tank.Main;

procedure Run_Tank is
begin
   Tank.Main.Initialize;
   Rxclock.Set_Clock (0.0);
   Rxclock.Set_Tick (0.1);
   
   while True loop
      Put_Line ("==========> Clock : " & Rxclock.Clock'Img);
      Tank.Main.Cyclic;
      delay 0.1;
      Rxclock.Update_Clock;
   end loop;
end Run_Tank;
   
