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

with Ada.Containers.Vectors;
with Util.IO;
with Util.Strings;
with XReq.Lang;
with XReq.Steps.Handles;
with XReq.Step_Definitions;
with XReq.Step_Definitions.Handles;
with Reffy;

use Util.IO;
use Util.Strings;
use XReq.Lang;
use XReq.Steps.Handles;
use XReq.Step_Definitions.Handles;

package XReq.Step_Definition_List is

   ----------------------------------------------------------------------------
   --  Step_File_List_Type  --
   ---------------------------

   type Step_File_List_Type is new Reffy.Counted_Type with private;
   type Step_File_List_Ptr is access all Step_File_List_Type'Class;

   procedure Load
     (Steps     : in out Step_File_List_Type;
      Directory :        String;
      Language  :        Language_Type);
   --  IMPORTANT: deallocate Steps_Type

   procedure Load
     (Steps      : in out Step_File_List_Type;
      Logger     :        Logger_Ptr;
      Directory  :        String;
      Language   :        Language_Type;
      Fill_Steps :        Boolean := False);
   --  IMPORTANT: deallocate Steps_Type

   procedure Add_Steps
     (Steps     : in out Step_File_List_Type;
      New_Steps :        String_Set;
      Step_Pkg  :        String;
      Directory :        String;
      Language  :        Language_Type;
      Logger    :        Logger_Ptr);
   --  Create missing steps (New_Steps) in Step_Pkg to be found in Directory

   procedure Add_Set_Up_And_Tear_Down
     (Steps     : in out Step_File_List_Type;
      Step_Pkg  :        String;
      Directory :        String;
      Language  :        Language_Type;
      Logger    :        Logger_Ptr);
   --  Create missing steps (Set_Up and Tear_Down) in Step_Pkg to be found in Directory

   procedure Append
     (Steps : in out Step_File_List_Type;
      File  :        Step_File_Handle);
   function First (Steps : Step_File_List_Type) return Natural;
   function Last (Steps : Step_File_List_Type) return Integer;
   function Count (Steps : Step_File_List_Type) return Natural;
   function Element
     (Steps : Step_File_List_Type;
      Idx   : Natural) return Step_File_Handle;

   procedure Find
     (Steps  : Step_File_List_Type;
      Stanza : Step_Handle;
      Log    : Logger_Ptr;
      Result : Find_Result_Procedure);

   procedure Finalize (Steps : in out Step_File_List_Type);

private

   package Step_Definition_Vectors is new Ada.Containers.Vectors
     (Natural,
      Step_File_Handle,
      Step_Definitions.Handles.Handles_Pkg."=");

   type Step_File_List_Type is new Reffy.Counted_Type with record
      List : Step_Definition_Vectors.Vector;
   end record;

end XReq.Step_Definition_List;
