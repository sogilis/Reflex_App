with AUnit.Assertions;       use AUnit.Assertions;

with Ada.Strings.Unbounded;  use Ada.Strings.Unbounded;
with Ada.Directories;        use Ada.Directories;

with Ada.Strings;            use Ada.Strings;
with Ada.Strings.Fixed;      use Ada.Strings.Fixed;

with Util.IO;                use Util.IO;

package body Test_Assertions is

   procedure Assert_Except (Message : in String;
                            Err     : in Exception_Id := Null_Id)
   is
   begin
      Proc;
      Assert (False, "Exception " & Exception_Name (Err) &
              " should have been raised: " & Message);
   exception
      when E : others =>
         if Err /= Null_Id and Exception_Identity (E) /= Err then
            Reraise_Occurrence (E);
         end if;
   end Assert_Except;

   --  See <http://www.adacore.com/2008/11/24/gem-54/>
   procedure Assert_Spawn  (Argument_String : in String;
                            Expected_Result : in Boolean := True;
                            Directory       : in String := "";
                            Executable_Name : in String := "bin/xreq")
   is
      LF        : constant String := "" & ASCII.LF;
      Cmd_Line  : constant String := Executable_Name & " " & Argument_String;
      Buffer    : Unbounded_String;
      Ret_Code  : Integer;
      Success   : Boolean;
   begin
      if Directory = "" then
         Append (Buffer, "Current Directory: " & Current_Directory & LF);
      else
         Append (Buffer, "Current Directory: " & Directory & LF);
      end if;
      Append (Buffer, "Spawn: " & Cmd_Line & LF);
      Spawn (Executable_Name, Argument_String,
             Buffer, Success, Ret_Code, Directory);
      if Success then
         Append (Buffer, "Succeeded (" & Trim (Ret_Code'Img, Left));
      else
         Append (Buffer, "Failed (" & Trim (Ret_Code'Img, Left));
      end if;
      Append (Buffer, To_Unbounded_String ("): " & Cmd_Line & LF));
      Success := Ret_Code = 0;
      if Expected_Result then
         Assert (Success, "Failed: " & Cmd_Line & " (expected success):" &
                   LF & To_String (Buffer));
      else
         Assert (not Success, "Succeeded: " & Cmd_Line &
                   " (expected failure)" & LF & To_String (Buffer));
      end if;
   end Assert_Spawn;

end Test_Assertions;
