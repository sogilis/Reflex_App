
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
   pragma Import (Ada, Clock, "Rxrt_Clock");
   pragma Import (Ada, Set_Clock, "Rxrt_Set_Clock");
   -- The global clock of reflex. The global clock is set to 0 when the
   -- application starts. The clock is in fact the time in milliseconds elapsed
   -- since the start of the application
   
   function Tick return Duration;
   procedure Set_Tick (T : Duration);
   pragma Import (Ada, Tick, "Rxrt_Tick");
   pragma Import (Ada, Set_Tick, "Rxrt_Set_Tick");
   -- Time, in milliseconds, elapsed between two instants
   
end Rxrt.RxClock;
