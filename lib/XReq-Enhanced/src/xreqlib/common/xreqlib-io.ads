package XReqLib.IO is

   type T_Output is interface;

   type T_Output_Class_Access is access all T_Output'Class;

   procedure Put (This : in out T_Output; Item : String) is abstract;

   procedure Put (This : in out T_Output; Item : Character) is abstract;

   procedure Put_Line (This : in out T_Output; Item : String) is abstract;

   procedure New_Line (This : in out T_Output) is abstract;

   procedure Initialize (This : in out T_Output) is null;

   procedure Finalize (This : in out T_Output) is null;

end XReqLib.IO;
