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

generic
   type Integer_Type is range <>;
package XReqLib.Asserts.Generic_Integer is

   procedure Assert
     (Actual : Integer_Type;
      Match  : String;
      Reason : String := "");

private

   procedure Assert_Absolute
     (Expected  : Integer_Type;
      Actual    : Integer_Type;
      Tolerance : Integer_Type;
      Reason    : String := "");
   pragma Precondition (Tolerance >= 0);

   procedure Assert_Relative
     (Expected  : Integer_Type;
      Actual    : Integer_Type;
      Tolerance : Integer_Type;
      Reason    : String := "");
   pragma Precondition (Tolerance >= 0);

   procedure Assert_Greater
     (Expected : Integer_Type;
      Actual   : Integer_Type;
      Reason   : String := "");

   procedure Assert_Strictly_Greater
     (Expected : Integer_Type;
      Actual   : Integer_Type;
      Reason   : String := "");

   procedure Assert_Lower
     (Expected : Integer_Type;
      Actual   : Integer_Type;
      Reason   : String := "");

   procedure Assert_Strictly_Lower
     (Expected : Integer_Type;
      Actual   : Integer_Type;
      Reason   : String := "");

   function Get_Upper_Bound
     (Expected  : Integer_Type;
      Tolerance : Integer_Type) return Integer_Type;

   function Get_Lower_Bound
     (Expected  : Integer_Type;
      Tolerance : Integer_Type) return Integer_Type;

end XReqLib.Asserts.Generic_Integer;
