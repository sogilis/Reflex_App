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

with Reffy;
with XReq.Scenarios.Handles;
with Ada.Strings.Unbounded;
with Ada.Containers.Vectors;
with XReq.Language.Handles;
with Util.IO;

use XReq.Scenarios.Handles;
use Ada.Strings.Unbounded;
use XReq.Language.Handles;
use Util.IO;

package XReq.Features is

   Parse_Error : exception;

   -------------------
   -- Feature_Type  --
   -------------------

   type Feature_Type is new Reffy.Counted_Type with private;
   type Feature_Ptr is access all Feature_Type'Class;

   procedure Free (F : in out Feature_Ptr);

   --  Creation  --------------------------------------------------------------

   procedure Make (F : out Feature_Type; Name : String := "");

   --  Process  ---------------------------------------------------------------

   function To_String (F : Feature_Type) return String;

   --  Properties: Read  ------------------------------------------------------

   function Parsed (F : Feature_Type) return Boolean;
   function Name (F : Feature_Type) return String;
   function Position (F : Feature_Type) return Position_Type;
   function Background (F : Feature_Type) return Scenario_Handle;
   function Filetype (F : Feature_Type) return String;
   function Description (F : Feature_Type) return String;
   function Language (F : Feature_Type) return Language_Handle;

   --  Properties: Write  -----------------------------------------------------

   procedure Set_Name (F : in out Feature_Type; Name : String);
   procedure Set_Position (F : in out Feature_Type; Pos : Position_Type);
   procedure Set_Background (F : in out Feature_Type; Bg : Scenario_Handle);
   procedure Set_Description (F : in out Feature_Type; Desc : String);
   procedure Set_Filetype (F : in out Feature_Type; FType : String);
   procedure Append_Description (F : in out Feature_Type; Desc : String);

   --  Collection: Scenario  --------------------------------------------------

   function Scenario_First (F : Feature_Type) return Natural;
   function Scenario_Last (F : Feature_Type) return Integer;
   function Scenario_Count (F : Feature_Type) return Natural;
   function Scenario_Element
     (F : Feature_Type;
      I : Natural) return Scenario_Handle;
   procedure Scenario_Append (F : in out Feature_Type; S : Scenario_Handle);

   ----------------------------------------------------------------------------

   Null_Feature : constant Feature_Type;
   Unparsed_Feature : exception;

private

   use XReq.Scenarios.Handles.Handles_Pkg;
   package Scenario_Container is new Ada.Containers.Vectors
     (Natural,
      Scenario_Handle,
      "=");

   type Feature_Type is new Reffy.Counted_Type with record
      M_Name        : Unbounded_String;
      M_Description : Unbounded_String;
      M_Filetype    : Unbounded_String;
      Pos           : Position_Type;
      Background    : Scenario_Handle;
      Scenarios     : Scenario_Container.Vector;
      Lang          : Language_Handle;
   end record;

   Null_Feature : constant Feature_Type :=
     (Reffy.Counted_Type with Background => Create, others => <>);

end XReq.Features;
