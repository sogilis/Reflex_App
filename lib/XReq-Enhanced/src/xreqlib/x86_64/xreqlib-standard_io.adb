with Ada.Unchecked_Deallocation;
--  with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body XReqLib.Standard_IO is

--     procedure Buffer_Start (This : in out T_Standard_IO) is
--     begin
--        pragma Assert (not This.Buffering);
--        This.Buffering := True;
--        This.Buffer    := Null_Unbounded_String;
--     end Buffer_Start;
--
--     procedure Buffer_Commit (This : in out T_Standard_IO) is
--     begin
--        This.Buffering := False;
--        This.Put (To_String (This.Buffer));
--        This.Buffer := Null_Unbounded_String;
--     end Buffer_Commit;
--
--     procedure Buffer_Discard (This : in out T_Standard_IO) is
--     begin
--        This.Buffering := False;
--        This.Buffer    := Null_Unbounded_String;
--     end Buffer_Discard;
--
--     function Buffered (This : in out T_Standard_IO) return Boolean is
--     begin
--        return This.Buffering;
--     end Buffered;

   procedure Put (This : in out T_Standard_IO; Item : String) is
   begin
--        if This.Buffering then
--           Append (This.Buffer, Item);
--        elsif
      if This.Output_Ownership then
         Ada.Text_IO.Put (This.Output_Ptr.all, Item);
      else
         Ada.Text_IO.Put (This.Output_Access.all, Item);
      end if;
   end Put;

   procedure Put (This : in out T_Standard_IO; Item : Character) is
   begin
      This.Put ("" & Item);
   end Put;

   procedure Put_Line (This : in out T_Standard_IO; Item : String) is
   begin
--        if This.Buffering then
--           Append (This.Buffer, Item & ASCII.LF);
--        elsif
      if This.Output_Ownership then
         Ada.Text_IO.Put_Line (This.Output_Ptr.all, Item);
      else
         Ada.Text_IO.Put_Line (This.Output_Access.all, Item);
      end if;
   end Put_Line;

   procedure New_Line (This : in out T_Standard_IO) is
   begin
--        if This.Buffering then
--           Append (This.Buffer, "" & ASCII.LF);
--        elsif
      if This.Output_Ownership then
         Ada.Text_IO.New_Line (This.Output_Ptr.all);
      else
         Ada.Text_IO.New_Line (This.Output_Access.all);
      end if;
   end New_Line;

   procedure Create
     (This : in out T_Standard_IO;
      Mode :        File_Mode;
      Name :        String := "")
   is
   begin
      This.Close;
      This.Output_Ownership := True;
      Ada.Text_IO.Create (This.Output_Ptr.all, Mode, Name);
   end Create;

   procedure Close (This : in out T_Standard_IO) is
   begin
      if Ada.Text_IO.Is_Open (This.Output_Ptr.all) then
         Ada.Text_IO.Close (This.Output_Ptr.all);
      end if;
   end Close;

   procedure Finalize (This : in out T_Standard_IO) is
      procedure Free is new Ada.Unchecked_Deallocation
        (Ada.Text_IO.File_Type,
         Local_File_Ptr);
   begin
      if This.Output_Ptr /= null then
         This.Close;
         Free (This.Output_Ptr);
      end if;
   end Finalize;

end XReqLib.Standard_IO;
