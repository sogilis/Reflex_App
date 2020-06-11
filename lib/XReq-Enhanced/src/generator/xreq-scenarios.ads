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
with Ada.Containers.Vectors;
with XReqLib.String_Tables;
with XReqLib.Interface_Scenarios;
with XReq.Steps;
with XReq.Steps.Handles;
with Reffy;
with XReqLib.Containers;
with Util.IO;

use Ada.Strings.Unbounded;
use XReqLib.Interface_Scenarios;
use XReq.Steps.Handles;
use XReqLib.Containers;
use Util.IO;

package XReq.Scenarios is

--   subtype Table_Type is XReqLib.String_Tables.Table;

   ---------------------
   --  Scenario_Type  --
   ---------------------

   type Scenario_Type is
     new Reffy.Counted_Type and Scenario_Interface with private;
   type Scenario_Ptr is access all Scenario_Type'Class;

   --  Creation  --------------------------------------------------------------

   procedure Make
     (Scenario : in out Scenario_Type;
      Name     :        String;
      Position :        Position_Type := Null_Position;
      Outline  :        Boolean       := False;
      Tags     :        String_Vector := String_Vectors.Empty_Vector);

   --  Processing  ------------------------------------------------------------

   procedure Output_Steps
     (S   :        Scenario_Type;
      Buf : in out Unbounded_String);

   --  Properties: Read  ------------------------------------------------------

   function Outline (S : Scenario_Type) return Boolean;
   function Name (S : Scenario_Type) return String;
   function Position (S : Scenario_Type) return Position_Type;
   function Tag_Vector (S : Scenario_Type) return String_Vector;
   function Table (S : Scenario_Type) return XReqLib.String_Tables.Table;

   --  Properties: Write  -----------------------------------------------------

   procedure Set_Name (S : in out Scenario_Type; Name : String);

   procedure Set_Table
     (S     : in out Scenario_Type;
      Table :        XReqLib.String_Tables.Table);

   --  Collection: Steps  -----------------------------------------------------

   procedure Step_Append
     (Scenario : in out Scenario_Type;
      Stanza   :        Step_Handle);
   function Step_First (Scenario : Scenario_Type) return Natural;
   function Step_Last (Scenario : Scenario_Type) return Integer;
   function Step_Count (Scenario : Scenario_Type) return Natural;
   function Step_Element
     (Scenario : Scenario_Type;
      Index    : Natural) return Step_Handle;

   --  Collection: Tags  ------------------------------------------------------

   function Tag_First (Scenario : Scenario_Type) return Natural;
   function Tag_Last (Scenario : Scenario_Type) return Integer;
   function Tag_Count (Scenario : Scenario_Type) return Natural;
   function Tag_Element
     (Scenario : Scenario_Type;
      Index    : Natural) return String;

   ----------------------------------------------------------------------------

   function Equals (Left, Right : Scenario_Type) return Boolean;

   Null_Scenario : constant Scenario_Type;
   Null_Scenario_Outline : constant Scenario_Type;

private

   package Step_Vectors is new Ada.Containers.Vectors
     (Natural,
      Step_Handle,
      Steps.Handles.Handles_Pkg."=");

   type Scenario_Record (Outline : Boolean := False) is record
      Name  : Unbounded_String;
      Pos   : Position_Type;
      Tags  : String_Vector;
      Steps : Step_Vectors.Vector;
      --  GCOV_IGNORE_BEGIN
      case Outline is
         when True =>
            Table : XReqLib.String_Tables.Table;
         when False =>
            null;
      end case;
      --  GCOV_IGNORE_END
   end record;

   type Scenario_Type is new Reffy.Counted_Type and
     Scenario_Interface with
   record
      D : Scenario_Record;
   end record;

   Null_Scenario : constant Scenario_Type :=
     (Reffy.Counted_Type with others => <>);
   Null_Scenario_Outline : constant Scenario_Type :=
     (Reffy.Counted_Type with
      D => Scenario_Record'(Outline => True, others => <>));

end XReq.Scenarios;
