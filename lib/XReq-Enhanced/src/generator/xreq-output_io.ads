package XReq.Output_IO is

   Invalid_Output_IO : exception;

   type Output_IO_Type is (Output_IO_Std, Output_IO_Serial);

   function Get_Output_IO (Output_IO : String) return Output_IO_Type;

end XReq.Output_IO;
