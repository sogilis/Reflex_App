with Ada.Strings.Fixed;
with Ada.Strings.Maps.Constants;

use Ada.Strings.Fixed;
use Ada.Strings.Maps.Constants;

package body XReq.Target is

   function Get_Target (Target : String) return Target_Type is
      L : constant String := Translate (Target, Lower_Case_Map);
   begin
      if L = "x86_64" then
         return Target_x86_64;
      elsif L = "native" then
         return Target_x86_64;
      elsif L = "arm-eabi" then
         return Target_Arm_Eabi;
      else
         raise Invalid_Target with "Unknown target " & Target;
      end if;
   end Get_Target;

end XReq.Target;
