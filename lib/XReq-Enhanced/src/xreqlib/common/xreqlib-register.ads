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

with XReqLib.Format;
with XReqLib.Report;

package XReqLib.Register is

   type Feature_Procedure is access procedure
     (Format     :        XReqLib.Format.Format_Ptr;
      Cond       :        XReqLib.Format.Conditional_Type;
      Report     : in out XReqLib.Report.Report_Type;
      List_Mode  :        Boolean := False;
      Count_Mode :        Boolean := False;
      TC_Num     :        Integer := -1);

   type Hook_Timing is (Hook_Begin, Hook_End);
   type Hook_Position is
     (Hook_Test_Suite, Hook_Feature, Hook_Scenario, Hook_Step);
   type Hook_Procedure is access procedure
     (Timing   : Hook_Timing;
      Position : Hook_Position);

   procedure Register_Hook
     (Timing   : Hook_Timing;
      Position : Hook_Position;
      Callback : Hook_Procedure);

   procedure Call_Hook (Timing : Hook_Timing; Position : Hook_Position);

   procedure Register_Feature (Proc : Feature_Procedure);

   procedure Call_Features
     (Format     :        XReqLib.Format.Format_Ptr;
      Cond       :        XReqLib.Format.Conditional_Type;
      Report     : in out XReqLib.Report.Report_Type;
      List_Mode  :        Boolean := False;
      Count_Mode :        Boolean := False;
      TC_Num     :        Integer := -1);

end XReqLib.Register;
