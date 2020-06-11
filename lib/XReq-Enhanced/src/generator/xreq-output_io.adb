with Ada.Strings.Fixed;
with Ada.Strings.Maps.Constants;

use Ada.Strings.Fixed;
use Ada.Strings.Maps.Constants;

package body XReq.Output_IO is

   function Get_Output_IO (Output_IO : String) return Output_IO_Type is
      L : constant String := Translate (Output_IO, Lower_Case_Map);
   begin
      if L = "standard" then
         return Output_IO_Std;
      elsif L = "serial" then
         return Output_IO_Serial;
      else
         raise Invalid_Output_IO with "Unknown Output_IO " & Output_IO;
      end if;
   end Get_Output_IO;

end XReq.Output_IO;
