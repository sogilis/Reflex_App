-------------------------------------------------------------------------------
--  XReq  --  Behaviour Driven Developpement tool for compiled languages     --
--  Copyright (c) 2010, SOGILIS <http://sogilis.com>                         --
--                                                                           --
--  This program is free software: you can redistribute it and/or modify     --
--  it under the terms of the GNU Affero General Public License as           --
--  published by the Free Software Foundation, either version 3 of the       --
--  License, or (at your option) any later version.                          --
--                                                                           --
--  This program is distributed in the hope that it will be useful,          --
--  but WITHOUT ANY WARRANTY; without even the implied warranty of           --
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            --
--  GNU Affero General Public License for more details.                      --
--                                                                           --
--  You should have received a copy of the GNU Affero General Public License --
--  along with this program.  If not, see <http://www.gnu.org/licenses/>.    --
--                                                                           --
-------------------------------------------------------------------------------

with Ada.Exceptions.Traceback;  use Ada.Exceptions.Traceback;
with GNAT.Debug_Utilities;      use GNAT.Debug_Utilities;
with Ada.Text_IO;

package body XReqLib.Util is

   procedure Put_Exception_Information (X : Exception_Occurrence) is
      use Ada.Text_IO;
   begin
      -- Print information on stdout (can be serial IO)
      No_Exceptions_Propagated : begin
         Put_Line (Exception_Name (X));
         Put_Line (Exception_Message (X));
         New_Line;

         Put_Line ("Traceback:");
         for Call_Stack_Address of Tracebacks (X) loop
            Put_Line (Image_C (Call_Stack_Address));
         end loop;
         New_Line;
      exception
         when others => null;
      end No_Exceptions_Propagated;

--      Put_Line (Exception_Information (X));
   end Put_Exception_Information;

end XReqLib.Util;
