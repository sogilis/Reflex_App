with System.String_Hash;
with Ada.Strings.Unbounded;
with Ada.Containers;

function XReqLib.String_Hash
  (Key : Ada.Strings.Unbounded.Unbounded_String)
   return Ada.Containers.Hash_Type
is
   use Ada.Containers;
   function Hash is new System.String_Hash.Hash (Character, String, Hash_Type);
begin
   return Hash (Ada.Strings.Unbounded.To_String (Key));
end XReqLib.String_Hash;
