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

package XReqLib.Comparisons.Tolerance_Detection is

   type T_Match_Type is
     (Absolute_Tolerance,
      Relative_Tolerance,
      Greater,
      Lower,
      Strictly_Greater,
      Strictly_Lower,
      Unknown);

   function Get_Match_Type (Match : String) return T_Match_Type;

   function Tild_Index_In_Match (Match : String) return Integer;

private

   function Match_Includes_Absolute_Tolerance (Match : String) return Boolean;

   function Match_Includes_Relative_Tolerance (Match : String) return Boolean;

   function Match_Includes_Greater (Match : String) return Boolean;

   function Match_Includes_Strictly_Greater (Match : String) return Boolean;

   function Match_Includes_Lower (Match : String) return Boolean;

   function Match_Includes_Strictly_Lower (Match : String) return Boolean;

end XReqLib.Comparisons.Tolerance_Detection;
