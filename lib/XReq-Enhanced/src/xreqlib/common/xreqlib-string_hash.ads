with Ada.Strings.Unbounded;
with Ada.Containers;

function XReqLib.String_Hash
  (Key : Ada.Strings.Unbounded.Unbounded_String)
   return Ada.Containers.Hash_Type;
