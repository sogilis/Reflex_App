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
with XReqLib.Variables;

package body XReqLib.Comparisons.Generic_Floating_Point is

   function Extract_Expected_From_Match
     (Match : String) return Floating_Type
   is
   begin
      return Floating_Type'Value
          (XReqLib.Variables.Replace
             (XReqLib.Variables.Global_Variables.all,
              Ada.Strings.Fixed.Head
                (Source => Match,
                 Count  =>
                   XReqLib.Comparisons.Tolerance_Detection.Tild_Index_In_Match
                     (Match) -
                   Match'First)));
   end Extract_Expected_From_Match;

   function Extract_Absolute_Tolerance_From_Match
     (Match : String) return Floating_Type
   is
   begin
      return Floating_Type'Value
          (XReqLib.Variables.Replace
             (XReqLib.Variables.Global_Variables.all,
              Ada.Strings.Fixed.Tail
                (Source => Match,
                 Count  =>
                   Match'Last -
                   XReqLib.Comparisons.Tolerance_Detection.Tild_Index_In_Match
                     (Match))));
   end Extract_Absolute_Tolerance_From_Match;

   function Extract_Relative_Tolerance_From_Match
     (Match : String) return Floating_Type
   is
      New_Match : constant String := Match (Match'First .. Match'Last - 1);
   begin
      return Extract_Absolute_Tolerance_From_Match (New_Match);
   end Extract_Relative_Tolerance_From_Match;

   function Extract_Greater_Than_Expected_From_Match
     (Match : String) return Floating_Type
   is
   begin
      return Floating_Type'Value
          (XReqLib.Variables.Replace
             (XReqLib.Variables.Global_Variables.all,
              Match (Match'First + 2 .. Match'Last)));
   end Extract_Greater_Than_Expected_From_Match;

   function Extract_Strictly_Greater_Than_Expected_From_Match
     (Match : String) return Floating_Type
   is
   begin
      return Floating_Type'Value
          (XReqLib.Variables.Replace
             (XReqLib.Variables.Global_Variables.all,
              Match (Match'First + 1 .. Match'Last)));
   end Extract_Strictly_Greater_Than_Expected_From_Match;

   function Extract_Lower_Than_Expected_From_Match
     (Match : String) return Floating_Type
   is
   begin
      return Floating_Type'Value
          (XReqLib.Variables.Replace
             (XReqLib.Variables.Global_Variables.all,
              Match (Match'First + 2 .. Match'Last)));
   end Extract_Lower_Than_Expected_From_Match;

   function Extract_Strictly_Lower_Than_Expected_From_Match
     (Match : String) return Floating_Type
   is
   begin
      return Floating_Type'Value
          (XReqLib.Variables.Replace
             (XReqLib.Variables.Global_Variables.all,
              Match (Match'First + 1 .. Match'Last)));
   end Extract_Strictly_Lower_Than_Expected_From_Match;

end XReqLib.Comparisons.Generic_Floating_Point;
