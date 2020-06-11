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

with XReqLib.Variables;

package body XReqLib.Args is

   Global_Variables :
     access XReqLib.Variables.Variable_Set renames
     XReqLib.Variables.Global_Variables;

   --------------------------
   --  Arg_Type  --  Make  --
   --------------------------

   procedure Make (Self : out Arg_Type; Stanza : String) is
   begin
      Self := (Stanza => To_Unbounded_String (Stanza), others => <>);
   end Make;

   ---------------------------
   --  Arg_Type  --  Match  --
   ---------------------------

   function Match (Self : Arg_Type; N : Natural) return String is
      First, Last : Natural;
   begin
      Self.Match (N, First, Last);
      return Slice (Self.Stanza, First, Last);
   end Match;

   ---------------------------
   --  Arg_Type  --  Match  --
   ---------------------------

   function Match
     (Self    : Arg_Type;
      N       : Natural;
      Replace : Boolean) return String
   is
      First, Last : Natural;
   begin
      Self.Match (N, First, Last);
      declare
         S : constant String := Slice (Self.Stanza, First, Last);
      begin
         if Replace then
            return Global_Variables.Replace (S);
         else
            return S;
         end if;
      end;
   end Match;

   ---------------------------
   --  Arg_Type  --  Match  --
   ---------------------------

   procedure Match
     (Self  :     Arg_Type;
      N     :     Natural;
      First : out Natural;
      Last  : out Natural)
   is
      use Match_Vectors;
      Match : Match_Type;
   begin
      if N = 0 then
         First := 1;
         Last  := Length (Self.Stanza);
      else
         Match := Element (Self.Matches, N);
         First := Match.First;
         Last  := Match.Last;
      end if;
   end Match;

   ----------------------------
   --  Arg_Type  --  Stanza  --
   ----------------------------

   function Stanza (Self : Arg_Type) return String is
   begin
      return To_String (Self.Stanza);
   end Stanza;

   ---------------------------------
   --  Arg_Type  --  First_Match  --
   ---------------------------------

   function First_Match (Self : Arg_Type) return Natural is
      pragma Unreferenced (Self);
   begin
      return 0;
   end First_Match;

   --------------------------------
   --  Arg_Type  --  Last_Match  --
   --------------------------------

   function Last_Match (Self : Arg_Type) return Natural is
      use Match_Vectors;
   begin
      return Natural (Length (Self.Matches));
   end Last_Match;

   -------------------------------
   --  Arg_Type  --  Add_Match  --
   -------------------------------

   procedure Add_Match
     (Self  : in out Arg_Type;
      First :        Natural;
      Last  :        Natural)
   is
      use Match_Vectors;
   begin
      Append (Self.Matches, Match_Type'(First, Last));
   end Add_Match;

   --------------------------
   --  Arg_Type  --  Text  --
   --------------------------

   function Text (Self : Arg_Type; N : Natural := 0) return String is
      use String_Vectors;
   begin
      return To_String (Element (Self.Texts, N));
   end Text;

   ------------------------------
   --  Arg_Type  --  Add_Text  --
   ------------------------------

   procedure Add_Text (Self : in out Arg_Type; Text : String) is
      use String_Vectors;
      use Elem_Vectors;
   begin
      Append (Self.Texts, To_Unbounded_String (Text));
      Append (Self.Elems, Arg_Element_Record'(Arg_Text, Self.Last_Text));
   end Add_Text;

   --------------------------------
   --  Arg_Type  --  First_Text  --
   --------------------------------

   function First_Text (Self : Arg_Type) return Natural is
      pragma Unreferenced (Self);
   begin
      return 0;
   end First_Text;

   -------------------------------
   --  Arg_Type  --  Last_Text  --
   -------------------------------

   function Last_Text (Self : Arg_Type) return Integer is
      use String_Vectors;
   begin
      return Natural (Length (Self.Texts)) - 1;
   end Last_Text;

   ------------------------------
   --  Arg_Type  --  Num_Text  --
   ------------------------------

   function Num_Text (Self : Arg_Type) return Natural is
      use String_Vectors;
   begin
      return Natural (Length (Self.Texts));
   end Num_Text;

   ---------------------------
   --  Arg_Type  --  Table  --
   ---------------------------

   function Table (Self : Arg_Type; N : Natural := 0) return Table_Type is
      use Table_Vectors;
   begin
      return Element (Self.Tables, N);
   end Table;

   -------------------------------
   --  Arg_Type  --  Add_Table  --
   -------------------------------

   procedure Add_Table (Self : in out Arg_Type; Table : Table_Type) is
      use Table_Vectors;
      use Elem_Vectors;
   begin
      Append (Self.Tables, Table);
      Append (Self.Elems, Arg_Element_Record'(Arg_Table, Self.Last_Table));
   end Add_Table;

   ---------------------------------
   --  Arg_Type  --  First_Table  --
   ---------------------------------

   function First_Table (Self : Arg_Type) return Natural is
      pragma Unreferenced (Self);
   begin
      return 0;
   end First_Table;

   --------------------------------
   --  Arg_Type  --  Last_Table  --
   --------------------------------

   function Last_Table (Self : Arg_Type) return Integer is
      use Table_Vectors;
   begin
      return Natural (Length (Self.Tables)) - 1;
   end Last_Table;

   -----------------------------
   --  Arg_Type  --  Add_Sep  --
   -----------------------------

   procedure Add_Sep (Self : in out Arg_Type; N : Natural := 0) is
      use Elem_Vectors;
   begin
      Append (Self.Elems, Arg_Element_Record'(Arg_Separator, N));
   end Add_Sep;

   --------------------------
   --  Arg_Type  --  Para  --
   --------------------------

   function Para (Self : Arg_Type; N : Natural := 0) return String is
      use String_Vectors;
   begin
      return To_String (Element (Self.Paragraphs, N));
   end Para;

   ------------------------------
   --  Arg_Type  --  Add_Para  --
   ------------------------------

   procedure Add_Para (Self : in out Arg_Type; Text : String) is
      use String_Vectors;
      use Elem_Vectors;
   begin
      Append (Self.Paragraphs, To_Unbounded_String (Text));
      Append (Self.Elems, Arg_Element_Record'(Arg_Paragraph, Self.Last_Para));
   end Add_Para;

   --------------------------------
   --  Arg_Type  --  First_Para  --
   --------------------------------

   function First_Para (Self : Arg_Type) return Natural is
      pragma Unreferenced (Self);
   begin
      return 0;
   end First_Para;

   -------------------------------
   --  Arg_Type  --  Last_Para  --
   -------------------------------

   function Last_Para (Self : Arg_Type) return Integer is
      use String_Vectors;
   begin
      return Natural (Length (Self.Paragraphs)) - 1;
   end Last_Para;

   ---------------------------
   --  Arg_Type  --  First  --
   ---------------------------

   function First (Self : Arg_Type) return Natural is
      pragma Unreferenced (Self);
   begin
      return 0;
   end First;

   --------------------------
   --  Arg_Type  --  Last  --
   --------------------------

   function Last (Self : Arg_Type) return Integer is
      use Elem_Vectors;
   begin
      return Natural (Length (Self.Elems)) - 1;
   end Last;

   -------------------------------
   --  Arg_Type  --  Elem_Type  --
   -------------------------------

   function Elem_Type (Self : Arg_Type; N : Natural) return Arg_Element_Type is
      use Elem_Vectors;
   begin
      return Element (Self.Elems, N).Element_Type;
   end Elem_Type;

   ------------------------------
   --  Arg_Type  --  Elem_Idx  --
   ------------------------------

   function Elem_Idx (Self : Arg_Type; N : Natural) return Natural is
      use Elem_Vectors;
   begin
      return Element (Self.Elems, N).Element_Idx;
   end Elem_Idx;

   --------------------------------
   --  Arg_Type  --  Get_Global  --
   --------------------------------

   function Get_Global (Self : Arg_Type; Name : String) return String is
      pragma Unreferenced (Self);
   begin
      return Global_Variables.Get (Name);
   end Get_Global;

   --------------------------------
   --  Arg_Type  --  Set_Global  --
   --------------------------------

   procedure Set_Global (Self : Arg_Type; Name : String; Value : String) is
      pragma Unreferenced (Self);
   begin
      Global_Variables.Set (Name, Value);
   end Set_Global;

   -----------------------------------
   --  Arg_Type  --  Clear_Globals  --
   -----------------------------------

   procedure Clear_Globals (Self : Arg_Type) is
      pragma Unreferenced (Self);
   begin
      Global_Variables.Clear;
   end Clear_Globals;

   -----------------------------
   --  Arg_Type  --  Replace  --
   -----------------------------

   function Replace (Self : Arg_Type; Subject : String) return String is
      pragma Unreferenced (Self);
   begin
      return Global_Variables.Replace (Subject);
   end Replace;

end XReqLib.Args;
