
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

package body RxClock is
   
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
   
   procedure Initialize_Clock (Tick : Duration := Tick_Unit) is
   begin
      Previous_Clock := 0.0;
      The_Clock := 0.0;
      The_Tick  := Tick;
      
      Tick_10_Msec  := False;
      Tick_100_Msec := False;
      Tick_Second    := False;
      Tick_Minute    := False;
      Tick_Hour    := False;
      
      BT_10_Msec  := False;
      BT_100_Msec := False;
      BT_Second    := False;
      BT_Minute    := False;
      BT_Hour    := False;
      
      Previous_BT_10_Msec  := False;
      Previous_BT_100_Msec := False;
      Previous_BT_Second   := False;
      Previous_BT_Minute   := False;
      Previous_BT_Hour     := False;
      
      Counter_BT_10_Msec  := The_Clock;
      Counter_BT_100_Msec := The_Clock;
      Counter_BT_Second   := The_Clock;
      Counter_BT_Minute   := The_Clock;
      Counter_BT_Hour     := The_Clock;
      
   end Initialize_Clock;
   
   ---------------------------
   -- Update_Periodic_Flags --
   ---------------------------
   
   procedure Update_Periodic_Flags is
   begin
      Tick_10_Msec  := False;
      Tick_100_Msec := False;
      Tick_Second   := False;
      Tick_Minute   := False;
      Tick_Hour     := False;
      
      --  Ticks signal are raise edge
      
      --    ^  ^  ^
      --    |  |  |
      --  --+--+--+--
      
      
      --  Base Time are Periodic signals :
      
      --    +--+  +--+
      --    |  |  |  |
      --  --+  +--+  +--
      
      if The_Clock - Counter_BT_10_Msec >= Tick_Unit then
	 Counter_BT_10_Msec := The_Clock;
	 
	 BT_10_Msec   := not BT_10_Msec;
	 Tick_10_Msec := True;
      end if;
      
      if The_Clock - Counter_BT_100_Msec >= Hundredth_Unit then
	 Counter_BT_100_Msec := The_Clock;
	 
	 BT_100_Msec   := not BT_100_Msec;
	 Tick_100_Msec := True;
      end if;
      
      if The_Clock - Counter_BT_Second >= Second_Unit then
	 Counter_BT_Second := The_Clock;
	 
	 BT_Second   := not BT_Second;
	 Tick_Second := True;
      end if;
      
      if The_Clock - Counter_BT_Minute >= Minute_Unit then
	 Counter_BT_Minute := The_Clock;
	 
	 BT_Minute := not BT_Minute;
	 Tick_Minute := True;
      end if;
      
      if The_Clock - Counter_BT_Hour >= Hour_Unit then
	 Counter_BT_Hour := The_Clock;
	 
	 BT_Hour := not BT_Hour;
	 Tick_Hour := True;
      end if;
   end Update_Periodic_Flags;
   
   ------------------
   -- Update_Clock --
   ------------------
   
   procedure Update_Clock (Tick : Duration := The_Tick) is
   begin
      The_Clock := Previous_Clock + Tick;
      Previous_Clock := Clock;
      
      Update_Periodic_Flags;
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
   
end RxClock;
