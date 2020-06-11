--  Very simple reporter to console
package AUnit.Reporter.XML.File is

   type XML_Reporter is new Reporter with null record;

   procedure Report (Engine  : XML_Reporter;
                     R       : in out Result'Class;
                     Options : AUnit_Options := Default_Options);
end AUnit.Reporter.XML.File;
