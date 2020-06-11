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

with XReqLib.Comparisons.Tolerance_Detection;
use XReqLib.Comparisons.Tolerance_Detection;

generic
   type Floating_Type is digits <>;

package XReqLib.Comparisons.Generic_Floating_Point is

   function Extract_Expected_From_Match (Match : String) return Floating_Type;
   pragma Precondition
     ((Get_Match_Type (Match) = Absolute_Tolerance)
      or else (Get_Match_Type (Match) = Relative_Tolerance));

   function Extract_Absolute_Tolerance_From_Match
     (Match : String) return Floating_Type;
   pragma Precondition (Get_Match_Type (Match) = Absolute_Tolerance);
   pragma Postcondition
     (not (Extract_Absolute_Tolerance_From_Match'Result < 0.0));

   function Extract_Relative_Tolerance_From_Match
     (Match : String) return Floating_Type;
   pragma Precondition (Get_Match_Type (Match) = Relative_Tolerance);
   pragma Postcondition
     (not (Extract_Relative_Tolerance_From_Match'Result < 0.0)
      and then (not (Extract_Relative_Tolerance_From_Match'Result > 100.0)));

   function Extract_Greater_Than_Expected_From_Match
     (Match : String) return Floating_Type;
   pragma Precondition (Get_Match_Type (Match) = Greater);

   function Extract_Strictly_Greater_Than_Expected_From_Match
     (Match : String) return Floating_Type;
   pragma Precondition (Get_Match_Type (Match) = Strictly_Greater);

   function Extract_Lower_Than_Expected_From_Match
     (Match : String) return Floating_Type;
   pragma Precondition (Get_Match_Type (Match) = Lower);

   function Extract_Strictly_Lower_Than_Expected_From_Match
     (Match : String) return Floating_Type;
   pragma Precondition (Get_Match_Type (Match) = Strictly_Lower);

end XReqLib.Comparisons.Generic_Floating_Point;
