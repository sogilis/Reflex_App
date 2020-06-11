with Ada.Strings.Unbounded;
with Ada.Containers.Vectors;

use Ada.Containers;
use Ada.Strings.Unbounded;

package XReqLib.Containers is

   ----------------------
   --  String_Vectors  --
   ----------------------

   package String_Vectors is new Vectors
     (Natural,
      Unbounded_String,
      "=");

   subtype String_Vector is String_Vectors.Vector;

   Empty_String_Vector : constant String_Vector := String_Vectors.Empty_Vector;


end XReqLib.Containers;
