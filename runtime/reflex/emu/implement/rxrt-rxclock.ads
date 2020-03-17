
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

package Rxrt.RxClock is
   
   function Clock return Duration;
   procedure Set_Clock (C : Duration);
   -- The global clock of reflex. The global clock is set to 0 when the
   -- application starts. The clock is in fact the time in milliseconds elapsed
   -- since the start of the application
   
   function Tick return Duration;
   procedure Set_Tick (T : Duration);
   -- Time, in milliseconds, elapsed between two instants
   
   procedure Initialize_Clock;
   -- This procedure is called and the run time initialization instant
   
   procedure Update_Clock;
   -- Must be called by the run time during the pre porcessing phase to update
   -- the global clock of the run time
   
   --  function Is_Slave_Clock return Boolean;
   --  procedure Set_Slave_Clock;
   --  procedure Rset_Slave_Clock;
   
   --  Slave_Clock : Boolean := False;
   
   --  Master_Clock_Period : Duration := 0.1;
   
   Tick_1_Sec    : Boolean;
   Tick_10_Msec  : Boolean;
   Tick_100_Msec : Boolean;
   Tick_1_Min    : Boolean;
   
   BT_1_Sec    : Boolean;
   BT_10_Msec  : Boolean;
   BT_100_Msec : Boolean;
   BT_1_Min    : Boolean;
   
private
   
   The_Tick  : Duration := 0.1;
   The_Clock : Duration := 0.0;
   
   Previous_Clock : Duration;
   
   pragma Export (Ada, Clock, "Rxrt_Clock");
   pragma Export (Ada, Set_Clock, "Rxrt_Set_Clock");
   pragma Export (Ada, Tick, "Rxrt_Tick");
   pragma Export (Ada, Set_Tick, "Rxrt_Set_Tick");
   
end Rxrt.RxClock;
