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

with XReq.Step_Definitions.Ada05;
with XReq.Step_Definitions.C;
with XReq.Step_Definition_List.Handles;
with XReqLib.Util;
use XReqLib.Util;

package body XReq.Step_Definition_List is

   ------------
   --  Load  --
   ------------

   procedure Load
     (Steps      : in out Step_File_List_Type;
      Logger     :        Logger_Ptr;
      Directory  :        String;
      Language   :        Language_Type;
      Fill_Steps :        Boolean := False)
   is
      Self : constant Handles.Step_File_List_Handle :=
        Handles.Handles_Pkg.Create (Steps'Unchecked_Access);
   begin
      case Language is
         when Lang_Ada =>
            Logger.Put_Line ("Load Ada steps in: " & Directory);
            XReq.Step_Definitions.Ada05.Parse_Directory
              (Self,
               Logger,
               Directory,
               Fill_Steps);
         when Lang_C =>
            Logger.Put_Line ("Load C steps in: " & Directory);
            XReq.Step_Definitions.C.Parse_Directory
              (Self,
               Logger,
               Directory,
               Fill_Steps);
      end case;
   end Load;

   ------------
   --  Load  --
   ------------

   procedure Load
     (Steps     : in out Step_File_List_Type;
      Directory :        String;
      Language  :        Language_Type)
   is
   begin
      Steps.Load (Null_Logger, Directory, Language);
   end Load;

   -----------------
   --  Add_Steps  --
   -----------------

   procedure Add_Steps
     (Steps     : in out Step_File_List_Type;
      New_Steps :        String_Set;
      Step_Pkg  :        String;
      Directory :        String;
      Language  :        Language_Type;
      Logger    :        Logger_Ptr)
   is
      Self : constant Handles.Step_File_List_Handle :=
        Handles.Handles_Pkg.Create (Steps'Unchecked_Access);
   begin
      case Language is
         when Lang_Ada =>
            XReq.Step_Definitions.Ada05.Add_Steps
              (Self,
               New_Steps,
               Step_Pkg,
               Directory,
               Logger);
         when Lang_C =>
            raise Not_Yet_Implemented;  --  GCOV_IGNORE
      end case;
   end Add_Steps;

   --------------------------------
   --  Add_Set_Up_And_Tear_Down  --
   --------------------------------

   procedure Add_Set_Up_And_Tear_Down
     (Steps     : in out Step_File_List_Type;
      Step_Pkg  :        String;
      Directory :        String;
      Language  :        Language_Type;
      Logger    :        Logger_Ptr)
   is
      Self : constant Handles.Step_File_List_Handle :=
        Handles.Handles_Pkg.Create (Steps'Unchecked_Access);
   begin
      case Language is
         when Lang_Ada =>
            XReq.Step_Definitions.Ada05.Add_Set_Up_And_Tear_Down
              (Self,
               Step_Pkg,
               Directory,
               Logger);
         when Lang_C =>
            raise Not_Yet_Implemented;  --  GCOV_IGNORE
      end case;
   end Add_Set_Up_And_Tear_Down;

   --------------
   --  Append  --
   --------------

   procedure Append
     (Steps : in out Step_File_List_Type;
      File  :        Step_File_Handle)
   is
   begin
      Step_Definition_Vectors.Append (Steps.List, File);
   end Append;

   -------------
   --  First  --
   -------------

   function First (Steps : Step_File_List_Type) return Natural is
   begin
      return Step_Definition_Vectors.First_Index (Steps.List);
   end First;

   ------------
   --  Last  --
   ------------

   function Last (Steps : Step_File_List_Type) return Integer is
   begin
      return Step_Definition_Vectors.Last_Index (Steps.List);
   end Last;

   -------------
   --  Count  --
   -------------

   function Count (Steps : Step_File_List_Type) return Natural is
   begin
      return Steps.Last - Steps.First + 1;
   end Count;

   ---------------
   --  Element  --
   ---------------

   function Element
     (Steps : Step_File_List_Type;
      Idx   : Natural) return Step_File_Handle
   is
   begin
      return Step_Definition_Vectors.Element (Steps.List, Idx);
   end Element;

   ------------
   --  Find  --
   ------------

   procedure Find
     (Steps  : Step_File_List_Type;
      Stanza : Step_Handle;
      Log    : Logger_Ptr;
      Result : Find_Result_Procedure)
   is
      use Step_Definition_Vectors;
      I    : Step_Definition_Vectors.Cursor := First (Steps.List);
      Step : Step_File_Handle;
   begin
      while Has_Element (I) loop
         Step := Element (I);
         Log.Put_Line (2, "Matching with file " & Step.Ref.File_Name);
         Step.R.all.Find (Stanza, Log, Result);
         Next (I);
      end loop;
   end Find;  --  GCOV_IGNORE

   ----------------
   --  Finalize  --
   ----------------

   procedure Finalize (Steps : in out Step_File_List_Type) is
      use Step_Definition_Vectors;
   begin
      Clear (Steps.List);
   end Finalize;

end XReq.Step_Definition_List;
