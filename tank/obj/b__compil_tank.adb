pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__compil_tank.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__compil_tank.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E075 : Short_Integer; pragma Import (Ada, E075, "system__os_lib_E");
   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
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
   E021 : Short_Integer; pragma Import (Ada, E021, "system__soft_links__initialize_E");
   E039 : Short_Integer; pragma Import (Ada, E039, "system__traceback__symbolic_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "ada__tags_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "ada__streams_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "system__file_control_block_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "system__finalization_root_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "ada__finalization_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "system__file_io_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "system__storage_pools_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "system__finalization_masters_E");
   E111 : Short_Integer; pragma Import (Ada, E111, "ada__text_io_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "system__pool_global_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "devices_E");
   E109 : Short_Integer; pragma Import (Ada, E109, "devices__blenders_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "devices__pumps_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "devices__resistances_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "devices__valves_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "ios_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "regul__ramps_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "tank__cycle_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "tank__filling_E");
   E150 : Short_Integer; pragma Import (Ada, E150, "tank__mixing_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "tank__variables_E");
   E148 : Short_Integer; pragma Import (Ada, E148, "tank__main_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E150 := E150 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "tank__mixing__finalize_spec");
      begin
         F1;
      end;
      E146 := E146 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "tank__filling__finalize_spec");
      begin
         F2;
      end;
      E144 := E144 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "tank__cycle__finalize_spec");
      begin
         F3;
      end;
      E135 := E135 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "devices__valves__finalize_spec");
      begin
         F4;
      end;
      E133 := E133 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "devices__resistances__finalize_spec");
      begin
         F5;
      end;
      E121 := E121 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "devices__pumps__finalize_spec");
      begin
         F6;
      end;
      E109 := E109 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "devices__blenders__finalize_spec");
      begin
         F7;
      end;
      E005 := E005 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "devices__finalize_spec");
      begin
         F8;
      end;
      E129 := E129 - 1;
      declare
         procedure F9;
         pragma Import (Ada, F9, "system__pool_global__finalize_spec");
      begin
         F9;
      end;
      E111 := E111 - 1;
      declare
         procedure F10;
         pragma Import (Ada, F10, "ada__text_io__finalize_spec");
      begin
         F10;
      end;
      E123 := E123 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "system__finalization_masters__finalize_spec");
      begin
         F11;
      end;
      declare
         procedure F12;
         pragma Import (Ada, F12, "system__file_io__finalize_body");
      begin
         E115 := E115 - 1;
         F12;
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
      E021 := E021 + 1;
      E013 := E013 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E039 := E039 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E101 := E101 + 1;
      Ada.Streams'Elab_Spec;
      E099 := E099 + 1;
      System.File_Control_Block'Elab_Spec;
      E119 := E119 + 1;
      System.Finalization_Root'Elab_Spec;
      E118 := E118 + 1;
      Ada.Finalization'Elab_Spec;
      E116 := E116 + 1;
      System.File_Io'Elab_Body;
      E115 := E115 + 1;
      System.Storage_Pools'Elab_Spec;
      E127 := E127 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E123 := E123 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E111 := E111 + 1;
      System.Pool_Global'Elab_Spec;
      E129 := E129 + 1;
      Devices'Elab_Spec;
      E005 := E005 + 1;
      Devices.Blenders'Elab_Spec;
      E109 := E109 + 1;
      Devices.Pumps'Elab_Spec;
      E121 := E121 + 1;
      Devices.Resistances'Elab_Spec;
      E133 := E133 + 1;
      Devices.Valves'Elab_Spec;
      E135 := E135 + 1;
      E137 := E137 + 1;
      E141 := E141 + 1;
      Tank.Cycle'Elab_Spec;
      E144 := E144 + 1;
      Tank.Filling'Elab_Spec;
      E146 := E146 + 1;
      Tank.Mixing'Elab_Spec;
      E150 := E150 + 1;
      Tank.Variables'Elab_Spec;
      E151 := E151 + 1;
      E148 := E148 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_compil_tank");

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
   --   /home/sogilis/sb/reflex_software/tank/obj/devices.o
   --   /home/sogilis/sb/reflex_software/tank/obj/devices-blenders.o
   --   /home/sogilis/sb/reflex_software/tank/obj/devices-pumps.o
   --   /home/sogilis/sb/reflex_software/tank/obj/devices-resistances.o
   --   /home/sogilis/sb/reflex_software/tank/obj/devices-valves.o
   --   /home/sogilis/sb/reflex_software/tank/obj/ext_ios.o
   --   /home/sogilis/sb/reflex_software/tank/obj/ios.o
   --   /home/sogilis/sb/reflex_software/tank/obj/regul.o
   --   /home/sogilis/sb/reflex_software/tank/obj/regul-ramps.o
   --   /home/sogilis/sb/reflex_software/tank/obj/tank.o
   --   /home/sogilis/sb/reflex_software/tank/obj/tank-cycle.o
   --   /home/sogilis/sb/reflex_software/tank/obj/tank-filling.o
   --   /home/sogilis/sb/reflex_software/tank/obj/tank-mixing.o
   --   /home/sogilis/sb/reflex_software/tank/obj/tank-variables.o
   --   /home/sogilis/sb/reflex_software/tank/obj/tank-main.o
   --   /home/sogilis/sb/reflex_software/tank/obj/compil_tank.o
   --   -L/home/sogilis/sb/reflex_software/tank/obj/
   --   -L/home/sogilis/sb/reflex_software/tank/obj/
   --   -L/home/sogilis/opt/GNAT/2019/lib/gcc/x86_64-pc-linux-gnu/8.3.1/adalib/
   --   -static
   --   -lgnat
   --   -ldl
--  END Object file/option list   

end ada_main;
