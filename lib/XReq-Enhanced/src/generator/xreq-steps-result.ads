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

with Util.Strings;
with XReq.Step_Definition_List.Handles;
with XReq.Step_Definitions.Handles;
with XReq.Steps.Handles;

use Util.Strings;
use XReq.Step_Definition_List.Handles;
use XReq.Step_Definitions.Handles;
use XReq.Steps.Handles;

package XReq.Steps.Result is

   ------------------------
   --  Result_Step_Type  --
   ------------------------

   --  A procedure name of a step definition and its arguments

   type Result_Step_Type is new Step_Type with private;  --  GCOV_IGNORE
   type Result_Step_Ptr is access all Result_Step_Type'Class;

   --  Creation  --------------------------------------------------------------

   function New_Result_Step
     (Step  : Step_Handle;
      Match : Step_Match_Type :=
        Step_Match_Type'(others => <>))
      return Result_Step_Type;

   procedure Make
     (Self  : in out Result_Step_Type;
      Step  :        Step_Handle;
      Match :        Step_Match_Type := Step_Match_Type'(others => <>));

   --  Processing  ------------------------------------------------------------

   function To_Code
     (S      : Result_Step_Type;
      Indent : String := "") return String;

   procedure Process_Step
     (Res           : in out Result_Step_Type;
      Stanza        :        Step_Handle;
      Steps         :        Step_File_List_Handle;
      Log           :        Logger_Ptr;
      Errors        :    out Boolean;
      Step_Matching :        Boolean;
      Missing_Steps : in out String_Set);

   --  Properties  ------------------------------------------------------------

   function Procedure_Name (S : Result_Step_Type) return String;
   function File_Name (S : Result_Step_Type) return String;
   procedure Set_Procedure_Name (S : in out Result_Step_Type; Prc : String);

   --  Collection: Matches  ---------------------------------------------------

   function Match_First (S : Result_Step_Type) return Natural;
   function Match_Last (S : Result_Step_Type) return Integer;
   function Match_Count (S : Result_Step_Type) return Natural;
   function Match_Element
     (S : Result_Step_Type;
      I : Natural) return Step_Match_Location;

   ----------------------------------------------------------------------------

private

   type Result_Step_Type is new Step_Type with record
      Match : Step_Match_Type;
   end record;

end XReq.Steps.Result;
