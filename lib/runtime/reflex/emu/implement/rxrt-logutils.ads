------------------------------------------------------------------------------
--                                                                          --
--                         REFLEX COMPILER COMPONENTS                       --
--                                                                          --
--          Copyright (C) 1992-2011, Free Software Foundation, Inc.         --
--                                                                          --
-- Reflex is free software; you can redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware Foundation; either version 3, or (at your option) any later version --
-- Reflex is distributed in the hope that it will be useful, but WITH-      --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License --
-- for  more details.  You should have  received  a copy of the GNU General --
-- Public License distributed with Reflex; see file COPYING3. If not, go to --
-- http://www.gnu.org/licenses for a complete copy of the license.          --
--                                                                          --
-- Reflex is originally developed  by the Artics team at Grenoble.          --
--                                                                          --
------------------------------------------------------------------------------

package Rxrt.Logutils is

   procedure Create_Loginfos_File (File_Name : String);
   procedure Close_Loginfos_File;
   
   procedure Log_Line (Msg : String);
   procedure Log_New_Line;
   
   pragma Export (Ada, Create_Loginfos_File, "Rxrt_Create_Loginfos_File");
   pragma Export (Ada, Close_Loginfos_File,  "Rxrt_Close_Loginfos_File");
   pragma Export (Ada, Log_Line,             "Rxrt_Log_Line");
   pragma Export (Ada, Log_New_Line,         "Rxrt_Log_New_Line");
      
end Rxrt.Logutils;
