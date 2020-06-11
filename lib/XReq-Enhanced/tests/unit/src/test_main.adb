with AUnit.Run;
--  with AUnit.Reporter.Text;
--  with AUnit.Reporter.XML;
with AUnit.Reporter.XML.File;

with Composite_Suite;

procedure Test_Main is
   procedure Run is new AUnit.Run.Test_Runner (Composite_Suite.Suite);
--     Reporter : AUnit.Reporter.Text.Text_Reporter;
   Reporter : AUnit.Reporter.XML.File.XML_Reporter;
begin
   Run (Reporter);
end Test_Main;
