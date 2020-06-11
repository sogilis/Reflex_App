with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Finalization;

with XReqLib.IO;

package XReqLib.Standard_IO is

   type T_Standard_IO is
     new Ada.Finalization.Controlled and XReqLib.IO.T_Output with private;

   type T_Standard_IO_Class_Access is access T_Standard_IO'Class;

   type Local_File_Ptr is access Ada.Text_IO.File_Type;

   subtype File_Mode is Ada.Text_IO.File_Mode;

--     overriding procedure Buffer_Start (This : in out T_Standard_IO);
--
--     overriding procedure Buffer_Commit (This : in out T_Standard_IO);
--
--     overriding procedure Buffer_Discard (This : in out T_Standard_IO);
--
--     overriding function Buffered (This : in out T_Standard_IO) return Boolean;

   overriding procedure Put (This : in out T_Standard_IO; Item : String);

   overriding procedure Put (This : in out T_Standard_IO; Item : Character);

   overriding procedure Put_Line (This : in out T_Standard_IO; Item : String);

   overriding procedure New_Line (This : in out T_Standard_IO);

   overriding procedure Finalize (This : in out T_Standard_IO);

   procedure Create
     (This : in out T_Standard_IO;
      Mode :        File_Mode;
      Name :        String := "");

   procedure Close (This : in out T_Standard_IO);

private
   type T_Standard_IO is new Ada.Finalization.Controlled and
     XReqLib.IO.T_Output with
   record
      Output_Ownership : Boolean                 := False;
      Output_Ptr       : Local_File_Ptr          := new Ada.Text_IO.File_Type;
      Output_Access    : Ada.Text_IO.File_Access := Ada.Text_IO.Current_Output;
      Buffering        : Boolean                 := False;
      Buffer           : Ada.Strings.Unbounded.Unbounded_String;
   end record;

end XReqLib.Standard_IO;
