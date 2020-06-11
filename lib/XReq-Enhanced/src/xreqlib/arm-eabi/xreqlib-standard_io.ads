with Ada.Finalization;
with XReqLib.IO;

package XReqLib.Standard_IO is

   type T_Standard_IO is new Ada.Finalization.Controlled and
     XReqLib.IO.T_Output with private;

   type T_Standard_IO_Class_Access is access T_Standard_IO'Class;

   overriding
   procedure Put (This : in out T_Standard_IO; Item : String);

   overriding
   procedure Put (This : in out T_Standard_IO; Item : Character);

   overriding
   procedure Put_Line (This : in out T_Standard_IO; Item : String);

   overriding
   procedure New_Line (This : in out T_Standard_IO);

private
   type T_Standard_IO is new Ada.Finalization.Controlled and
     XReqLib.IO.T_Output with null record;

end XReqLib.Standard_IO;
