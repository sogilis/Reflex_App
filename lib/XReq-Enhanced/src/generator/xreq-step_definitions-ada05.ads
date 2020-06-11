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
with Util.Strings.Pool;
with XReq.Step_Definition_List.Handles;

use Util.Strings;
use Util.Strings.Pool;
use XReq.Step_Definition_List.Handles;

package XReq.Step_Definitions.Ada05 is

   procedure Parse_Directory
     (Steps      : Step_File_List_Handle;
      Logger     : Logger_Ptr;
      Directory  : String;
      Fill_Steps : Boolean := False);
   --  IMPORTANT: deallocate Steps_Type

   procedure Add_Steps
     (Steps     : Step_File_List_Handle;
      New_Steps : String_Set;
      Step_Pkg  : String;
      Directory : String;
      Logger    : Logger_Ptr);
   --  Create missing step definitions
   --  IMPORTANT: deallocate Steps_Type

   procedure Add_Set_Up_And_Tear_Down
     (Steps     : Step_File_List_Handle;
      Step_Pkg  : String;
      Directory : String;
      Logger    : Logger_Ptr);
   --  Create missing Set_Up and Tear_Down definitions
   --  IMPORTANT: deallocate Steps_Type

   type Ada_Step_File_Type is new Step_File_Type with private;
   type Ada_Step_File_Ptr is access all Ada_Step_File_Type'Class;

   procedure Make
     (S          : out Ada_Step_File_Type;
      File_Name  :     String;
      Fill_Steps :     Boolean := False);

   overriding procedure Parse
     (S      : in out Ada_Step_File_Type;
      Logger :        Logger_Ptr);

private

   type Ada_Step_File_Type is new Step_File_Type with record
      Fill_Steps : Boolean := False;
      Procedures : String_Pool;
   end record;

end XReq.Step_Definitions.Ada05;
