pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__build_rxrt.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__build_rxrt.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E17 : Short_Integer; pragma Import (Ada, E17, "system__soft_links_E");
   E27 : Short_Integer; pragma Import (Ada, E27, "system__exception_table_E");
   E50 : Short_Integer; pragma Import (Ada, E50, "ada__strings_E");
   E52 : Short_Integer; pragma Import (Ada, E52, "ada__strings__maps_E");
   E56 : Short_Integer; pragma Import (Ada, E56, "ada__strings__maps__constants_E");
   E67 : Short_Integer; pragma Import (Ada, E67, "interfaces__c_E");
   E29 : Short_Integer; pragma Import (Ada, E29, "system__exceptions_E");
   E65 : Short_Integer; pragma Import (Ada, E65, "system__object_reader_E");
   E45 : Short_Integer; pragma Import (Ada, E45, "system__dwarf_lines_E");
   E21 : Short_Integer; pragma Import (Ada, E21, "system__secondary_stack_E");
   E40 : Short_Integer; pragma Import (Ada, E40, "system__traceback__symbolic_E");
   E05 : Short_Integer; pragma Import (Ada, E05, "rxrt_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

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
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
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

      Runtime_Initialize (1);

      Finalize_Library_Objects := null;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E27 := E27 + 1;
      Ada.Strings'Elab_Spec;
      E50 := E50 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E56 := E56 + 1;
      Interfaces.C'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E29 := E29 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      E67 := E67 + 1;
      E52 := E52 + 1;
      System.Soft_Links'Elab_Body;
      E17 := E17 + 1;
      System.Secondary_Stack'Elab_Body;
      E21 := E21 + 1;
      E45 := E45 + 1;
      E65 := E65 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E40 := E40 + 1;
      E05 := E05 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_build_rxrt");

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
   --   D:\home\jean\nrx\reflex-lib\rxlib\runtime\tests\obj\rxrt.o
   --   D:\home\jean\nrx\reflex-lib\rxlib\runtime\tests\obj\rxrt-rxclock.o
   --   D:\home\jean\nrx\reflex-lib\rxlib\runtime\tests\obj\rxrt-tasks.o
   --   D:\home\jean\nrx\reflex-lib\rxlib\runtime\tests\obj\build_rxrt.o
   --   -LD:\home\jean\nrx\reflex-lib\rxlib\runtime\tests\obj\
   --   -LD:\home\jean\nrx\reflex-lib\rxlib\runtime\tests\obj\
   --   -LD:\home\jean\nrx\reflex-lib\rxlib\runtime\reflex\emu\lib\release\relocatable\
   --   -LC:/gnat/2016/lib/gcc/i686-pc-mingw32/4.9.4/adalib/
   --   -shared
   --   -lgnat-2016
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
