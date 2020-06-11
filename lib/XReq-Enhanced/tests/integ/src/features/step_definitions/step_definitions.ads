with XReqLib.Args;
use  XReqLib.Args;
package step_definitions is

   --  @given ^xreq is in the PATH$
   procedure Given_xreq_is_in_the_PATH (Args : in out Arg_Type);

   --  @given ^I am in the xreq directory$
   procedure Given_I_am_in_the_xreq_directory (Args : in out Arg_Type);

   --  @given ^a file "([^"]*)":$
   procedure Given_a_file (Args : in out Arg_Type);

   --  @when ^I run the test suite "(.*)" in (.*)$
   procedure When_I_run_the_test_suite_SUITE_in_X (Args : in out Arg_Type);

   --  @when ^I run xreq (.*)$
   procedure When_I_run_xreq_CMD (Args : in out Arg_Type);

   --  @when ^I run (.*) xreq (.*)$
   procedure When_I_run_xreq_with_env_CMD (Args : in out Arg_Type);

   --  @when ^I run "(.*)" in (.*)$
   procedure When_I_run_CMD_in_X (Args : in out Arg_Type);

   --  @when ^I run "([^"]*)"$
   procedure When_I_run (Args : in out Arg_Type);

   --  @when ^I compile "(.*)" in (.*)$
   procedure When_I_compile_X_in_Y (Args : in out Arg_Type);

   --  @then ^"([^\"]*)" should exist$
   procedure Then_file_should_exist (Args : in out Arg_Type);

   --  @then ^it should (pass|fail)$
   procedure Then_it_should_pass_fail (Args : in out Arg_Type);

   --  @then ^it should (pass|fail) with$
   procedure Then_it_should_pass_fail_with (Args : in out Arg_Type);

   --  @then  ^the output should contain$
   procedure Then_the_output_should_contain (Args : in out Arg_Type);

   --  @then  ^the output (shouldn't|should not) contain$
   procedure Then_the_output_should_not_contain (Args : in out Arg_Type);

   procedure Set_Up (Feature_File : in String);

   procedure Tear_Down (Feature_File : in String);

--  @xreq insert above

end step_definitions;
