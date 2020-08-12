pragma Style_Checks (Off);
with XReqLib;
with XReqLib.Report;
with XReqLib.Format;
use  XReqLib;
use  XReqLib.Report;
use  XReqLib.Format;
package feature_test_002 is
   procedure Background (Format     : in     Format_Ptr;
                         Report     : in out Report_Type;
                         Stop       : in out Boolean;
                         Count_Mode : in     Boolean := False);

   procedure Scenario_state (Format     : in     Format_Ptr;
                             Report     : in out Report_Type;
                             Cond       : in     Conditional_Type;
                             Stop       : in out Boolean;
                             Count_Mode : in     Boolean := False;
                             TC_Num     : in     Integer := -1);


   procedure Run (Format     :        Format_Ptr;
                  Cond       :        Conditional_Type;
                  Report     : in out Report_Type;
                  List_Mode  :        Boolean := False;
                  Count_Mode :        Boolean := False;
                  TC_Num     :        Integer := -1);
end feature_test_002;
pragma Style_Checks (On);
