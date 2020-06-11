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

with Ada.Unchecked_Deallocation;
with Ada.Strings.Fixed;

package body XReqLib.Format is

   ---------------
   --  Convert  --
   ---------------

   function Convert (Tags : Tag_Array_Type) return Tag_Array_Vector.Vector is
      use Tag_Array_Vector;
   begin
      return T : Tag_Array_Vector.Vector do
         for I in Tags'Range loop
            Append (T, Tags (I));
         end loop;
      end return;
   end Convert;

   function Convert (Tags : Tag_Array_Vector.Vector) return Tag_Array_Type is
      use Tag_Array_Vector;
   begin
      return T : Tag_Array_Type (1 .. Integer (Length (Tags))) do
         for I in T'Range loop
            T (I) := Element (Tags, I);
         end loop;
      end return;
   end Convert;

   ---------------------
   --  Get_Formatter  --
   ---------------------

--   function Get_Formatter (Name : in String) return Format_Ptr is
--      use Ada.Strings.Fixed;
--      use Ada.Strings.Maps.Constants;
--      N : constant String := Translate (Name, Lower_Case_Map);
--   begin
--      if N = "text" then
--         return Format_Ptr (XReqLib.Format.Text.New_Text_Format);
--      elsif N = "html" then
--         return Format_Ptr (XReqLib.Format.HTML.New_HTML_Format);
--      else
--         return null;
--      end if;
--   end Get_Formatter;  --  GCOV_IGNORE

   ------------
   --  Free  --
   ------------

   procedure Free (Self : in out Format_Ptr) is
      procedure Dealloc is new Ada.Unchecked_Deallocation
        (Format_Type'Class,
         Format_Ptr);
   begin
      Dealloc (Self);
   end Free;

   ------------------------------------
   --  Conditional_Type  --  Create  --
   ------------------------------------

   function Create (Expr : String) return Conditional_Type is
   begin
      return Conditional_Type'
          (Expr => To_Unbounded_String (Expr), others => <>);
   end Create;

   ----------------------------------
   --  Conditional_Type  --  Eval  --
   ----------------------------------

   function Eval
     (Tag_Expr : Conditional_Type;
      Tags     : Tag_Array_Type) return Boolean
   is
      function Eval_Simple (Expr : String) return Boolean;
      function Eval_Not (Expr : String) return Boolean;
      function Eval_And (Expr : String) return Boolean;
      function Eval_Or (Expr : String) return Boolean;

      function Eval_Simple (Expr : String) return Boolean is
      begin
         if Expr'Length = 0 then
            return True;
         else
            for I in Tags'Range loop
               if Expr = To_String (Tags (I)) then
                  return True;
               end if;
            end loop;
            return False;
         end if;
      end Eval_Simple;

      function Eval_Not (Expr : String) return Boolean is
      begin
         if Expr'Length >= 1 and then Expr (Expr'First) = '~' then
            return not Eval_Simple (Expr (Expr'First + 1 .. Expr'Last));
         else
            return Eval_Simple (Expr);
         end if;
      end Eval_Not;

      function Eval_And (Expr : String) return Boolean is
         Buffer : Unbounded_String;
      begin
         for I in Expr'Range loop
            case Expr (I) is
               when '+' =>
                  if not Eval_Not (To_String (Buffer)) then
                     return False;
                  end if;
                  Buffer := Null_Unbounded_String;
               when others =>
                  Append (Buffer, Expr (I));
            end case;
         end loop;
         return Eval_Not (To_String (Buffer));
      end Eval_And;  --  GCOV_IGNORE

      function Eval_Or (Expr : String) return Boolean is
         Buffer : Unbounded_String;
      begin
         for I in Expr'Range loop
            case Expr (I) is
               when ',' =>
                  if Eval_And (To_String (Buffer)) then
                     return True;
                  end if;
                  Buffer := Null_Unbounded_String;
               when others =>
                  Append (Buffer, Expr (I));
            end case;
         end loop;
         return Eval_And (To_String (Buffer));
      end Eval_Or;  --  GCOV_IGNORE

   begin
      return Eval_Or (To_String (Tag_Expr.Expr));
   end Eval;

   ----------------------------------
   --  Conditional_Type  --  Eval  --
   ----------------------------------

   function Eval
     (Cond : Conditional_Type;
      File : String;
      Line : Integer;
      Num  : Integer) return Boolean
   is
      use String_Vectors;
--      use Ada.Strings.Fixed;
--      use Ada.Strings;
      procedure Decompose (C : String; Line, Pos, First, Last : out Integer);
      function Basename (S : String) return String;
      I : String_Vectors.Cursor;

      procedure Decompose (C : String; Line, Pos, First, Last : out Integer) is
      begin
         First := C'First;
         Last  := C'Last;
         Line  := -1;
         Pos   := -1;
         for I in reverse C'Range loop
            case C (I) is
               when ':' =>
                  begin
                     Line := Integer'Value (C (I + 1 .. Last));
                  exception
                     when Constraint_Error =>
                        raise Constraint_Error
                          with C & Integer'Image (I + 1) & Last'Img;
                  end;
                  Last := I - 1;
               when '#' =>
                  begin
                     Pos := Integer'Value (C (I + 1 .. Last));
                  exception
                     when Constraint_Error =>
                        raise Constraint_Error
                          with C & Integer'Image (I + 1) & Last'Img;
                  end;
                  Last := I - 1;
               when others =>
                  null;
            end case;
         end loop;
      end Decompose;

      function Basename (S : String) return String is
         First : Integer := S'First;
      begin
         for I in reverse S'Range loop
            if S (I) = '/' then
               First := I + 1;
               exit;
            end if;
         end loop;
         return S (First .. S'Last);
      end Basename;
   begin
      if Integer (Length (Cond.Scenarios)) = 0 then
         return True;
      end if;
      I := First (Cond.Scenarios);
      while Has_Element (I) loop
         declare
            C : constant String := To_String (Element (I));
            Request_Line, Request_Pos, First, Last : Integer;
            Has_Line, Has_Pos                      : Boolean;
            Is_Line, Is_Pos                        : Boolean;
            Is_File                                : Boolean;
         begin
            Decompose (C, Request_Line, Request_Pos, First, Last);
            Has_Line := Request_Line > 0;
            Has_Pos  := Request_Pos > 0;
            Is_Line  := not Has_Line or Line = Request_Line;
            Is_Pos   := not Has_Pos or Num = Request_Pos;
            Is_File  :=
              C (First .. Last) = File
              or else C (First .. Last) = Basename (File);
            if Is_File and Is_Line and Is_Pos then
               return True;
            end if;
         end;
         Next (I);
      end loop;
      return False;
   end Eval;  --  GCOV_IGNORE

   --------------------
   --  Get_Duration  --
   --------------------

   function Get_Duration (D : Duration) return String is
      use Ada.Strings;
      use Ada.Strings.Fixed;
      Min : Natural;
      Sec : Natural;
      Buf : Unbounded_String;
   begin
      Min := Integer (D) / 60;
      Sec := Integer (D) mod 60;
      if Min > 0 then
         Append (Buf, Trim (Min'Img, Left) & "m ");
      end if;
      Append (Buf, Trim (Sec'Img, Left) & "s");
      --  Append (Buf, " (" & Trim (D'Img, Left) & "s)");
      return To_String (Buf);
   end Get_Duration;

end XReqLib.Format;
