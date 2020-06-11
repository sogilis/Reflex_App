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

with Ada.Strings.Unbounded;
with XReqLib.String_Hash;
with Ada.Containers.Hashed_Maps;

package XReqLib.Variables is

   type Variable_Set is tagged private;

   procedure Clear (Self : in out Variable_Set);
   procedure Set (Self : in out Variable_Set; Key : String; Value : String);
   procedure Set (Self : in out Variable_Set; Key : String; Value : Integer);
   function Get (Self : Variable_Set; Key : String) return String;
   function Replace (Self : Variable_Set; Subject : String) return String;

   Global_Variables : access Variable_Set;

private

   use Ada.Strings.Unbounded;

   package Variable_Package is new Ada.Containers.Hashed_Maps
     (Key_Type        => Unbounded_String,
      Element_Type    => Unbounded_String,
      Hash            => XReqLib.String_Hash,
      Equivalent_Keys => "=");

   type Variable_Set is tagged record
      Map : Variable_Package.Map;
   end record;

end XReqLib.Variables;
