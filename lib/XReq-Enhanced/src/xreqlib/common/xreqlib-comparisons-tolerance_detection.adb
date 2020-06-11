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
with Ada.Strings.Fixed;

package body XReqLib.Comparisons.Tolerance_Detection is

   function Get_Match_Type (Match : String) return T_Match_Type is
      Match_Type : T_Match_Type := Unknown;
   begin
      if Match_Includes_Absolute_Tolerance (Match) then
         Match_Type := Absolute_Tolerance;
      elsif Match_Includes_Relative_Tolerance (Match) then
         Match_Type := Relative_Tolerance;
      elsif Match_Includes_Greater (Match) then
         Match_Type := Greater;
      elsif Match_Includes_Strictly_Greater (Match) then
         Match_Type := Strictly_Greater;
      elsif Match_Includes_Lower (Match) then
         Match_Type := Lower;
      elsif Match_Includes_Strictly_Lower (Match) then
         Match_Type := Strictly_Lower;
      end if;
      return Match_Type;
   end Get_Match_Type;

   function Tild_Index_In_Match (Match : String) return Integer is
   begin
      return Ada.Strings.Fixed.Index (Source => Match, Pattern => "~");
   end Tild_Index_In_Match;

   function Match_Includes_Absolute_Tolerance
     (Match : String) return Boolean
   is
   begin
      return Tild_Index_In_Match (Match) /= 0
        and then not Match_Includes_Relative_Tolerance (Match);
   end Match_Includes_Absolute_Tolerance;

   function Match_Includes_Relative_Tolerance
     (Match : String) return Boolean
   is
   begin
      return Tild_Index_In_Match (Match) /= 0
        and then ((Match (Match'Last)) = '%');
   end Match_Includes_Relative_Tolerance;

   function Match_Includes_Greater (Match : String) return Boolean is
   begin
      return Ada.Strings.Fixed.Index (Source => Match, Pattern => ">=") /= 0;
   end Match_Includes_Greater;

   function Match_Includes_Strictly_Greater (Match : String) return Boolean is
   begin
      return Ada.Strings.Fixed.Index (Source => Match, Pattern => ">") /= 0;
   end Match_Includes_Strictly_Greater;

   function Match_Includes_Lower (Match : String) return Boolean is
   begin
      return Ada.Strings.Fixed.Index (Source => Match, Pattern => "<=") /= 0;
   end Match_Includes_Lower;

   function Match_Includes_Strictly_Lower (Match : String) return Boolean is
   begin
      return Ada.Strings.Fixed.Index (Source => Match, Pattern => "<") /= 0;
   end Match_Includes_Strictly_Lower;

end XReqLib.Comparisons.Tolerance_Detection;
