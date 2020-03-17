
-----------------------------------------------------------------------
--                       Reflex Run Time                             --
--                           Clock                                   --
--                                                                   --
--              Copyright (C) 2012-2014, Artics                      --
--                                                                   --
-- This library is free software; you can redistribute it and/or     --
-- modify it under the terms of the GNU General Public               --
-- License as published by the Free Software Foundation; either      --
-- version 2 of the License, or (at your option) any later version.  --
--                                                                   --
-- This library is distributed in the hope that it will be useful,   --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of    --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU --
-- General Public License for more details.                          --
--                                                                   --
-- You should have received a copy of the GNU General Public         --
-- License along with this library; if not, write to the             --
-- Free Software Foundation, Inc., 59 Temple Place - Suite 330,      --
-- Boston, MA 02111-1307, USA.                                       --
--                                                                   --
-- As a special exception, if other files instantiate generics from  --
-- this unit, or you link this unit with other files to produce an   --
-- executable, this  unit  does not  by itself cause  the resulting  --
-- executable to be covered by the GNU General Public License. This  --
-- exception does not however invalidate any other reasons why the   --
-- executable file  might be covered by the  GNU Public License.     --
-----------------------------------------------------------------------

package body Rxrt.RxClock is
   
   -----------
   -- Clock --
   -----------
   
   function Clock return Duration is
   begin
      return The_Clock;
   end Clock;
   
   ---------------
   -- Set_Clock --
   ---------------
   
   procedure Set_Clock (C : Duration) is
   begin
      The_Clock := C;
   end Set_Clock;
   
   ----------
   -- Tick --
   ----------
   
   function Tick return Duration is
   begin
      return The_Tick;
   end Tick;
   
   --------------
   -- Set_Tick --
   --------------
   
   procedure Set_Tick (T : Duration) is
   begin
      The_Tick := T;
   end Set_Tick;
   
   ----------------------
   -- Initialize_Clock --
   ----------------------
   
   procedure Initialize_Clock is
   begin
      The_Clock := 0.0;
      The_Tick  := 0.1;
      
      Tick_10_Msec  := False;
      Tick_100_Msec := False;
      Tick_1_Sec    := False;
      Tick_1_Min    := False;
      
      BT_10_Msec  := False;
      BT_100_Msec := False;
      BT_1_Sec    := False;
      BT_1_Min    := False;
      
   end Initialize_Clock;
   
   ------------------
   -- Update_Clock --
   ------------------
   
   procedure Update_Clock is
   begin
      The_Clock := The_Clock + The_Tick;
      
      Tick_10_Msec  := False;
      Tick_100_Msec := False;
      Tick_1_Sec    := False;
      Tick_1_Min    := False;
      
      BT_10_Msec  := False;
      BT_100_Msec := False;
      BT_1_Sec    := False;
      BT_1_Min    := False;
   end Update_Clock;
   
   ---------------
   -- Pre_Cycle --
   ---------------
   
   procedure Pre_Cycle is
   begin
      null;
   end Pre_Cycle;
   
   ----------------
   -- Post_Cycle --
   ----------------
   
   procedure Post_Cycle is
   begin
      null;
   end Post_Cycle;
   
end Rxrt.RxClock;
