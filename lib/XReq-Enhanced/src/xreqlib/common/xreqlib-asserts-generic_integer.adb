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
with XReqLib.Comparisons.Generic_Integer;

package body XReqLib.Asserts.Generic_Integer is

   package Comparisons is new XReqLib.Comparisons.Generic_Integer
     (Integer_Type);

   procedure Assert
     (Actual : Integer_Type;
      Match  : String;
      Reason : String := "")
   is
   begin
      case Get_Match_Type (Match) is
         when Absolute_Tolerance =>
            Assert_Absolute
              (Expected  => Comparisons.Extract_Expected_From_Match (Match),
               Actual    => Actual,
               Tolerance =>
                 Comparisons.Extract_Absolute_Tolerance_From_Match (Match),
               Reason => Reason);
         when Relative_Tolerance =>
            Assert_Relative
              (Expected  => Comparisons.Extract_Expected_From_Match (Match),
               Actual    => Actual,
               Tolerance =>
                 Comparisons.Extract_Relative_Tolerance_From_Match (Match),
               Reason => Reason);
         when Greater =>
            Assert_Greater
              (Expected =>
                 Comparisons.Extract_Greater_Than_Expected_From_Match (Match),
               Actual => Actual,
               Reason => Reason);
         when Strictly_Greater =>
            Assert_Strictly_Greater
              (Expected =>
                 Comparisons.Extract_Strictly_Greater_Than_Expected_From_Match
                   (Match),
               Actual => Actual,
               Reason => Reason);
         when Lower =>
            Assert_Lower
              (Expected =>
                 Comparisons.Extract_Lower_Than_Expected_From_Match (Match),
               Actual => Actual,
               Reason => Reason);
         when Strictly_Lower =>
            Assert_Strictly_Lower
              (Expected =>
                 Comparisons.Extract_Strictly_Lower_Than_Expected_From_Match
                   (Match),
               Actual => Actual,
               Reason => Reason);
         when others =>
            Assert (Actual = Integer_Type'Value (Match), Reason);
      end case;
   end Assert;

   ---------------------
   -- Get_Upper_Bound --
   ---------------------

   function Get_Upper_Bound
     (Expected  : Integer_Type;
      Tolerance : Integer_Type) return Integer_Type
   is
      Upper_Bound : Integer_Type := 0;
   begin
      if Expected <= Integer_Type'Last - Tolerance then
         Upper_Bound := Expected + Tolerance;
      else
         Upper_Bound := Integer_Type'Last;
      end if;
      return Upper_Bound;
   end Get_Upper_Bound;

   ---------------------
   -- Get_Lower_Bound --
   ---------------------

   function Get_Lower_Bound
     (Expected  : Integer_Type;
      Tolerance : Integer_Type) return Integer_Type
   is
      Lower_Bound : Integer_Type := 0;
   begin

      if Expected >= Integer_Type'First + Tolerance then
         Lower_Bound := Expected - Tolerance;
      else
         Lower_Bound := Integer_Type'First;
      end if;
      return Lower_Bound;
   end Get_Lower_Bound;

   -----------------------
   --  Assert_Absolute  --
   -----------------------

   procedure Assert_Absolute
     (Expected  : Integer_Type;
      Actual    : Integer_Type;
      Tolerance : Integer_Type;
      Reason    : String := "")
   is
      Is_In_Range : Boolean               := True;
      Upper_Bound : constant Integer_Type :=
        Get_Upper_Bound (Expected, Tolerance);
      Lower_Bound : constant Integer_Type :=
        Get_Lower_Bound (Expected, Tolerance);
   begin
      Is_In_Range := Actual <= Upper_Bound and then Actual >= Lower_Bound;

      if not Is_In_Range then
         if Reason /= "" then
            raise Error with Reason;
         else
            raise Error with "Assertion failed";
         end if;
      end if;
   end Assert_Absolute;

   -----------------------
   --  Assert_Relative  --
   -----------------------

   procedure Assert_Relative
     (Expected  : Integer_Type;
      Actual    : Integer_Type;
      Tolerance : Integer_Type;
      Reason    : String := "")
   is
      Absolute_Tolerance : constant Integer_Type :=
        abs
        (Integer_Type
           (Float'Floor (Float (Expected) * (Float (Tolerance) / 100.0))));
   begin
      Assert_Absolute
        (Expected  => Expected,
         Actual    => Actual,
         Tolerance => Absolute_Tolerance,
         Reason    => Reason);
   end Assert_Relative;

   -----------------------
   --  Assert_Greater  --
   -----------------------

   procedure Assert_Greater
     (Expected : Integer_Type;
      Actual   : Integer_Type;
      Reason   : String := "")
   is
   begin
      if Actual < Expected then
         if Reason /= "" then
            raise Error with Reason;
         else
            raise Error with "Assertion failed";
         end if;
      end if;
   end Assert_Greater;

   -------------------------------
   --  Assert_Strictly_Greater  --
   -------------------------------

   procedure Assert_Strictly_Greater
     (Expected : Integer_Type;
      Actual   : Integer_Type;
      Reason   : String := "")
   is
   begin
      if Actual <= Expected then
         if Reason /= "" then
            raise Error with Reason;
         else
            raise Error with "Assertion failed";
         end if;
      end if;
   end Assert_Strictly_Greater;

   --------------------
   --  Assert_Lower  --
   --------------------

   procedure Assert_Lower
     (Expected : Integer_Type;
      Actual   : Integer_Type;
      Reason   : String := "")
   is
   begin
      if Actual > Expected then
         if Reason /= "" then
            raise Error with Reason;
         else
            raise Error with "Assertion failed";
         end if;
      end if;
   end Assert_Lower;

   -----------------------------
   --  Assert_Strictly_Lower  --
   -----------------------------

   procedure Assert_Strictly_Lower
     (Expected : Integer_Type;
      Actual   : Integer_Type;
      Reason   : String := "")
   is
   begin
      if Actual >= Expected then
         if Reason /= "" then
            raise Error with Reason;
         else
            raise Error with "Assertion failed";
         end if;
      end if;
   end Assert_Strictly_Lower;

end XReqLib.Asserts.Generic_Integer;
