-- This is a "patch" package to avoid modifying existing generated code
-- that 'with' XReqLib.General instead of only XReqLib.Args

with XReqLib.Args; use XReqLib.Args;

package XReqLib.General is

   subtype Arg_Type is XReqLib.Args.Arg_Type;

end XReqLib.General;

