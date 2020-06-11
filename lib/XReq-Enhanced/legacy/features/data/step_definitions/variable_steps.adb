package body variable_steps is

  procedure Given_all_variables_are_cleared (args : in out Arg_Type) is
  begin
    args.clear_globals;
  end Given_all_variables_are_cleared;

  procedure Given_a_variable (args : in out Arg_Type) is
    name  : constant string := args.match(1);
    value : constant string := args.match(2, replace => true);
  begin
    args.add_para ("Set variable " & name & "=" & value);
    args.set_global(name, value);
  end given_a_variable;
  
  procedure Then_the_variable_should_contain (args : in out Arg_Type) is
    mismatch : exception;
    varname  : constant String := args.match(1, replace => true);
    value    : constant string := args.get_global(varname);
    expected : constant string := args.match(2, replace => true);
  begin
    if value /= expected then
      args.add_para ("Content of variable " & varname);
      args.add_text (value);
      args.add_para ("Expected text:");
      args.add_text (expected);
      raise mismatch with "variable " & args.match (1);
    end if;
  end then_the_variable_should_contain;
  
end variable_steps;
