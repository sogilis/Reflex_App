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
   type Floating_Type is digits <>;

package XReqLib.Asserts.Generic_Floating_Point is

   --------------
   --  Assert  --
   --------------

   procedure Assert
     (Actual : Floating_Type;
      Match  : String;
      Reason : String := "");

private

   procedure Assert_Absolute
     (Expected  : Floating_Type;
      Actual    : Floating_Type;
      Tolerance : Floating_Type;
      Reason    : String);
   pragma Precondition (not (Tolerance < 0.0));

   procedure Assert_Relative
     (Expected  : Floating_Type;
      Actual    : Floating_Type;
      Tolerance : Floating_Type;
      Reason    : String);
   pragma Precondition
     (not (Tolerance < 0.0) and then not (Tolerance > 100.0));

   procedure Assert_Greater
     (Expected : Floating_Type;
      Actual   : Floating_Type;
      Reason   : String);

   procedure Assert_Strictly_Greater
     (Expected : Floating_Type;
      Actual   : Floating_Type;
      Reason   : String);

   procedure Assert_Lower
     (Expected : Floating_Type;
      Actual   : Floating_Type;
      Reason   : String);

   procedure Assert_Strictly_Lower
     (Expected : Floating_Type;
      Actual   : Floating_Type;
      Reason   : String);

   function Get_Upper_Bound
     (Expected  : Floating_Type;
      Tolerance : Floating_Type) return Floating_Type;

   function Get_Lower_Bound
     (Expected  : Floating_Type;
      Tolerance : Floating_Type) return Floating_Type;

end XReqLib.Asserts.Generic_Floating_Point;
