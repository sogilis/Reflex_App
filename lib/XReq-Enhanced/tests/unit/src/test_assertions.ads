with Ada.Exceptions;       use Ada.Exceptions;

package Test_Assertions is

   generic
      with procedure Proc;
   procedure Assert_Except (Message : in String;
                            Err     : in Exception_Id := Null_Id);

   procedure Assert_Spawn  (Argument_String : in String;
                            Expected_Result : in Boolean := True;
                            Directory       : in String := "";
                            Executable_Name : in String := "bin/xreq");

end Test_Assertions;
