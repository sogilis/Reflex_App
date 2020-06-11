with AUnit.Test_Caller;

with AUnit.Assertions;                   use AUnit.Assertions;

with Ada.Exceptions;                     use Ada.Exceptions;
with Ada.Strings.Unbounded;              use Ada.Strings.Unbounded;
with Ada.Containers;                     use Ada.Containers;
with Ada.Text_IO;
with Ada.Directories;

with Util.IO;                            use Util.IO;
with XReq.Lang;                          use XReq.Lang;
with XReq.Steps;                         use XReq.Steps;
with XReq.Steps.Handles;                 use XReq.Steps.Handles;
with XReq.Step_Definitions.Handles;      use XReq.Step_Definitions.Handles;
with XReq.Step_Definition_List.Handles;  use XReq.Step_Definition_List.Handles;

package body XReq_Steps_Definitions_Ada05_Test_Suite is

   package Caller is new AUnit.Test_Caller (Test_Case);

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := AUnit.Test_Suites.New_Suite;
   begin
      Ret.Add_Test (Caller.Create ("XReq-Steps_Definitions-Ada05: Test Parse_Dir", Test_Parse_Dir'Access));

      return Ret;
   end Suite;

   procedure Test_Parse_Dir (T : in out Test_Parse_Dir) is
      Directory : constant String := "data/features/step_definitions";
      Steps     : constant Step_File_List_Handle := Create;
      Step      : Ada_Step_File_Ptr;
      Found     : Boolean := False;
      I         : Natural;
   begin

      Parse_Directory (Steps, Std_Logger, Directory);

      Assert (Steps.R.Count >= 1,
              "Detected " & Steps.R.Count'Img & " steps instead of >= 1");

      I := Steps.R.First;
      while I < Steps.R.Last and not Found loop
         Step  := Ada_Step_File_Ptr (Steps.R.Element (I).R);
         Found := Simple_Name (File_Name (Step.all)) = "sample1.ads";
         Std_Logger.Put_Line ("Found step: " & File_Name (Step.all) & " (" &
                              Simple_Name (File_Name (Step.all)) & ")");
         I := I + 1;
      end loop;

      Assert (Found,
              "Should have detected step sample1.ads");

      Assert (Parsed (Step.all), "Should have parsed the step definition");

      Assert (Contains (Step.all, Stanza_Given ("this step works")),
              "The step definition should contain `Given this step works'");

   end Test_Parse_Dir;



end XReq_Steps_Definitions_Ada05_Test_Suite;
