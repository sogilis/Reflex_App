with Ada.Text_IO;

package body XReqLib.Standard_IO is

   procedure Put (This : in out T_Standard_IO; Item : String) is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put (Item);
   end Put;

   procedure Put (This : in out T_Standard_IO; Item : Character) is
   begin
      This.Put ("" & Item);
   end Put;

   procedure Put_Line (This : in out T_Standard_IO; Item : String) is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item);
   end Put_Line;

   procedure New_Line (This : in out T_Standard_IO) is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.New_Line;
   end New_Line;

end XReqLib.Standard_IO;
