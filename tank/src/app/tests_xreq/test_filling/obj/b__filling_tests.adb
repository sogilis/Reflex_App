pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__filling_tests.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__filling_tests.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E075 : Short_Integer; pragma Import (Ada, E075, "system__os_lib_E");
   E015 : Short_Integer; pragma Import (Ada, E015, "system__soft_links_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__exception_table_E");
   E040 : Short_Integer; pragma Import (Ada, E040, "ada__containers_E");
   E070 : Short_Integer; pragma Import (Ada, E070, "ada__io_exceptions_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "ada__strings_E");
   E057 : Short_Integer; pragma Import (Ada, E057, "ada__strings__maps_E");
   E061 : Short_Integer; pragma Import (Ada, E061, "ada__strings__maps__constants_E");
   E045 : Short_Integer; pragma Import (Ada, E045, "interfaces__c_E");
   E027 : Short_Integer; pragma Import (Ada, E027, "system__exceptions_E");
   E081 : Short_Integer; pragma Import (Ada, E081, "system__object_reader_E");
   E050 : Short_Integer; pragma Import (Ada, E050, "system__dwarf_lines_E");
   E017 : Short_Integer; pragma Import (Ada, E017, "system__soft_links__initialize_E");
   E039 : Short_Integer; pragma Import (Ada, E039, "system__traceback__symbolic_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "ada__tags_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "ada__streams_E");
   E234 : Short_Integer; pragma Import (Ada, E234, "gnat_E");
   E183 : Short_Integer; pragma Import (Ada, E183, "system__file_control_block_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "system__finalization_root_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "ada__finalization_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "system__file_io_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "system__storage_pools_E");
   E148 : Short_Integer; pragma Import (Ada, E148, "system__finalization_masters_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "system__storage_pools__subpools_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "ada__strings__unbounded_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "system__task_info_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "system__task_primitives__operations_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "ada__real_time_E");
   E178 : Short_Integer; pragma Import (Ada, E178, "ada__text_io_E");
   E238 : Short_Integer; pragma Import (Ada, E238, "gnat__directory_operations_E");
   E203 : Short_Integer; pragma Import (Ada, E203, "system__pool_global_E");
   E242 : Short_Integer; pragma Import (Ada, E242, "system__regexp_E");
   E236 : Short_Integer; pragma Import (Ada, E236, "gnat__command_line_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "tank__filling_E");
   E245 : Short_Integer; pragma Import (Ada, E245, "xreqlib__ansi_E");
   E186 : Short_Integer; pragma Import (Ada, E186, "xreqlib__asserts_E");
   E210 : Short_Integer; pragma Import (Ada, E210, "xreqlib__containers_E");
   E247 : Short_Integer; pragma Import (Ada, E247, "xreqlib__error_handling_E");
   E251 : Short_Integer; pragma Import (Ada, E251, "xreqlib__format_html_template_E");
   E254 : Short_Integer; pragma Import (Ada, E254, "xreqlib__io_E");
   E229 : Short_Integer; pragma Import (Ada, E229, "xreqlib__report_E");
   E253 : Short_Integer; pragma Import (Ada, E253, "xreqlib__standard_io_E");
   E209 : Short_Integer; pragma Import (Ada, E209, "xreqlib__string_hash_E");
   E218 : Short_Integer; pragma Import (Ada, E218, "xreqlib__tables_E");
   E212 : Short_Integer; pragma Import (Ada, E212, "xreqlib__string_tables_E");
   E262 : Short_Integer; pragma Import (Ada, E262, "xreqlib__util_E");
   E196 : Short_Integer; pragma Import (Ada, E196, "xreqlib__variables_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "xreqlib__args_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "step_definitions_E");
   E225 : Short_Integer; pragma Import (Ada, E225, "xreqlib__format_E");
   E256 : Short_Integer; pragma Import (Ada, E256, "xreqlib__format__base_E");
   E249 : Short_Integer; pragma Import (Ada, E249, "xreqlib__format__html_E");
   E258 : Short_Integer; pragma Import (Ada, E258, "xreqlib__format__multi_E");
   E260 : Short_Integer; pragma Import (Ada, E260, "xreqlib__format__text_E");
   E233 : Short_Integer; pragma Import (Ada, E233, "xreqlib__cli_E");
   E223 : Short_Integer; pragma Import (Ada, E223, "xreqlib__register_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "feature_test001_E");
   E231 : Short_Integer; pragma Import (Ada, E231, "feature_test_002_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E260 := E260 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "xreqlib__format__text__finalize_spec");
      begin
         F1;
      end;
      E258 := E258 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "xreqlib__format__multi__finalize_spec");
      begin
         F2;
      end;
      E249 := E249 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "xreqlib__format__html__finalize_spec");
      begin
         F3;
      end;
      E256 := E256 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "xreqlib__format__base__finalize_spec");
      begin
         F4;
      end;
      E225 := E225 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "xreqlib__format__finalize_spec");
      begin
         F5;
      end;
      E194 := E194 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "xreqlib__args__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "xreqlib__variables__finalize_body");
      begin
         E196 := E196 - 1;
         F7;
      end;
      declare
         procedure F8;
         pragma Import (Ada, F8, "xreqlib__variables__finalize_spec");
      begin
         F8;
      end;
      E212 := E212 - 1;
      declare
         procedure F9;
         pragma Import (Ada, F9, "xreqlib__string_tables__finalize_spec");
      begin
         F9;
      end;
      E253 := E253 - 1;
      declare
         procedure F10;
         pragma Import (Ada, F10, "xreqlib__standard_io__finalize_spec");
      begin
         F10;
      end;
      declare
         procedure F11;
         pragma Import (Ada, F11, "xreqlib__io__finalize_spec");
      begin
         E254 := E254 - 1;
         F11;
      end;
      declare
         procedure F12;
         pragma Import (Ada, F12, "xreqlib__containers__finalize_spec");
      begin
         E210 := E210 - 1;
         F12;
      end;
      E176 := E176 - 1;
      declare
         procedure F13;
         pragma Import (Ada, F13, "tank__filling__finalize_spec");
      begin
         F13;
      end;
      E242 := E242 - 1;
      declare
         procedure F14;
         pragma Import (Ada, F14, "system__regexp__finalize_spec");
      begin
         F14;
      end;
      E203 := E203 - 1;
      declare
         procedure F15;
         pragma Import (Ada, F15, "system__pool_global__finalize_spec");
      begin
         F15;
      end;
      E178 := E178 - 1;
      declare
         procedure F16;
         pragma Import (Ada, F16, "ada__text_io__finalize_spec");
      begin
         F16;
      end;
      E138 := E138 - 1;
      declare
         procedure F17;
         pragma Import (Ada, F17, "ada__strings__unbounded__finalize_spec");
      begin
         F17;
      end;
      E146 := E146 - 1;
      declare
         procedure F18;
         pragma Import (Ada, F18, "system__storage_pools__subpools__finalize_spec");
      begin
         F18;
      end;
      E148 := E148 - 1;
      declare
         procedure F19;
         pragma Import (Ada, F19, "system__finalization_masters__finalize_spec");
      begin
         F19;
      end;
      declare
         procedure F20;
         pragma Import (Ada, F20, "system__file_io__finalize_body");
      begin
         E182 := E182 - 1;
         F20;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Exception_Tracebacks : Integer;
      pragma Import (C, Exception_Tracebacks, "__gl_exception_tracebacks");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Exception_Tracebacks := 1;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E025 := E025 + 1;
      Ada.Containers'Elab_Spec;
      E040 := E040 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E070 := E070 + 1;
      Ada.Strings'Elab_Spec;
      E055 := E055 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E057 := E057 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E061 := E061 + 1;
      Interfaces.C'Elab_Spec;
      E045 := E045 + 1;
      System.Exceptions'Elab_Spec;
      E027 := E027 + 1;
      System.Object_Reader'Elab_Spec;
      E081 := E081 + 1;
      System.Dwarf_Lines'Elab_Spec;
      E050 := E050 + 1;
      System.Os_Lib'Elab_Body;
      E075 := E075 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E017 := E017 + 1;
      E015 := E015 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E039 := E039 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E130 := E130 + 1;
      Ada.Streams'Elab_Spec;
      E153 := E153 + 1;
      Gnat'Elab_Spec;
      E234 := E234 + 1;
      System.File_Control_Block'Elab_Spec;
      E183 := E183 + 1;
      System.Finalization_Root'Elab_Spec;
      E155 := E155 + 1;
      Ada.Finalization'Elab_Spec;
      E151 := E151 + 1;
      System.File_Io'Elab_Body;
      E182 := E182 + 1;
      System.Storage_Pools'Elab_Spec;
      E157 := E157 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E148 := E148 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E146 := E146 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E138 := E138 + 1;
      System.Task_Info'Elab_Spec;
      E116 := E116 + 1;
      System.Task_Primitives.Operations'Elab_Body;
      E108 := E108 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E099 := E099 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E178 := E178 + 1;
      Gnat.Directory_Operations'Elab_Spec;
      Gnat.Directory_Operations'Elab_Body;
      E238 := E238 + 1;
      System.Pool_Global'Elab_Spec;
      E203 := E203 + 1;
      System.Regexp'Elab_Spec;
      E242 := E242 + 1;
      Gnat.Command_Line'Elab_Spec;
      Gnat.Command_Line'Elab_Body;
      E236 := E236 + 1;
      Tank.Filling'Elab_Spec;
      Tank.Filling'Elab_Body;
      E176 := E176 + 1;
      E245 := E245 + 1;
      Xreqlib.Asserts'Elab_Spec;
      E186 := E186 + 1;
      Xreqlib.Containers'Elab_Spec;
      E210 := E210 + 1;
      E247 := E247 + 1;
      E251 := E251 + 1;
      Xreqlib.Io'Elab_Spec;
      E254 := E254 + 1;
      E229 := E229 + 1;
      Xreqlib.Standard_Io'Elab_Spec;
      Xreqlib.Standard_Io'Elab_Body;
      E253 := E253 + 1;
      E209 := E209 + 1;
      E218 := E218 + 1;
      Xreqlib.String_Tables'Elab_Spec;
      Xreqlib.String_Tables'Elab_Body;
      E212 := E212 + 1;
      Xreqlib.Util'Elab_Spec;
      E262 := E262 + 1;
      Xreqlib.Variables'Elab_Spec;
      Xreqlib.Variables'Elab_Body;
      E196 := E196 + 1;
      Xreqlib.Args'Elab_Spec;
      Xreqlib.Args'Elab_Body;
      E194 := E194 + 1;
      step_definitions'elab_body;
      E165 := E165 + 1;
      Xreqlib.Format'Elab_Spec;
      Xreqlib.Format'Elab_Body;
      E225 := E225 + 1;
      Xreqlib.Format.Base'Elab_Spec;
      Xreqlib.Format.Base'Elab_Body;
      E256 := E256 + 1;
      Xreqlib.Format.Html'Elab_Spec;
      Xreqlib.Format.Html'Elab_Body;
      E249 := E249 + 1;
      Xreqlib.Format.Multi'Elab_Spec;
      Xreqlib.Format.Multi'Elab_Body;
      E258 := E258 + 1;
      Xreqlib.Format.Text'Elab_Spec;
      Xreqlib.Format.Text'Elab_Body;
      E260 := E260 + 1;
      E233 := E233 + 1;
      E223 := E223 + 1;
      feature_test001'elab_body;
      E136 := E136 + 1;
      feature_test_002'elab_body;
      E231 := E231 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_filling_tests");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /home/sogilis/sb/reflex_software/tank/src/app/tests_xreq/test_filling/obj/tank.o
   --   /home/sogilis/sb/reflex_software/tank/src/app/tests_xreq/test_filling/obj/tank-filling.o
   --   /home/sogilis/sb/reflex_software/tank/src/app/tests_xreq/test_filling/obj/step_definitions.o
   --   /home/sogilis/sb/reflex_software/tank/src/app/tests_xreq/test_filling/obj/feature_test001.o
   --   /home/sogilis/sb/reflex_software/tank/src/app/tests_xreq/test_filling/obj/feature_test_002.o
   --   /home/sogilis/sb/reflex_software/tank/src/app/tests_xreq/test_filling/obj/filling_tests.o
   --   -L/home/sogilis/sb/reflex_software/tank/src/app/tests_xreq/test_filling/obj/
   --   -L/home/sogilis/sb/reflex_software/tank/src/app/tests_xreq/test_filling/obj/
   --   -L/home/sogilis/sb/reflex_software/lib/XReq-Enhanced/build/lib/development/native/
   --   -L/home/sogilis/opt/GNAT/2019/lib/gcc/x86_64-pc-linux-gnu/8.3.1/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
   --   -lrt
   --   -lpthread
   --   -ldl
--  END Object file/option list   

end ada_main;
