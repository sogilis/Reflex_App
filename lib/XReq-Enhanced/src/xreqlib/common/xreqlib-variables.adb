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

package body XReqLib.Variables is

   use Variable_Package;

   Global_Variables_Impl : aliased Variable_Set;

   procedure Clear (Self : in out Variable_Set) is
   begin
      Clear (Self.Map);
   end Clear;

   procedure Set (Self : in out Variable_Set; Key : String; Value : String) is
   begin
      if Value = "" then
         Exclude (Self.Map, To_Unbounded_String (Key));
      else
         Include
           (Self.Map,
            To_Unbounded_String (Key),
            To_Unbounded_String (Value));
      end if;
   end Set;

   procedure Set (Self : in out Variable_Set; Key : String; Value : Integer) is
      S : constant String := Value'Img;
   begin
      if Value < 0 then
         Set (Self, Key, S);
      else
         Set (Self, Key, S (S'First + 1 .. S'Last));
      end if;
   end Set;

   function Get (Self : Variable_Set; Key : String) return String is
   begin
      return To_String (Element (Self.Map, To_Unbounded_String (Key)));
   end Get;

--     function Slice (S : String; First, Last : Integer) return String is
--     begin
--        return S (First .. Last);
--     end Slice;

--     function Starts_With
--       (S      : String;
--        Prefix : String;
--        First  : Integer) return Boolean
--     is
--     begin
--        return S (First .. First + Prefix'Length - 1) = Prefix;
--     end Starts_With;

   function Replace (Self : Variable_Set; Subject : String) return String is
      K_Begin     : constant String := "${";
--        K_Nest      : constant String := "{";
      K_End       : constant String := "}";
--        Indent      : Integer         := 0;
      Index_Start : Natural         := 0;
      Index_End   : Natural         := 0;
   begin
      if Subject'Length >= K_Begin'Length then
         if Subject (Subject'First .. Subject'First + K_Begin'Length - 1) = K_Begin then
            Index_Start := Subject'First + K_Begin'Length;

            if Subject (Subject'Last - K_End'Length + 1 .. Subject'Last) = K_End then
               Index_End := Subject'Last - K_End'Length;

               return Get (Self => Self,
                           Key  => Subject (Index_Start .. Index_End));
            end if;
         end if;
      end if;

      --    TOO MUCH RECUSIVITY !!! CHECK if really we do support nested variables...
--        for I in Subject'First .. Subject'Last loop
--           if Starts_With (Subject, K_Begin, I) then
--              Indent := 1;
--
--              for J in I + K_Begin'Length .. Subject'Last loop
--                 if Starts_With (Subject, K_Nest, J) then
--                    Indent := Indent + 1;
--                 elsif Starts_With (Subject, K_End, J) then
--                    Indent := Indent - 1;
--                 end if;
--
--                 if Indent = 0 then
--                       return Slice (Subject, Subject'First, I - 1) &
--                         Get
--                         (Self,
--                          Replace
--                            (Self,
--                             Slice (Subject, I + K_Begin'Length, J - 1))) &
--                         Replace (Self, Slice (Subject, J + 1, Subject'Last));
--                 end if;
--
--              end loop;
--
--           end if;
--        end loop;
      return Subject;
   end Replace;

begin
   Global_Variables := Global_Variables_Impl'Access;
end XReqLib.Variables;
