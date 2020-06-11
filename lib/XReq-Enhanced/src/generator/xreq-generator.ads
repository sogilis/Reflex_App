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
with Ada.Containers.Vectors;
with Util.IO;
with XReq.Job;
with XReq.Environment.Handles;
with XReq.Target;
with XReq.Output_IO;

use Util.IO;
use XReq.Job;
use XReq.Environment.Handles;
use XReq.Target;
use XReq.Output_IO;

package XReq.Generator is

   type Generator_Type is interface;
   type Generator_Ptr is access all Generator_Type'Class;

   procedure Generate
     (Job : Job_Type;
      Env : Environment_Handle;
      Log : Logger_Ptr);

   procedure Generate
     (Job :     Job_Type;
      Env :     Environment_Handle;
      Log :     Logger_Ptr;
      Gen : out Generator_Ptr);

   procedure Make
     (Gen : out Generator_Type;
      Job :     Job_Type;
      Env :     Environment_Handle) is abstract;

   function Full_Name (Gen : Generator_Type) return String is abstract;

   procedure Generate
     (Gen : in out Generator_Type;
      Log :        Logger_Ptr) is abstract;

   procedure Free is new Ada.Unchecked_Deallocation
     (Generator_Type'Class,
      Generator_Ptr);

   package Generator_Vectors is new Ada.Containers.Vectors
     (Natural,
      Generator_Ptr,
      "=");

   Generation_Error : exception;

   procedure Generate_Suite
     (Gens : Generator_Vectors.Vector;
      Name : String;
      Env  : Environment_Handle;
      Log  : Logger_Ptr;
      Pltf : Target_Type;
      TXT_IO : Output_IO_Type;
      Cov  : Boolean := False;
      Make : Boolean := False);

end XReq.Generator;
