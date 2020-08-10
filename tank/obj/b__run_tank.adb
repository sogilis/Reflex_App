pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__run_tank.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__run_tank.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E077 : Short_Integer; pragma Import (Ada, E077, "system__os_lib_E");
   E015 : Short_Integer; pragma Import (Ada, E015, "system__soft_links_E");
   E027 : Short_Integer; pragma Import (Ada, E027, "system__exception_table_E");
   E042 : Short_Integer; pragma Import (Ada, E042, "ada__containers_E");
   E072 : Short_Integer; pragma Import (Ada, E072, "ada__io_exceptions_E");
   E057 : Short_Integer; pragma Import (Ada, E057, "ada__strings_E");
   E059 : Short_Integer; pragma Import (Ada, E059, "ada__strings__maps_E");
   E063 : Short_Integer; pragma Import (Ada, E063, "ada__strings__maps__constants_E");
   E047 : Short_Integer; pragma Import (Ada, E047, "interfaces__c_E");
   E029 : Short_Integer; pragma Import (Ada, E029, "system__exceptions_E");
   E083 : Short_Integer; pragma Import (Ada, E083, "system__object_reader_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "system__dwarf_lines_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__soft_links__initialize_E");
   E041 : Short_Integer; pragma Import (Ada, E041, "system__traceback__symbolic_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "ada__tags_E");
   E105 : Short_Integer; pragma Import (Ada, E105, "ada__streams_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "system__file_control_block_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "system__finalization_root_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "ada__finalization_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "system__file_io_E");
   E181 : Short_Integer; pragma Import (Ada, E181, "system__storage_pools_E");
   E177 : Short_Integer; pragma Import (Ada, E177, "system__finalization_masters_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__calendar_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__calendar__delays_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "ada__text_io_E");
   E183 : Short_Integer; pragma Import (Ada, E183, "system__pool_global_E");
   E169 : Short_Integer; pragma Import (Ada, E169, "devices_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "devices__blenders_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "devices__pumps_E");
   E195 : Short_Integer; pragma Import (Ada, E195, "devices__valves_E");
   E197 : Short_Integer; pragma Import (Ada, E197, "ios_E");
   E201 : Short_Integer; pragma Import (Ada, E201, "regul__ramps_E");
   E191 : Short_Integer; pragma Import (Ada, E191, "rx__library__analogs_E");
   E193 : Short_Integer; pragma Import (Ada, E193, "rx__library__analogs__pid_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "rxclock_E");
   E187 : Short_Integer; pragma Import (Ada, E187, "devices__resistances_E");
   E203 : Short_Integer; pragma Import (Ada, E203, "tank__cycle_E");
   E205 : Short_Integer; pragma Import (Ada, E205, "tank__filling_E");
   E207 : Short_Integer; pragma Import (Ada, E207, "tank__mixing_E");
   E208 : Short_Integer; pragma Import (Ada, E208, "tank__variables_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "tank__main_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E207 := E207 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "tank__mixing__finalize_spec");
      begin
         F1;
      end;
      E205 := E205 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "tank__filling__finalize_spec");
      begin
         F2;
      end;
      E203 := E203 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "tank__cycle__finalize_spec");
      begin
         F3;
      end;
      E187 := E187 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "devices__resistances__finalize_spec");
      begin
         F4;
      end;
      E193 := E193 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "rx__library__analogs__pid__finalize_spec");
      begin
         F5;
      end;
      E195 := E195 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "devices__valves__finalize_spec");
      begin
         F6;
      end;
      E175 := E175 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "devices__pumps__finalize_spec");
      begin
         F7;
      end;
      E173 := E173 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "devices__blenders__finalize_spec");
      begin
         F8;
      end;
      E169 := E169 - 1;
      declare
         procedure F9;
         pragma Import (Ada, F9, "devices__finalize_spec");
      begin
         F9;
      end;
      E183 := E183 - 1;
      declare
         procedure F10;
         pragma Import (Ada, F10, "system__pool_global__finalize_spec");
      begin
         F10;
      end;
      E103 := E103 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "ada__text_io__finalize_spec");
      begin
         F11;
      end;
      E177 := E177 - 1;
      declare
         procedure F12;
         pragma Import (Ada, F12, "system__finalization_masters__finalize_spec");
      begin
         F12;
      end;
      declare
         procedure F13;
         pragma Import (Ada, F13, "system__file_io__finalize_body");
      begin
         E115 := E115 - 1;
         F13;
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
      E027 := E027 + 1;
      Ada.Containers'Elab_Spec;
      E042 := E042 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E072 := E072 + 1;
      Ada.Strings'Elab_Spec;
      E057 := E057 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E059 := E059 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E063 := E063 + 1;
      Interfaces.C'Elab_Spec;
      E047 := E047 + 1;
      System.Exceptions'Elab_Spec;
      E029 := E029 + 1;
      System.Object_Reader'Elab_Spec;
      E083 := E083 + 1;
      System.Dwarf_Lines'Elab_Spec;
      E052 := E052 + 1;
      System.Os_Lib'Elab_Body;
      E077 := E077 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E023 := E023 + 1;
      E015 := E015 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E041 := E041 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E107 := E107 + 1;
      Ada.Streams'Elab_Spec;
      E105 := E105 + 1;
      System.File_Control_Block'Elab_Spec;
      E119 := E119 + 1;
      System.Finalization_Root'Elab_Spec;
      E118 := E118 + 1;
      Ada.Finalization'Elab_Spec;
      E116 := E116 + 1;
      System.File_Io'Elab_Body;
      E115 := E115 + 1;
      System.Storage_Pools'Elab_Spec;
      E181 := E181 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E177 := E177 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E008 := E008 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E006 := E006 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E103 := E103 + 1;
      System.Pool_Global'Elab_Spec;
      E183 := E183 + 1;
      Devices'Elab_Spec;
      E169 := E169 + 1;
      Devices.Blenders'Elab_Spec;
      E173 := E173 + 1;
      Devices.Pumps'Elab_Spec;
      E175 := E175 + 1;
      Devices.Valves'Elab_Spec;
      E195 := E195 + 1;
      E197 := E197 + 1;
      E201 := E201 + 1;
      E191 := E191 + 1;
      Rx.Library.Analogs.Pid'Elab_Spec;
      E193 := E193 + 1;
      E121 := E121 + 1;
      Devices.Resistances'Elab_Spec;
      E187 := E187 + 1;
      Tank.Cycle'Elab_Spec;
      E203 := E203 + 1;
      Tank.Filling'Elab_Spec;
      E205 := E205 + 1;
      Tank.Mixing'Elab_Spec;
      E207 := E207 + 1;
      Tank.Variables'Elab_Spec;
      E208 := E208 + 1;
      E132 := E132 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_run_tank");

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
   --   /home/sogilis/sb/reflex_software/tank/obj/devices-valves.o
   --   /home/sogilis/sb/reflex_software/tank/obj/ext_ios.o
   --   /home/sogilis/sb/reflex_software/tank/obj/ios.o
   --   /home/sogilis/sb/reflex_software/tank/obj/regul.o
   --   /home/sogilis/sb/reflex_software/tank/obj/regul-ramps.o
   --   /home/sogilis/sb/reflex_software/tank/obj/rx.o
   --   /home/sogilis/sb/reflex_software/tank/obj/rx-library.o
   --   /home/sogilis/sb/reflex_software/tank/obj/rx-library-analogs.o
   --   /home/sogilis/sb/reflex_software/tank/obj/rx-library-analogs-pid.o
   --   /home/sogilis/sb/reflex_software/tank/obj/rxclock.o
   --   /home/sogilis/sb/reflex_software/tank/obj/devices-resistances.o
   --   /home/sogilis/sb/reflex_software/tank/obj/tank.o
   --   /home/sogilis/sb/reflex_software/tank/obj/tank-cycle.o
   --   /home/sogilis/sb/reflex_software/tank/obj/tank-filling.o
   --   /home/sogilis/sb/reflex_software/tank/obj/tank-mixing.o
   --   /home/sogilis/sb/reflex_software/tank/obj/tank-variables.o
   --   /home/sogilis/sb/reflex_software/tank/obj/tank-main.o
   --   /home/sogilis/sb/reflex_software/tank/obj/run_tank.o
   --   -L/home/sogilis/sb/reflex_software/tank/obj/
   --   -L/home/sogilis/sb/reflex_software/tank/obj/
   --   -L/home/sogilis/opt/GNAT/2019/lib/gcc/x86_64-pc-linux-gnu/8.3.1/adalib/
   --   -static
   --   -lgnat
   --   -ldl
--  END Object file/option list   

end ada_main;
