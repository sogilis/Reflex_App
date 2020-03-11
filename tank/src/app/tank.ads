------------------------------------------------------------------------------
--                                                                          --
--                         REFLEX EXAMPLES                                  --
--                                                                          --
--          Copyright (C) 1992-2011, Free Software Foundation, Inc.         --
--                                                                          --
-- Reflex is free software; you can redistribute it  and/or modify it under --
-- terms of the  GNU General Public Licensea as published  by the Free Soft- --
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

package Tank is
   
   V1_R1 : Valve_Record; 
   -- Tank1's outlet valve
   
   V2_R1 : Valve_Record;  
   -- Pump P1's outlet valve
   
   V1_R2 : Valve_Record; 
   -- Tank2's outlet valve   
   
   V2_R2 : Valve_Record; 
   -- Pump P2's outlet valve
   
   V1_R3 : Valve_Record; 
   -- Tank3's outlet valve  
   
   V2_R3 : Valve_Record;
   -- Pump P3's outlet valve
   
   P1 : Pump_Record; 
   -- Tank1's outlet pump  
   
   P2 : Pump_Record;
   -- Tank2's outlet pump 
   
   P3 : Pump_Record;  
   -- Tank3's outlet pump
   
   Blender : Blender_Record;  
   -- Blender
   
   Resistance : Resistance_Record; 
   -- Resistance to heat the tank3'product
   
end Tank;
