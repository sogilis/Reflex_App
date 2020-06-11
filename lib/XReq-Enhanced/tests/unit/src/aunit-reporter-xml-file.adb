with Ada.Text_IO;use Ada.Text_IO;

--  with GNAT.IO;            use GNAT.IO;
with AUnit.Time_Measure; use AUnit.Time_Measure;


--  Very simple reporter to console
package body AUnit.Reporter.XML.File is


   ------------
   -- Report --
   ------------

   procedure Report (Engine  : XML_Reporter;
                     R       : in out Result'Class;
                     Options : AUnit_Options := Default_Options)
   is
      pragma Unreferenced (Engine);
      T   : AUnit_Duration;

      Output : File_Type;

      procedure Dump_Result_List (L : Result_Lists.List);
      --  List failed assertions

--        procedure Put_Measure is new Gen_Put_Measure;
      --  Output elapsed time

      procedure Report_Test (Test : Test_Result);
      --  Report a single assertion failure or unexpected exception

      ----------------------
      -- Dump_Result_List --
      ----------------------

      procedure Dump_Result_List (L : Result_Lists.List) is

         use Result_Lists;

         C : Cursor := First (L);

      begin

         --  Note: can't use Iterate because it violates restriction
         --  No_Implicit_Dynamic_Code

         while Has_Element (C) loop
            Report_Test (Element (C));
            Next (C);
         end loop;
      end Dump_Result_List;

      ------------------
      -- Report_Test  --
      ------------------

      procedure Report_Test (Test   : Test_Result) is
         Is_Assert : Boolean;
         T : AUnit_Duration;
      begin
         Put (Output, "    <Test");

--           if Test.Elapsed /= Time_Measure.Null_Time then
--              T := Get_Measure (Test.Elapsed);
--
--              Put (Output, " elapsed=""");
--              Put_Measure (T);
--              Put_Line (Output, """>");
--           else
            Put_Line (Output, ">");
--           end if;

         Put      (Output, "      <Name>");
         Put      (Output, Test.Test_Name.all);

         if Test.Routine_Name /= null then
            Put (Output, " : ");
            Put (Output, Test.Routine_Name.all);
         end if;

         Put_Line (Output, "</Name>");

         if Test.Failure /= null or else Test.Error /= null then
            if Test.Failure /= null then
               Is_Assert := True;
            else
               Is_Assert := False;
            end if;

            Put      (Output, "      <FailureType>");

            if Is_Assert then
               Put   (Output, "Assertion");
            else
               Put   (Output, "Error");
            end if;

            Put_Line (Output, "</FailureType>");
            Put      (Output, "      <Message>");
            if Is_Assert then
               Put   (Output, Test.Failure.Message.all);
            else
               Put   (Output, Test.Error.Exception_Name.all);
            end if;
            Put_Line (Output, "</Message>");

            if Is_Assert then
               Put_Line (Output, "      <Location>");
               Put      (Output, "        <File>");
               Put      (Output, Test.Failure.Source_Name.all);
               Put_Line (Output, "</File>");
               Put      (Output, "        <Line>");
               Put      (Output, Integer'Image(Test.Failure.Line));
               Put_Line (Output, "</Line>");
               Put_Line (Output, "      </Location>");

            else
               Put_Line (Output, "      <Exception>");
               Put      (Output, "      <Message>");
               Put      (Output, Test.Error.Exception_Name.all);
               Put_Line (Output, "</Message>");

               if Test.Error.Exception_Message /= null then
                  Put      (Output, "      <Information>");
                  Put      (Output, Test.Error.Exception_Message.all);
                  Put_Line (Output, "</Information>");
               end if;

               if Test.Error.Traceback /= null then
                  Put      (Output, "      <Traceback>");
                  Put      (Output, Test.Error.Traceback.all);
                  Put_Line (Output, "</Traceback>");
               end if;

               Put_Line (Output, "      </Exception>");
            end if;
         end if;

         Put_Line (Output, "    </Test>");
      end Report_Test;



   begin
      Create (File => Output,
              Mode => Out_File,
              Name => "aunit_report.xml");

      Put_Line (Output, "<?xml version='1.0' encoding='utf-8' ?>");
      Put      (Output, "<TestRun");

--        if Elapsed  (R) /= Time_Measure.Null_Time then
--           T := Get_Measure (Elapsed (R));
--
--           Put (Output, " elapsed=""");
--           Put_Measure (T);
--           Put_Line (Output, """>");
--        else
         Put_Line (Output, ">");
--        end if;

      Put_Line (Output, "  <Statistics>");
      Put      (Output, "    <Tests>");
      Put (Output, Integer'Image(Integer (Test_Count (R))));
      Put_Line (Output, "</Tests>");
      Put      (Output, "    <FailuresTotal>");
      Put (Output, Integer'Image(Integer (Failure_Count (R)) + Integer (Error_Count (R))));
      Put_Line (Output, "</FailuresTotal>");
      Put      (Output, "    <Failures>");
      Put (Output, Integer'Image(Integer (Failure_Count (R))));
      Put_Line (Output, "</Failures>");
      Put      (Output, "    <Errors>");
      Put (Output, Integer'Image(Integer (Error_Count (R))));
      Put_Line (Output, "</Errors>");
      Put_Line (Output, "  </Statistics>");

      declare
         S : Result_Lists.List;
      begin
         Put_Line (Output, "  <SuccessfulTests>");
         if Options.Report_Successes then
            Successes (R, S);
            Dump_Result_List (S);
         end if;
         Put_Line (Output, "  </SuccessfulTests>");
      end;

      Put_Line (Output, "  <FailedTests>");
      declare
         F : Result_Lists.List;
      begin
         Failures (R, F);
         Dump_Result_List (F);
      end;

      declare
         E : Result_Lists.List;
      begin
         Errors (R, E);
         Dump_Result_List (E);
      end;
      Put_Line (Output, "  </FailedTests>");

      Put_Line (Output, "</TestRun>");
      Close (Output);
   end Report;


end AUnit.Reporter.XML.File;
