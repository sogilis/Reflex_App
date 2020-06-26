pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: Community 2019 (20190517-83)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_regul_tests" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#213b8bd1#;
   pragma Export (C, u00001, "regul_testsB");
   u00002 : constant Version_32 := 16#050ff2f0#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#4113f22b#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#4fc9bc76#;
   pragma Export (C, u00005, "ada__command_lineB");
   u00006 : constant Version_32 := 16#3cdef8c9#;
   pragma Export (C, u00006, "ada__command_lineS");
   u00007 : constant Version_32 := 16#4635ec04#;
   pragma Export (C, u00007, "systemS");
   u00008 : constant Version_32 := 16#f32b4133#;
   pragma Export (C, u00008, "system__secondary_stackB");
   u00009 : constant Version_32 := 16#03a1141d#;
   pragma Export (C, u00009, "system__secondary_stackS");
   u00010 : constant Version_32 := 16#9762c9f2#;
   pragma Export (C, u00010, "ada__exceptionsB");
   u00011 : constant Version_32 := 16#585ef86b#;
   pragma Export (C, u00011, "ada__exceptionsS");
   u00012 : constant Version_32 := 16#5726abed#;
   pragma Export (C, u00012, "ada__exceptions__last_chance_handlerB");
   u00013 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00013, "ada__exceptions__last_chance_handlerS");
   u00014 : constant Version_32 := 16#ae860117#;
   pragma Export (C, u00014, "system__soft_linksB");
   u00015 : constant Version_32 := 16#0336e7b2#;
   pragma Export (C, u00015, "system__soft_linksS");
   u00016 : constant Version_32 := 16#75bf515c#;
   pragma Export (C, u00016, "system__soft_links__initializeB");
   u00017 : constant Version_32 := 16#5697fc2b#;
   pragma Export (C, u00017, "system__soft_links__initializeS");
   u00018 : constant Version_32 := 16#86dbf443#;
   pragma Export (C, u00018, "system__parametersB");
   u00019 : constant Version_32 := 16#0ed9b82f#;
   pragma Export (C, u00019, "system__parametersS");
   u00020 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00020, "system__stack_checkingB");
   u00021 : constant Version_32 := 16#c88a87ec#;
   pragma Export (C, u00021, "system__stack_checkingS");
   u00022 : constant Version_32 := 16#ced09590#;
   pragma Export (C, u00022, "system__storage_elementsB");
   u00023 : constant Version_32 := 16#6bf6a600#;
   pragma Export (C, u00023, "system__storage_elementsS");
   u00024 : constant Version_32 := 16#34742901#;
   pragma Export (C, u00024, "system__exception_tableB");
   u00025 : constant Version_32 := 16#1b9b8546#;
   pragma Export (C, u00025, "system__exception_tableS");
   u00026 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00026, "system__exceptionsB");
   u00027 : constant Version_32 := 16#2e5681f2#;
   pragma Export (C, u00027, "system__exceptionsS");
   u00028 : constant Version_32 := 16#69416224#;
   pragma Export (C, u00028, "system__exceptions__machineB");
   u00029 : constant Version_32 := 16#d27d9682#;
   pragma Export (C, u00029, "system__exceptions__machineS");
   u00030 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00030, "system__exceptions_debugB");
   u00031 : constant Version_32 := 16#38bf15c0#;
   pragma Export (C, u00031, "system__exceptions_debugS");
   u00032 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00032, "system__img_intB");
   u00033 : constant Version_32 := 16#44ee0cc6#;
   pragma Export (C, u00033, "system__img_intS");
   u00034 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00034, "system__tracebackB");
   u00035 : constant Version_32 := 16#181732c0#;
   pragma Export (C, u00035, "system__tracebackS");
   u00036 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00036, "system__traceback_entriesB");
   u00037 : constant Version_32 := 16#466e1a74#;
   pragma Export (C, u00037, "system__traceback_entriesS");
   u00038 : constant Version_32 := 16#448e9548#;
   pragma Export (C, u00038, "system__traceback__symbolicB");
   u00039 : constant Version_32 := 16#c84061d1#;
   pragma Export (C, u00039, "system__traceback__symbolicS");
   u00040 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00040, "ada__containersS");
   u00041 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00041, "ada__exceptions__tracebackB");
   u00042 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00042, "ada__exceptions__tracebackS");
   u00043 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00043, "interfacesS");
   u00044 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00044, "interfaces__cB");
   u00045 : constant Version_32 := 16#467817d8#;
   pragma Export (C, u00045, "interfaces__cS");
   u00046 : constant Version_32 := 16#e865e681#;
   pragma Export (C, u00046, "system__bounded_stringsB");
   u00047 : constant Version_32 := 16#31c8cd1d#;
   pragma Export (C, u00047, "system__bounded_stringsS");
   u00048 : constant Version_32 := 16#0062635e#;
   pragma Export (C, u00048, "system__crtlS");
   u00049 : constant Version_32 := 16#bba79bcb#;
   pragma Export (C, u00049, "system__dwarf_linesB");
   u00050 : constant Version_32 := 16#9a78d181#;
   pragma Export (C, u00050, "system__dwarf_linesS");
   u00051 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00051, "ada__charactersS");
   u00052 : constant Version_32 := 16#8f637df8#;
   pragma Export (C, u00052, "ada__characters__handlingB");
   u00053 : constant Version_32 := 16#3b3f6154#;
   pragma Export (C, u00053, "ada__characters__handlingS");
   u00054 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00054, "ada__characters__latin_1S");
   u00055 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00055, "ada__stringsS");
   u00056 : constant Version_32 := 16#96df1a3f#;
   pragma Export (C, u00056, "ada__strings__mapsB");
   u00057 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00057, "ada__strings__mapsS");
   u00058 : constant Version_32 := 16#d68fb8f1#;
   pragma Export (C, u00058, "system__bit_opsB");
   u00059 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00059, "system__bit_opsS");
   u00060 : constant Version_32 := 16#72b39087#;
   pragma Export (C, u00060, "system__unsigned_typesS");
   u00061 : constant Version_32 := 16#92f05f13#;
   pragma Export (C, u00061, "ada__strings__maps__constantsS");
   u00062 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00062, "system__address_imageB");
   u00063 : constant Version_32 := 16#e7d9713e#;
   pragma Export (C, u00063, "system__address_imageS");
   u00064 : constant Version_32 := 16#ec78c2bf#;
   pragma Export (C, u00064, "system__img_unsB");
   u00065 : constant Version_32 := 16#ed47ac70#;
   pragma Export (C, u00065, "system__img_unsS");
   u00066 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00066, "system__ioB");
   u00067 : constant Version_32 := 16#d8771b4b#;
   pragma Export (C, u00067, "system__ioS");
   u00068 : constant Version_32 := 16#f790d1ef#;
   pragma Export (C, u00068, "system__mmapB");
   u00069 : constant Version_32 := 16#7c445363#;
   pragma Export (C, u00069, "system__mmapS");
   u00070 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00070, "ada__io_exceptionsS");
   u00071 : constant Version_32 := 16#917e91ec#;
   pragma Export (C, u00071, "system__mmap__os_interfaceB");
   u00072 : constant Version_32 := 16#1f56acd1#;
   pragma Export (C, u00072, "system__mmap__os_interfaceS");
   u00073 : constant Version_32 := 16#1ee9caf8#;
   pragma Export (C, u00073, "system__mmap__unixS");
   u00074 : constant Version_32 := 16#aa19c9d7#;
   pragma Export (C, u00074, "system__os_libB");
   u00075 : constant Version_32 := 16#d8e681fb#;
   pragma Export (C, u00075, "system__os_libS");
   u00076 : constant Version_32 := 16#ec4d5631#;
   pragma Export (C, u00076, "system__case_utilB");
   u00077 : constant Version_32 := 16#79e05a50#;
   pragma Export (C, u00077, "system__case_utilS");
   u00078 : constant Version_32 := 16#2a8e89ad#;
   pragma Export (C, u00078, "system__stringsB");
   u00079 : constant Version_32 := 16#2623c091#;
   pragma Export (C, u00079, "system__stringsS");
   u00080 : constant Version_32 := 16#5a3f5337#;
   pragma Export (C, u00080, "system__object_readerB");
   u00081 : constant Version_32 := 16#82413105#;
   pragma Export (C, u00081, "system__object_readerS");
   u00082 : constant Version_32 := 16#fb020d94#;
   pragma Export (C, u00082, "system__val_lliB");
   u00083 : constant Version_32 := 16#2a5b7ef4#;
   pragma Export (C, u00083, "system__val_lliS");
   u00084 : constant Version_32 := 16#b8e72903#;
   pragma Export (C, u00084, "system__val_lluB");
   u00085 : constant Version_32 := 16#1f7d1d65#;
   pragma Export (C, u00085, "system__val_lluS");
   u00086 : constant Version_32 := 16#269742a9#;
   pragma Export (C, u00086, "system__val_utilB");
   u00087 : constant Version_32 := 16#ea955afa#;
   pragma Export (C, u00087, "system__val_utilS");
   u00088 : constant Version_32 := 16#d7bf3f29#;
   pragma Export (C, u00088, "system__exception_tracesB");
   u00089 : constant Version_32 := 16#62eacc9e#;
   pragma Export (C, u00089, "system__exception_tracesS");
   u00090 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00090, "system__wch_conB");
   u00091 : constant Version_32 := 16#5d48ced6#;
   pragma Export (C, u00091, "system__wch_conS");
   u00092 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00092, "system__wch_stwB");
   u00093 : constant Version_32 := 16#7059e2d7#;
   pragma Export (C, u00093, "system__wch_stwS");
   u00094 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00094, "system__wch_cnvB");
   u00095 : constant Version_32 := 16#52ff7425#;
   pragma Export (C, u00095, "system__wch_cnvS");
   u00096 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00096, "system__wch_jisB");
   u00097 : constant Version_32 := 16#d28f6d04#;
   pragma Export (C, u00097, "system__wch_jisS");
   u00098 : constant Version_32 := 16#eb4fc41d#;
   pragma Export (C, u00098, "ada__real_timeB");
   u00099 : constant Version_32 := 16#69ea8064#;
   pragma Export (C, u00099, "ada__real_timeS");
   u00100 : constant Version_32 := 16#c05c480c#;
   pragma Export (C, u00100, "system__taskingB");
   u00101 : constant Version_32 := 16#d15fc24c#;
   pragma Export (C, u00101, "system__taskingS");
   u00102 : constant Version_32 := 16#0894e9be#;
   pragma Export (C, u00102, "system__task_primitivesS");
   u00103 : constant Version_32 := 16#c9728a70#;
   pragma Export (C, u00103, "system__os_interfaceB");
   u00104 : constant Version_32 := 16#8a148a4c#;
   pragma Export (C, u00104, "system__os_interfaceS");
   u00105 : constant Version_32 := 16#ff1f7771#;
   pragma Export (C, u00105, "system__linuxS");
   u00106 : constant Version_32 := 16#d32fe2fa#;
   pragma Export (C, u00106, "system__os_constantsS");
   u00107 : constant Version_32 := 16#f7997819#;
   pragma Export (C, u00107, "system__task_primitives__operationsB");
   u00108 : constant Version_32 := 16#a249a2c5#;
   pragma Export (C, u00108, "system__task_primitives__operationsS");
   u00109 : constant Version_32 := 16#71c5de81#;
   pragma Export (C, u00109, "system__interrupt_managementB");
   u00110 : constant Version_32 := 16#ef0526ae#;
   pragma Export (C, u00110, "system__interrupt_managementS");
   u00111 : constant Version_32 := 16#f65595cf#;
   pragma Export (C, u00111, "system__multiprocessorsB");
   u00112 : constant Version_32 := 16#7e997377#;
   pragma Export (C, u00112, "system__multiprocessorsS");
   u00113 : constant Version_32 := 16#51f2d040#;
   pragma Export (C, u00113, "system__os_primitivesB");
   u00114 : constant Version_32 := 16#41c889f2#;
   pragma Export (C, u00114, "system__os_primitivesS");
   u00115 : constant Version_32 := 16#375a3ef7#;
   pragma Export (C, u00115, "system__task_infoB");
   u00116 : constant Version_32 := 16#d7a1ab61#;
   pragma Export (C, u00116, "system__task_infoS");
   u00117 : constant Version_32 := 16#f2eb7df6#;
   pragma Export (C, u00117, "system__tasking__debugB");
   u00118 : constant Version_32 := 16#6502a0c1#;
   pragma Export (C, u00118, "system__tasking__debugS");
   u00119 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00119, "system__concat_2B");
   u00120 : constant Version_32 := 16#44953bd4#;
   pragma Export (C, u00120, "system__concat_2S");
   u00121 : constant Version_32 := 16#2b70b149#;
   pragma Export (C, u00121, "system__concat_3B");
   u00122 : constant Version_32 := 16#4d45b0a1#;
   pragma Export (C, u00122, "system__concat_3S");
   u00123 : constant Version_32 := 16#273384e4#;
   pragma Export (C, u00123, "system__img_enum_newB");
   u00124 : constant Version_32 := 16#2779eac4#;
   pragma Export (C, u00124, "system__img_enum_newS");
   u00125 : constant Version_32 := 16#9dca6636#;
   pragma Export (C, u00125, "system__img_lliB");
   u00126 : constant Version_32 := 16#577ab9d5#;
   pragma Export (C, u00126, "system__img_lliS");
   u00127 : constant Version_32 := 16#6ec3c867#;
   pragma Export (C, u00127, "system__stack_usageB");
   u00128 : constant Version_32 := 16#3a3ac346#;
   pragma Export (C, u00128, "system__stack_usageS");
   u00129 : constant Version_32 := 16#d398a95f#;
   pragma Export (C, u00129, "ada__tagsB");
   u00130 : constant Version_32 := 16#12a0afb8#;
   pragma Export (C, u00130, "ada__tagsS");
   u00131 : constant Version_32 := 16#796f31f1#;
   pragma Export (C, u00131, "system__htableB");
   u00132 : constant Version_32 := 16#c2f75fee#;
   pragma Export (C, u00132, "system__htableS");
   u00133 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00133, "system__string_hashB");
   u00134 : constant Version_32 := 16#60a93490#;
   pragma Export (C, u00134, "system__string_hashS");
   u00135 : constant Version_32 := 16#5a0abd65#;
   pragma Export (C, u00135, "feature_testB");
   u00136 : constant Version_32 := 16#1ba01ee9#;
   pragma Export (C, u00136, "feature_testS");
   u00137 : constant Version_32 := 16#351539c5#;
   pragma Export (C, u00137, "ada__strings__unboundedB");
   u00138 : constant Version_32 := 16#6552cb60#;
   pragma Export (C, u00138, "ada__strings__unboundedS");
   u00139 : constant Version_32 := 16#60da0992#;
   pragma Export (C, u00139, "ada__strings__searchB");
   u00140 : constant Version_32 := 16#c1ab8667#;
   pragma Export (C, u00140, "ada__strings__searchS");
   u00141 : constant Version_32 := 16#acee74ad#;
   pragma Export (C, u00141, "system__compare_array_unsigned_8B");
   u00142 : constant Version_32 := 16#ef369d89#;
   pragma Export (C, u00142, "system__compare_array_unsigned_8S");
   u00143 : constant Version_32 := 16#a8025f3c#;
   pragma Export (C, u00143, "system__address_operationsB");
   u00144 : constant Version_32 := 16#55395237#;
   pragma Export (C, u00144, "system__address_operationsS");
   u00145 : constant Version_32 := 16#2e260032#;
   pragma Export (C, u00145, "system__storage_pools__subpoolsB");
   u00146 : constant Version_32 := 16#cc5a1856#;
   pragma Export (C, u00146, "system__storage_pools__subpoolsS");
   u00147 : constant Version_32 := 16#d96e3c40#;
   pragma Export (C, u00147, "system__finalization_mastersB");
   u00148 : constant Version_32 := 16#1dc9d5ce#;
   pragma Export (C, u00148, "system__finalization_mastersS");
   u00149 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00149, "system__img_boolB");
   u00150 : constant Version_32 := 16#b3ec9def#;
   pragma Export (C, u00150, "system__img_boolS");
   u00151 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00151, "ada__finalizationS");
   u00152 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00152, "ada__streamsB");
   u00153 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00153, "ada__streamsS");
   u00154 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00154, "system__finalization_rootB");
   u00155 : constant Version_32 := 16#09c79f94#;
   pragma Export (C, u00155, "system__finalization_rootS");
   u00156 : constant Version_32 := 16#6d4d969a#;
   pragma Export (C, u00156, "system__storage_poolsB");
   u00157 : constant Version_32 := 16#65d872a9#;
   pragma Export (C, u00157, "system__storage_poolsS");
   u00158 : constant Version_32 := 16#84042202#;
   pragma Export (C, u00158, "system__storage_pools__subpools__finalizationB");
   u00159 : constant Version_32 := 16#fe2f4b3a#;
   pragma Export (C, u00159, "system__storage_pools__subpools__finalizationS");
   u00160 : constant Version_32 := 16#020a3f4d#;
   pragma Export (C, u00160, "system__atomic_countersB");
   u00161 : constant Version_32 := 16#f269c189#;
   pragma Export (C, u00161, "system__atomic_countersS");
   u00162 : constant Version_32 := 16#039168f8#;
   pragma Export (C, u00162, "system__stream_attributesB");
   u00163 : constant Version_32 := 16#8bc30a4e#;
   pragma Export (C, u00163, "system__stream_attributesS");
   u00164 : constant Version_32 := 16#85543a1c#;
   pragma Export (C, u00164, "step_definitionsB");
   u00165 : constant Version_32 := 16#4cad658f#;
   pragma Export (C, u00165, "step_definitionsS");
   u00166 : constant Version_32 := 16#e0e0ca3a#;
   pragma Export (C, u00166, "regulS");
   u00167 : constant Version_32 := 16#df13de64#;
   pragma Export (C, u00167, "regul__rampsB");
   u00168 : constant Version_32 := 16#db90afd7#;
   pragma Export (C, u00168, "regul__rampsS");
   u00169 : constant Version_32 := 16#f4e097a7#;
   pragma Export (C, u00169, "ada__text_ioB");
   u00170 : constant Version_32 := 16#777d5329#;
   pragma Export (C, u00170, "ada__text_ioS");
   u00171 : constant Version_32 := 16#73d2d764#;
   pragma Export (C, u00171, "interfaces__c_streamsB");
   u00172 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00172, "interfaces__c_streamsS");
   u00173 : constant Version_32 := 16#ec083f01#;
   pragma Export (C, u00173, "system__file_ioB");
   u00174 : constant Version_32 := 16#e1440d61#;
   pragma Export (C, u00174, "system__file_ioS");
   u00175 : constant Version_32 := 16#bbaa76ac#;
   pragma Export (C, u00175, "system__file_control_blockS");
   u00176 : constant Version_32 := 16#608e2cd1#;
   pragma Export (C, u00176, "system__concat_5B");
   u00177 : constant Version_32 := 16#c16baf2a#;
   pragma Export (C, u00177, "system__concat_5S");
   u00178 : constant Version_32 := 16#932a4690#;
   pragma Export (C, u00178, "system__concat_4B");
   u00179 : constant Version_32 := 16#3851c724#;
   pragma Export (C, u00179, "system__concat_4S");
   u00180 : constant Version_32 := 16#8aa4f090#;
   pragma Export (C, u00180, "system__img_realB");
   u00181 : constant Version_32 := 16#819dbde6#;
   pragma Export (C, u00181, "system__img_realS");
   u00182 : constant Version_32 := 16#42a257f7#;
   pragma Export (C, u00182, "system__fat_llfS");
   u00183 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00183, "system__float_controlB");
   u00184 : constant Version_32 := 16#a6c9af38#;
   pragma Export (C, u00184, "system__float_controlS");
   u00185 : constant Version_32 := 16#3e932977#;
   pragma Export (C, u00185, "system__img_lluB");
   u00186 : constant Version_32 := 16#3b7a9044#;
   pragma Export (C, u00186, "system__img_lluS");
   u00187 : constant Version_32 := 16#16458a73#;
   pragma Export (C, u00187, "system__powten_tableS");
   u00188 : constant Version_32 := 16#c5134340#;
   pragma Export (C, u00188, "system__val_realB");
   u00189 : constant Version_32 := 16#484a00d1#;
   pragma Export (C, u00189, "system__val_realS");
   u00190 : constant Version_32 := 16#b2a569d2#;
   pragma Export (C, u00190, "system__exn_llfB");
   u00191 : constant Version_32 := 16#fa4b57d8#;
   pragma Export (C, u00191, "system__exn_llfS");
   u00192 : constant Version_32 := 16#88a20b05#;
   pragma Export (C, u00192, "xreqlibS");
   u00193 : constant Version_32 := 16#366d6406#;
   pragma Export (C, u00193, "xreqlib__assertsB");
   u00194 : constant Version_32 := 16#0740edbd#;
   pragma Export (C, u00194, "xreqlib__assertsS");
   u00195 : constant Version_32 := 16#46b1f5ea#;
   pragma Export (C, u00195, "system__concat_8B");
   u00196 : constant Version_32 := 16#a532a1d3#;
   pragma Export (C, u00196, "system__concat_8S");
   u00197 : constant Version_32 := 16#46899fd1#;
   pragma Export (C, u00197, "system__concat_7B");
   u00198 : constant Version_32 := 16#baf2b71b#;
   pragma Export (C, u00198, "system__concat_7S");
   u00199 : constant Version_32 := 16#a83b7c85#;
   pragma Export (C, u00199, "system__concat_6B");
   u00200 : constant Version_32 := 16#94f2c1b6#;
   pragma Export (C, u00200, "system__concat_6S");
   u00201 : constant Version_32 := 16#c471e067#;
   pragma Export (C, u00201, "xreqlib__asserts__floatB");
   u00202 : constant Version_32 := 16#20b45cee#;
   pragma Export (C, u00202, "xreqlib__asserts__floatS");
   u00203 : constant Version_32 := 16#bf363ed2#;
   pragma Export (C, u00203, "ada__strings__fixedB");
   u00204 : constant Version_32 := 16#fec1aafc#;
   pragma Export (C, u00204, "ada__strings__fixedS");
   u00205 : constant Version_32 := 16#edb158dc#;
   pragma Export (C, u00205, "xreqlib__asserts__generic_floating_pointB");
   u00206 : constant Version_32 := 16#e4c5bc89#;
   pragma Export (C, u00206, "xreqlib__asserts__generic_floating_pointS");
   u00207 : constant Version_32 := 16#05512278#;
   pragma Export (C, u00207, "xreqlib__comparisonsS");
   u00208 : constant Version_32 := 16#3b5d94b4#;
   pragma Export (C, u00208, "xreqlib__comparisons__generic_floating_pointB");
   u00209 : constant Version_32 := 16#5f87e41a#;
   pragma Export (C, u00209, "xreqlib__comparisons__generic_floating_pointS");
   u00210 : constant Version_32 := 16#a56e241a#;
   pragma Export (C, u00210, "xreqlib__variablesB");
   u00211 : constant Version_32 := 16#d32fa600#;
   pragma Export (C, u00211, "xreqlib__variablesS");
   u00212 : constant Version_32 := 16#c164a034#;
   pragma Export (C, u00212, "ada__containers__hash_tablesS");
   u00213 : constant Version_32 := 16#bcec81df#;
   pragma Export (C, u00213, "ada__containers__helpersB");
   u00214 : constant Version_32 := 16#4adfc5eb#;
   pragma Export (C, u00214, "ada__containers__helpersS");
   u00215 : constant Version_32 := 16#c24eaf4d#;
   pragma Export (C, u00215, "ada__containers__prime_numbersB");
   u00216 : constant Version_32 := 16#6d3af8ed#;
   pragma Export (C, u00216, "ada__containers__prime_numbersS");
   u00217 : constant Version_32 := 16#5a895de2#;
   pragma Export (C, u00217, "system__pool_globalB");
   u00218 : constant Version_32 := 16#7141203e#;
   pragma Export (C, u00218, "system__pool_globalS");
   u00219 : constant Version_32 := 16#e31b7c4e#;
   pragma Export (C, u00219, "system__memoryB");
   u00220 : constant Version_32 := 16#1f488a30#;
   pragma Export (C, u00220, "system__memoryS");
   u00221 : constant Version_32 := 16#203b8c49#;
   pragma Export (C, u00221, "system__strings__stream_opsB");
   u00222 : constant Version_32 := 16#ec029138#;
   pragma Export (C, u00222, "system__strings__stream_opsS");
   u00223 : constant Version_32 := 16#dcdc2328#;
   pragma Export (C, u00223, "xreqlib__string_hashB");
   u00224 : constant Version_32 := 16#47780136#;
   pragma Export (C, u00224, "xreqlib__string_hashS");
   u00225 : constant Version_32 := 16#d79aa14a#;
   pragma Export (C, u00225, "xreqlib__comparisons__tolerance_detectionB");
   u00226 : constant Version_32 := 16#68aeed95#;
   pragma Export (C, u00226, "xreqlib__comparisons__tolerance_detectionS");
   u00227 : constant Version_32 := 16#352f7eb1#;
   pragma Export (C, u00227, "xreqlib__argsB");
   u00228 : constant Version_32 := 16#52c2e1eb#;
   pragma Export (C, u00228, "xreqlib__argsS");
   u00229 : constant Version_32 := 16#a66a18ed#;
   pragma Export (C, u00229, "xreqlib__containersS");
   u00230 : constant Version_32 := 16#012b84c7#;
   pragma Export (C, u00230, "xreqlib__string_tablesB");
   u00231 : constant Version_32 := 16#6cb3448d#;
   pragma Export (C, u00231, "xreqlib__string_tablesS");
   u00232 : constant Version_32 := 16#0f9783a4#;
   pragma Export (C, u00232, "system__val_intB");
   u00233 : constant Version_32 := 16#f3ca8567#;
   pragma Export (C, u00233, "system__val_intS");
   u00234 : constant Version_32 := 16#383fd226#;
   pragma Export (C, u00234, "system__val_unsB");
   u00235 : constant Version_32 := 16#47b5ed3e#;
   pragma Export (C, u00235, "system__val_unsS");
   u00236 : constant Version_32 := 16#91144734#;
   pragma Export (C, u00236, "xreqlib__tablesB");
   u00237 : constant Version_32 := 16#d515eef1#;
   pragma Export (C, u00237, "xreqlib__tablesS");
   u00238 : constant Version_32 := 16#8225628b#;
   pragma Export (C, u00238, "ada__containers__red_black_treesS");
   u00239 : constant Version_32 := 16#78cb869e#;
   pragma Export (C, u00239, "system__concat_9B");
   u00240 : constant Version_32 := 16#9a7fd820#;
   pragma Export (C, u00240, "system__concat_9S");
   u00241 : constant Version_32 := 16#48862aff#;
   pragma Export (C, u00241, "xreqlib__registerB");
   u00242 : constant Version_32 := 16#3dd88383#;
   pragma Export (C, u00242, "xreqlib__registerS");
   u00243 : constant Version_32 := 16#c305dc62#;
   pragma Export (C, u00243, "xreqlib__formatB");
   u00244 : constant Version_32 := 16#93b0ecdf#;
   pragma Export (C, u00244, "xreqlib__formatS");
   u00245 : constant Version_32 := 16#a36d4ac3#;
   pragma Export (C, u00245, "xreqlib__reportB");
   u00246 : constant Version_32 := 16#3c5fd0f4#;
   pragma Export (C, u00246, "xreqlib__reportS");
   u00247 : constant Version_32 := 16#64355e67#;
   pragma Export (C, u00247, "xreqlib__cliB");
   u00248 : constant Version_32 := 16#937386c8#;
   pragma Export (C, u00248, "xreqlib__cliS");
   u00249 : constant Version_32 := 16#b5988c27#;
   pragma Export (C, u00249, "gnatS");
   u00250 : constant Version_32 := 16#08e6068b#;
   pragma Export (C, u00250, "gnat__command_lineB");
   u00251 : constant Version_32 := 16#d602660e#;
   pragma Export (C, u00251, "gnat__command_lineS");
   u00252 : constant Version_32 := 16#9321d98c#;
   pragma Export (C, u00252, "gnat__directory_operationsB");
   u00253 : constant Version_32 := 16#8f1a5551#;
   pragma Export (C, u00253, "gnat__directory_operationsS");
   u00254 : constant Version_32 := 16#ef2c0748#;
   pragma Export (C, u00254, "gnat__os_libS");
   u00255 : constant Version_32 := 16#40fe4806#;
   pragma Export (C, u00255, "gnat__regexpS");
   u00256 : constant Version_32 := 16#95f86c43#;
   pragma Export (C, u00256, "system__regexpB");
   u00257 : constant Version_32 := 16#65074bc8#;
   pragma Export (C, u00257, "system__regexpS");
   u00258 : constant Version_32 := 16#fcd606d0#;
   pragma Export (C, u00258, "gnat__stringsS");
   u00259 : constant Version_32 := 16#1340ad7c#;
   pragma Export (C, u00259, "xreqlib__ansiB");
   u00260 : constant Version_32 := 16#6258ce33#;
   pragma Export (C, u00260, "xreqlib__ansiS");
   u00261 : constant Version_32 := 16#47a94a8f#;
   pragma Export (C, u00261, "xreqlib__error_handlingB");
   u00262 : constant Version_32 := 16#3e198be2#;
   pragma Export (C, u00262, "xreqlib__error_handlingS");
   u00263 : constant Version_32 := 16#d68961e2#;
   pragma Export (C, u00263, "xreqlib__format__htmlB");
   u00264 : constant Version_32 := 16#96fb4933#;
   pragma Export (C, u00264, "xreqlib__format__htmlS");
   u00265 : constant Version_32 := 16#10a32ed5#;
   pragma Export (C, u00265, "xreqlib__format_html_templateB");
   u00266 : constant Version_32 := 16#c1e76384#;
   pragma Export (C, u00266, "xreqlib__format_html_templateS");
   u00267 : constant Version_32 := 16#55a13880#;
   pragma Export (C, u00267, "xreqlib__standard_ioB");
   u00268 : constant Version_32 := 16#1abf910c#;
   pragma Export (C, u00268, "xreqlib__standard_ioS");
   u00269 : constant Version_32 := 16#f670262a#;
   pragma Export (C, u00269, "xreqlib__ioS");
   u00270 : constant Version_32 := 16#835d255c#;
   pragma Export (C, u00270, "xreqlib__format__baseB");
   u00271 : constant Version_32 := 16#4042906c#;
   pragma Export (C, u00271, "xreqlib__format__baseS");
   u00272 : constant Version_32 := 16#e54d53d3#;
   pragma Export (C, u00272, "xreqlib__format__multiB");
   u00273 : constant Version_32 := 16#0d38c0a1#;
   pragma Export (C, u00273, "xreqlib__format__multiS");
   u00274 : constant Version_32 := 16#224714e5#;
   pragma Export (C, u00274, "xreqlib__format__textB");
   u00275 : constant Version_32 := 16#78aadcc5#;
   pragma Export (C, u00275, "xreqlib__format__textS");
   u00276 : constant Version_32 := 16#4b8413c6#;
   pragma Export (C, u00276, "xreqlib__utilB");
   u00277 : constant Version_32 := 16#b86b53fa#;
   pragma Export (C, u00277, "xreqlib__utilS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.atomic_counters%s
   --  system.atomic_counters%b
   --  system.exn_llf%s
   --  system.exn_llf%b
   --  system.float_control%s
   --  system.float_control%b
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.io%s
   --  system.io%b
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.powten_table%s
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.stack_usage%s
   --  system.stack_usage%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.img_llu%s
   --  system.img_llu%b
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.concat_4%s
   --  system.concat_4%b
   --  system.concat_5%s
   --  system.concat_5%b
   --  system.concat_6%s
   --  system.concat_6%b
   --  system.concat_7%s
   --  system.concat_7%b
   --  system.concat_8%s
   --  system.concat_8%b
   --  system.concat_9%s
   --  system.concat_9%b
   --  system.traceback%s
   --  system.traceback%b
   --  ada.characters.handling%s
   --  system.case_util%s
   --  system.os_lib%s
   --  system.secondary_stack%s
   --  system.standard_library%s
   --  ada.exceptions%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.soft_links%s
   --  system.val_lli%s
   --  system.val_llu%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.traceback%b
   --  system.address_image%s
   --  system.address_image%b
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.bounded_strings%s
   --  system.bounded_strings%b
   --  system.case_util%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.containers%s
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.maps%b
   --  ada.strings.maps.constants%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  ada.characters.handling%b
   --  system.exception_traces%s
   --  system.exception_traces%b
   --  system.memory%s
   --  system.memory%b
   --  system.mmap%s
   --  system.mmap.os_interface%s
   --  system.mmap%b
   --  system.mmap.unix%s
   --  system.mmap.os_interface%b
   --  system.object_reader%s
   --  system.object_reader%b
   --  system.dwarf_lines%s
   --  system.dwarf_lines%b
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  system.standard_library%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  system.val_lli%b
   --  system.val_llu%b
   --  ada.command_line%s
   --  ada.command_line%b
   --  ada.containers.prime_numbers%s
   --  ada.containers.prime_numbers%b
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.strings.fixed%s
   --  ada.strings.fixed%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.streams%s
   --  ada.streams%b
   --  gnat%s
   --  gnat.os_lib%s
   --  gnat.strings%s
   --  system.fat_llf%s
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.containers.helpers%s
   --  ada.containers.helpers%b
   --  ada.containers.hash_tables%s
   --  ada.containers.red_black_trees%s
   --  system.file_io%s
   --  system.file_io%b
   --  system.img_real%s
   --  system.img_real%b
   --  system.linux%s
   --  system.multiprocessors%s
   --  system.multiprocessors%b
   --  system.os_constants%s
   --  system.os_interface%s
   --  system.os_interface%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.finalization_masters%b
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  system.storage_pools.subpools%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  ada.strings.unbounded%s
   --  ada.strings.unbounded%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.task_primitives%s
   --  system.interrupt_management%s
   --  system.interrupt_management%b
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.task_primitives.operations%b
   --  system.tasking%b
   --  system.val_real%s
   --  system.val_real%b
   --  system.val_uns%s
   --  system.val_uns%b
   --  system.val_int%s
   --  system.val_int%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  gnat.directory_operations%s
   --  gnat.directory_operations%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.regexp%s
   --  system.regexp%b
   --  gnat.regexp%s
   --  gnat.command_line%s
   --  gnat.command_line%b
   --  system.strings.stream_ops%s
   --  system.strings.stream_ops%b
   --  xreqlib%s
   --  regul%s
   --  regul.ramps%s
   --  regul.ramps%b
   --  xreqlib.ansi%s
   --  xreqlib.ansi%b
   --  xreqlib.asserts%s
   --  xreqlib.asserts%b
   --  xreqlib.comparisons%s
   --  xreqlib.comparisons.tolerance_detection%s
   --  xreqlib.comparisons.tolerance_detection%b
   --  xreqlib.containers%s
   --  xreqlib.error_handling%s
   --  xreqlib.error_handling%b
   --  xreqlib.format_html_template%s
   --  xreqlib.format_html_template%b
   --  xreqlib.io%s
   --  xreqlib.report%s
   --  xreqlib.report%b
   --  xreqlib.standard_io%s
   --  xreqlib.standard_io%b
   --  xreqlib.string_hash%s
   --  xreqlib.string_hash%b
   --  xreqlib.tables%s
   --  xreqlib.tables%b
   --  xreqlib.string_tables%s
   --  xreqlib.string_tables%b
   --  xreqlib.util%s
   --  xreqlib.util%b
   --  xreqlib.variables%s
   --  xreqlib.variables%b
   --  xreqlib.args%s
   --  xreqlib.args%b
   --  xreqlib.comparisons.generic_floating_point%s
   --  xreqlib.comparisons.generic_floating_point%b
   --  xreqlib.asserts.generic_floating_point%s
   --  xreqlib.asserts.generic_floating_point%b
   --  xreqlib.asserts.float%s
   --  xreqlib.asserts.float%b
   --  step_definitions%s
   --  step_definitions%b
   --  xreqlib.format%s
   --  xreqlib.format%b
   --  xreqlib.format.base%s
   --  xreqlib.format.base%b
   --  xreqlib.format.html%s
   --  xreqlib.format.html%b
   --  xreqlib.format.multi%s
   --  xreqlib.format.multi%b
   --  xreqlib.format.text%s
   --  xreqlib.format.text%b
   --  xreqlib.cli%s
   --  xreqlib.cli%b
   --  xreqlib.register%s
   --  xreqlib.register%b
   --  feature_test%s
   --  feature_test%b
   --  regul_tests%b
   --  END ELABORATION ORDER

end ada_main;
