with XReqLib.General;
use  XReqLib.General;

package variable_steps is

  --  @given ^all variables are cleared$
  procedure Given_all_variables_are_cleared (args : in out Arg_Type);

  --  @given ^a variable ([^=]*)="([^"]*)"$
  --  @given ^a variable ([^=]*)=([^"]*)$
  --  @when  ^I set ([^=]*)="([^"]*)"$
  procedure Given_a_variable (args : in out Arg_Type);

  --  @then ^the variable (\S*) should contain "([^"]*)"$
  procedure Then_the_variable_should_contain (args : in out Arg_Type);

end variable_steps;
