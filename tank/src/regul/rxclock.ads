
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

package RxClock is
   
   Tick_Unit : constant Duration := 0.01;
   pragma Export (Ada, Tick_Unit, "Rx_Tick_Unit");
   
   The_Tick  : Duration := Tick_Unit;
   pragma Export (Ada, The_Tick,  "Rx_The_Tick");
   
   Hundredth_Unit : constant Duration := Tick_Unit * 10.0;
   Second_Unit    : constant Duration := Hundredth_Unit * 10.0;
   Minute_Unit    : constant Duration := Second_Unit * 60;
   Hour_Unit      : constant Duration := Minute_Unit * 60;
   
   
   function Clock return Duration;
   procedure Set_Clock (C : Duration);
   -- The global clock of reflex. The global clock is set to 0 when the
   -- application starts. The clock is in fact the time in milliseconds elapsed
   -- since the start of the application
   
   function Tick return Duration;
   procedure Set_Tick (T : Duration);
   -- Time, in milliseconds, elapsed between two instants
   
   procedure Initialize_Clock (Tick : Duration := Tick_Unit);
   -- This procedure is called and the run time initialization instant
   
   procedure Update_Periodic_Flags;
   
   procedure Update_Clock (Tick : Duration := The_Tick);
   -- Must be called by the run time during the pre porcessing phase to update
   -- the global clock of the run time
   
   --  function Is_Slave_Clock return Boolean;
   --  procedure Set_Slave_Clock;
   --  procedure Rset_Slave_Clock;
   
   --  Slave_Clock : Boolean := False;
   
   --  Master_Clock_Period : Duration := 0.1;
   
   Tick_10_Msec  : Boolean;
   Tick_100_Msec : Boolean;
   Tick_Second   : Boolean;
   Tick_Minute   : Boolean;
   Tick_Hour     : Boolean;
   
   BT_10_Msec  : Boolean;
   BT_100_Msec : Boolean;
   BT_Second   : Boolean;
   BT_Minute   : Boolean;
   BT_Hour     : Boolean;
   
private
   
   The_Clock : Duration := 0.0;
   Previous_Clock : Duration := 0.0;
   
   Previous_BT_10_Msec  : Boolean;
   Previous_BT_100_Msec : Boolean;
   Previous_BT_Second   : Boolean;
   Previous_BT_Minute   : Boolean;
   Previous_BT_Hour     : Boolean;
   
   Counter_BT_10_Msec  : Duration;
   Counter_BT_100_Msec : Duration;
   Counter_BT_Second   : Duration;
   Counter_BT_Minute   : Duration;
   Counter_BT_Hour     : Duration;
   
   pragma Export (Ada, Clock,     "Rx_Clock");
   pragma Export (Ada, Set_Clock, "Rx_Set_Clock");
   pragma Export (Ada, Tick,      "Rx_Tick");
   pragma Export (Ada, Set_Tick,  "Rx_Set_Tick");
   pragma Export (Ada, Initialize_Clock, "Rx_Initialize_Clock");
   pragma Export (Ada, Update_Clock,     "Rx_Update_Clock");
   
   pragma Export (Ada, Tick_10_Msec,  "Rx_Tick_10_Msec");
   pragma Export (Ada, Tick_100_Msec, "Rx_Tick_100_Msec");
   pragma Export (Ada, Tick_Second,   "Rx_Tick_Second");
   pragma Export (Ada, Tick_Minute,   "Rx_Tick_Minute");
   pragma Export (Ada, Tick_Hour,     "Rx_Tick_Hour");
   
   pragma Export (Ada, BT_10_Msec,  "Rx_BT_10_Msec");
   pragma Export (Ada, BT_100_Msec, "Rx_BT_100_Msec");
   pragma Export (Ada, BT_Second,   "Rx_BT_Second");
   pragma Export (Ada, BT_Minute,   "Rx_BT_Minute");
   pragma Export (Ada, BT_Hour,     "Rx_BT_Hour");
   
end RxClock;
