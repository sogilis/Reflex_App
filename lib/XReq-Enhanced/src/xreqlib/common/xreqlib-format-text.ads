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

with XReqLib.Format.Base; use XReqLib.Format.Base;
with XReqLib.IO;

package XReqLib.Format.Text is

   type Text_Format_Type is new Base_Format_Type with private;
   type Text_Format_Ptr is access all Text_Format_Type;

   overriding procedure Put_Feature (Format : in out Text_Format_Type);
   overriding procedure End_Feature (Format : in out Text_Format_Type);

   overriding procedure Put_Background (Format : in out Text_Format_Type);

   overriding procedure Enter_Outline (Format : in out Text_Format_Type);

   overriding procedure Begin_Outline (Format : in out Text_Format_Type);

   overriding procedure Put_Outline_Report
     (Format : in out Text_Format_Type;
      Table  :        Table_Type);

   overriding procedure Begin_Scenario (Format : in out Text_Format_Type);

   overriding procedure Enter_Scenario (Format : in out Text_Format_Type);

   overriding procedure End_Scenario (Format  : in out Text_Format_Type;
                                      Success :        Status_Type);

   overriding procedure Put_Step
     (Format  : in out Text_Format_Type;
      Args    :        Arg_Type;
      Success :        Status_Type);

   overriding procedure Put_Error
     (Format : in out Text_Format_Type;
      Err    :        Exception_Occurrence);

   overriding procedure Put_Summary
     (Format : in out Text_Format_Type;
      Report :        Report_Type;
      D      :        Duration);

   function New_And_Initialize
     (Text_IO_Interface : XReqLib.IO.T_Output_Class_Access)
      return not null Text_Format_Ptr;

private

   type Text_Format_Type is new Base_Format_Type with record
      Passed_Step_List : Unbounded_String;
      Failed_Step_List : Unbounded_String;

      Background_Failed : Boolean := False;
      --  Tell if a step in the background failed, in which case we will
      --  display all the remaining steps.
   end record;

end XReqLib.Format.Text;
