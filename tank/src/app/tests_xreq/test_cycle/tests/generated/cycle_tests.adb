--  File: ./generated/cycle_tests.adb
with feature_test_002;
pragma Unreferenced (feature_test_002);
with feature_test001;
pragma Unreferenced (feature_test001);
pragma Style_Checks (Off);

with Ada.Command_Line;
with Ada.Real_Time;
with XReqLib.CLI;
with XReqLib.Util;
with XReqLib.Report;
with XReqLib.Register;
with XReqLib.Format;
use  Ada.Real_Time;
use  XReqLib.CLI;
use  XReqLib.Util;
use  XReqLib.Report;
use  XReqLib.Register;
use  XReqLib.Format;

procedure cycle_tests is
   Self_Name : constant String := "cycle_tests";
   Continue   : Boolean := True;
   Report     : Report_Type;
   Format     : Format_Ptr := null;
   Cond       : Conditional_Type := Null_Condition;
   Test_Case_Num : Integer := -1;
   List_Mode  : Boolean := False;
   Time_Start : Time;
   Time_Stop  : Time;
   Time_Delta : Duration := Duration (0);
begin
   Parse_Arguments (Format, Continue, Cond, List_Mode, Test_Case_Num, Self_Name);
   if Continue then
      Format.Start_Tests;
      Format.Begin_Tests;
      Time_Start := Clock;
      --  Count Steps
      Call_Features (Format, Cond, Report, Count_Mode => True);
      Format.Set_Num_Steps (Report.Num_Steps);
      --  Run Steps
      Call_Features (Format, Cond, Report, List_Mode, TC_Num => Test_Case_Num);
      Time_Stop := Clock;
      Time_Delta := To_Duration (Time_Stop - Time_Start);
      if not List_Mode then
         Format.Put_Summary (Report, Time_Delta);
         Format.End_Tests;
         Format.Stop_Tests;
      end if;
   end if;
   Free (Format);
exception
   when E : others =>
      Put_Exception_Information (E);
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
end cycle_tests;

pragma Style_Checks (On);
