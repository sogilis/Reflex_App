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
with Util.Strings;
with Util.Strings.Pool;
with XReqLib;
with XReq.Features.Result.Handles;
with XReqLib.Containers;

use Ada.Strings.Unbounded;
use Util.Strings;
use Util.Strings.Pool;
use XReqLib;
use XReq.Features.Result.Handles;
use XReqLib.Containers;

package XReq.Generator.C is

   type C_Generator_Type is new Generator_Type with private;
   type C_Generator_Ptr is access all C_Generator_Type'Class;

   procedure Make
     (Gen : out C_Generator_Type;
      Job :     Job_Type;
      Env :     Environment_Handle);

   procedure Generate (Gen : in out C_Generator_Type; Log : Logger_Ptr);

   function Full_Name (Gen : C_Generator_Type) return String;

   procedure Generate_Suite
     (Gens : Generator_Vectors.Vector;
      Name : String;
      Env  : Environment_Handle;
      Log  : Logger_Ptr;
      Pltf : Target_Type;
      TXT_IO : Output_IO_Type;
      Make : Boolean := False);

private

   type C_Generator_Type is new Generator_Type with record
      Feature     : Result_Feature_Handle;
      H_File      : Unbounded_String;
      C_File      : Unbounded_String;
      H           : Buffer_Type;
      C           : Buffer_Type;
      Pool        : String_Pool;
      Header_Name : Unbounded_String;
      Fn_Backgnd  : Unbounded_String;
      Fn_Steps    : String_Vector;
      Headers     : String_Sets.Set;
      C_Steps     : String_Sets.Set;
   end record;

end XReq.Generator.C;
